import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/controllers/services_controller.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class TechnologiesSection extends GetView<ServicesController> {
  const TechnologiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'Technologies We Use',
      subtitle: 'We leverage the best technologies to deliver high-quality solutions',
      backgroundColor: AppTheme.lightColor,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 60),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildTechnologiesGrid(context),
        ],
      ),
    );
  }

  Widget _buildTechnologiesGrid(BuildContext context) {
    final technologies = [
      {'name': 'Flutter', 'icon': Icons.flutter_dash},
      {'name': 'React', 'icon': Icons.code},
      {'name': 'Node.js', 'icon': Icons.memory},
      {'name': 'Python', 'icon': Icons.code},
      {'name': 'AWS', 'icon': Icons.cloud},
      {'name': 'Firebase', 'icon': Icons.whatshot},
      {'name': 'MongoDB', 'icon': Icons.storage},
      {'name': 'Docker', 'icon': Icons.directions_boat},
    ];

    int crossAxisCount = ResponsiveUtils.isMobile(context) 
        ? 2 
        : ResponsiveUtils.isTablet(context) 
            ? 3 
            : 4;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.0,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: technologies.length,
      itemBuilder: (context, index) {
        final tech = technologies[index];
        return FadeInUp(
          delay: Duration(milliseconds: index * 100),
          child: _buildTechItem(tech['name'] as String, tech['icon'] as IconData),
        );
      },
    );
  }

  Widget _buildTechItem(String name, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: AppTheme.primaryBlue,
          ),
          const SizedBox(height: 16),
          CustomText.headlineSmall(
            name,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 