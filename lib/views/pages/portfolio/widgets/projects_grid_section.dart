import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/controllers/portfolio_controller.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class ProjectsGridSection extends GetView<PortfolioController> {
  const ProjectsGridSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: Column(
          children: [
            _buildProjectsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    // Determine grid layout based on screen size
    int crossAxisCount;
    double childAspectRatio;
    double crossAxisSpacing;
    double mainAxisSpacing;

    if (ResponsiveUtils.isMobile(context)) {
      crossAxisCount = 1;
      childAspectRatio = 1.0;
      crossAxisSpacing = 20;
      mainAxisSpacing = 20;
    } else if (ResponsiveUtils.isTablet(context)) {
      crossAxisCount = 2;
      childAspectRatio = 1.0;
      crossAxisSpacing = 24;
      mainAxisSpacing = 24;
    } else {
      crossAxisCount = 3;
      childAspectRatio = 1.0;
      crossAxisSpacing = 30;
      mainAxisSpacing = 30;
    }

    return Obx(() {
      final filteredProjects = controller.filteredProjects;
      
      if (filteredProjects.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Icon(
                  Icons.search_off,
                  size: 64,
                  color: AppTheme.mediumColor.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                CustomText.headlineSmall(
                  'No projects found in this category',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                CustomText.bodyMedium(
                  'Try selecting a different category',
                  color: AppTheme.mediumColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }
      
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        itemCount: filteredProjects.length,
        itemBuilder: (context, index) {
          final project = filteredProjects[index];
          return FadeInUp(
            delay: Duration(milliseconds: index * 100),
            child: _buildProjectCard(context, project),
          );
        },
      );
    });
  }

  Widget _buildProjectCard(BuildContext context, project) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _showProjectDetails(context, project),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project image
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue.withOpacity(0.1),
                      image: DecorationImage(
                        image: AssetImage(project.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: CustomText.bodySmall(
                              project.category,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Project details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.headlineSmall(project.title),
                      const SizedBox(height: 8),
                      CustomText.bodyMedium(
                        project.description,
                        color: AppTheme.mediumColor,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(BuildContext context, project) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: ResponsiveUtils.isMobile(context)
              ? double.infinity
              : MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxWidth: 1000,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    project.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.headlineLarge(project.title),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: CustomText.bodySmall(
                            project.category,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomText.bodyLarge(
                          project.description,
                          color: AppTheme.textDark,
                        ),
                        const SizedBox(height: 24),
                        
                        // Client info
                        if (project.clientName != null) ...[
                          _buildDetailRow(
                            'Client:',
                            project.clientName!,
                          ),
                          const SizedBox(height: 16),
                        ],
                        
                        if (project.projectUrl != null) ...[
                          _buildDetailRow(
                            'Project URL:',
                            project.projectUrl!,
                            isLink: true,
                          ),
                          const SizedBox(height: 16),
                        ],
                        
                        // Technologies
                        if (project.technologies != null &&
                            project.technologies!.isNotEmpty) ...[
                          CustomText.headlineSmall('Technologies Used'),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: project.technologies!.map((tech) {
                              return Chip(
                                label: CustomText.bodySmall(
                                  tech,
                                  color: AppTheme.textDark,
                                ),
                                backgroundColor: AppTheme.lightColor,
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                
                // Close button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isLink = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: CustomText.bodyMedium(
            label,
            color: AppTheme.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: isLink
              ? GestureDetector(
                  onTap: () {},
                  child: CustomText.bodyMedium(
                    value,
                    color: AppTheme.primaryBlue,
                  ),
                )
              : CustomText.bodyMedium(
                  value,
                  color: AppTheme.textDark,
                ),
        ),
      ],
    );
  }
} 