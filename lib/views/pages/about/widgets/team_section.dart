import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/controllers/about_controller.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class TeamSection extends GetView<AboutController> {
  const TeamSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: TextConstants.teamTitle,
      subtitle: TextConstants.teamSubtitle,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Obx(() => _buildTeamGrid(context, controller.teamMembers)),
        ],
      ),
    );
  }

  Widget _buildTeamGrid(BuildContext context, List teamMembers) {
    int crossAxisCount;
    double childAspectRatio;
    double crossAxisSpacing;
    double mainAxisSpacing;

    // Adjust aspect ratio to give more vertical space for content
    if (ResponsiveUtils.isMobile(context)) {
      crossAxisCount = 1;
      childAspectRatio = 0.7;  // Slightly more height for mobile
      crossAxisSpacing = 20;
      mainAxisSpacing = 32;
    } else if (ResponsiveUtils.isTablet(context)) {
      crossAxisCount = 2;
      childAspectRatio = 0.65;  
      crossAxisSpacing = 24;
      mainAxisSpacing = 32;
    } else {
      crossAxisCount = 4;
      childAspectRatio = 0.6;  // Reduced for more height in desktop view
      crossAxisSpacing = 32;
      mainAxisSpacing = 40;
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
      itemCount: teamMembers.length,
      itemBuilder: (context, index) {
        final member = teamMembers[index];
        return FadeInUp(
          delay: Duration(milliseconds: index * 200),
          child: _buildTeamMemberCard(context, member),
        );
      },
    );
  }

  Widget _buildTeamMemberCard(BuildContext context, member) {
    // Fixed image ratio (will be a square)
    const double imageAspectRatio = 1.0;
    
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Team member image (fixed ratio)
          AspectRatio(
            aspectRatio: imageAspectRatio,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: AppTheme.primaryBlue.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  member.imageUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: AppTheme.primaryBlue.withOpacity(0.6),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          
          // Team member info container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Name
                  SizedBox(
                    height: 24,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CustomText.headlineSmall(
                        member.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  
                  // Position
                  SizedBox(
                    height: 20,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CustomText.bodyMedium(
                        member.position,
                        color: AppTheme.primaryBlue,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Bio - Calculate available space for bio
                  Expanded(
                    child: Center(
                      child: CustomText.bodySmall(
                        member.bio,
                        color: AppTheme.mediumColor,
                        textAlign: TextAlign.center,
                        // Ensure bio is visible in all views
                        maxLines: _getMaxLines(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  
                  // Social links at bottom
                  SizedBox(
                    height: 36,
                    child: _buildSocialLinks(member.socialLinks),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Determine max lines based on screen size
  int _getMaxLines(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) {
      return 3; // More lines for mobile 
    } else if (ResponsiveUtils.isTablet(context)) {
      return 3; // Medium for tablet
    } else {
      return 2; // Laptops/Desktops with 4 cards per row need fewer lines
    }
  }

  Widget _buildSocialLinks(Map<String, String> socialLinks) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: socialLinks.entries.map((entry) {
        IconData icon = Icons.link;
        
        if (entry.key == 'linkedin') {
          icon = Icons.facebook;
        } else if (entry.key == 'github') {
          icon = Icons.code;
        } else if (entry.key == 'twitter') {
          icon = Icons.android;
        } else if (entry.key == 'dribbble') {
          icon = Icons.sports_basketball;
        }
        
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: InkWell(
            onTap: () => launch(entry.value),
            customBorder: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: AppTheme.primaryBlue.withOpacity(0.8),
                size: 20,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
  
  void launch(String url) {
    // Handle URL launching (later this can be replaced with a proper URL launcher)
    print('Launching URL: $url');
  }
} 