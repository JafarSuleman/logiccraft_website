import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'Additional Contact Information',
      subtitle: 'More ways to reach us and visit our office',
      backgroundColor: AppTheme.backgroundLight,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 60),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          ResponsiveUtils.isMobile(context)
              ? _buildMobileLayout()
              : _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoCard(
          icon: Icons.location_on_outlined,
          title: TextConstants.addressLabel,
          content: AppConstants.address,
          delay: 0,
        ),
        _buildInfoCard(
          icon: Icons.schedule_outlined,
          title: 'Business Hours',
          content: 'Monday - Friday: 9:00 AM - 6:00 PM\nWeekends: Closed',
          delay: 200,
        ),
        _buildInfoCard(
          icon: Icons.support_agent_outlined,
          title: 'Support',
          content: '${AppConstants.email}\n${AppConstants.phone}',
          delay: 400,
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildInfoCard(
          icon: Icons.location_on_outlined,
          title: TextConstants.addressLabel,
          content: AppConstants.address,
          delay: 0,
        ),
        const SizedBox(height: 30),
        _buildInfoCard(
          icon: Icons.schedule_outlined,
          title: 'Business Hours',
          content: 'Monday - Friday: 9:00 AM - 6:00 PM\nWeekends: Closed',
          delay: 100,
        ),
        const SizedBox(height: 30),
        _buildInfoCard(
          icon: Icons.support_agent_outlined,
          title: 'Support',
          content: '${AppConstants.email}\n${AppConstants.phone}',
          delay: 200,
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required int delay,
  }) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 800),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: AppTheme.primaryBlue,
            ),
            const SizedBox(height: 16),
            CustomText.headlineSmall(
              title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            CustomText.bodyLarge(
              content,
              textAlign: TextAlign.center,
              color: AppTheme.mediumColor,
            ),
          ],
        ),
      ),
    );
  }
} 