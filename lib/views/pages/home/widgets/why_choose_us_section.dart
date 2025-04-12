import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      backgroundColor: AppTheme.lightColor,
      title: TextConstants.whyChooseUsTitle,
      subtitle: TextConstants.whyChooseUsSubtitle,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          ResponsiveUtils.isMobile(context)
              ? _buildMobileFeatures(context)
              : _buildDesktopFeatures(context),
        ],
      ),
    );
  }

  Widget _buildDesktopFeatures(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildFeatureColumn(context, 0),
        ),
        Expanded(
          child: _buildFeatureColumn(context, 1),
        ),
      ],
    );
  }

  Widget _buildMobileFeatures(BuildContext context) {
    return Column(
      children: [
        _buildFeature(
          context: context,
          icon: Icons.rocket_launch,
          title: TextConstants.featureTitle1,
          description: TextConstants.featureDesc1,
          delay: 200,
        ),
        const SizedBox(height: 32),
        _buildFeature(
          context: context,
          icon: Icons.auto_awesome,
          title: TextConstants.featureTitle2,
          description: TextConstants.featureDesc2,
          delay: 400,
        ),
        const SizedBox(height: 32),
        _buildFeature(
          context: context,
          icon: Icons.verified_user,
          title: TextConstants.featureTitle3,
          description: TextConstants.featureDesc3,
          delay: 600,
        ),
        const SizedBox(height: 32),
        _buildFeature(
          context: context,
          icon: Icons.support_agent,
          title: TextConstants.featureTitle4,
          description: TextConstants.featureDesc4,
          delay: 800,
        ),
      ],
    );
  }

  Widget _buildFeatureColumn(BuildContext context, int column) {
    final features = [
      {
        'icon': Icons.rocket_launch,
        'title': TextConstants.featureTitle1,
        'description': TextConstants.featureDesc1,
        'delay': 200,
      },
      {
        'icon': Icons.auto_awesome,
        'title': TextConstants.featureTitle2,
        'description': TextConstants.featureDesc2,
        'delay': 400,
      },
      {
        'icon': Icons.verified_user,
        'title': TextConstants.featureTitle3,
        'description': TextConstants.featureDesc3,
        'delay': 600,
      },
      {
        'icon': Icons.support_agent,
        'title': TextConstants.featureTitle4,
        'description': TextConstants.featureDesc4,
        'delay': 800,
      },
    ];

    final columnFeatures = column == 0
        ? features.sublist(0, 2)
        : features.sublist(2, 4);

    return Column(
      children: columnFeatures.map((feature) {
        return Column(
          children: [
            _buildFeature(
              context: context,
              icon: feature['icon'] as IconData,
              title: feature['title'] as String,
              description: feature['description'] as String,
              delay: feature['delay'] as int,
            ),
            SizedBox(height: columnFeatures.last == feature ? 0 : 48),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildFeature({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required int delay,
  }) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryBlue,
              size: 28,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.headlineSmall(title),
                const SizedBox(height: 8),
                CustomText.bodyMedium(
                  description,
                  color: AppTheme.mediumColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 