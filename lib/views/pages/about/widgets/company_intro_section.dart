import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class CompanyIntroSection extends StatelessWidget {
  const CompanyIntroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: TextConstants.aboutTitle,
      subtitle: '',
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ResponsiveUtils.isMobile(context)
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company image - left side
        Expanded(
          flex: 5,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: _buildCompanyImage(),
          ),
        ),
        
        const SizedBox(width: 60),
        
        // Company description - right side
        Expanded(
          flex: 6,
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: _buildCompanyDescription(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        // Company image
        FadeInDown(
          duration: const Duration(milliseconds: 1000),
          child: _buildCompanyImage(),
        ),
        
        const SizedBox(height: 40),
        
        // Company description
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: _buildCompanyDescription(),
        ),
      ],
    );
  }

  Widget _buildCompanyImage() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          Icons.business,
          size: 120,
          color: AppTheme.primaryBlue.withOpacity(0.6),
        ),
      ),
    );
  }

  Widget _buildCompanyDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.bodyLarge(
          TextConstants.aboutDescription,
          color: AppTheme.mediumColor,
        ),
        const SizedBox(height: 24),
        
        // Key facts about the company
        _buildKeyFact(
          icon: Icons.history,
          title: 'Established in 2020',
          description: 'Founded by a team of passionate developers and designers with a vision to transform the digital landscape.',
        ),
        const SizedBox(height: 20),
        
        _buildKeyFact(
          icon: Icons.location_on,
          title: 'Global Presence',
          description: 'Serving clients worldwide with solutions tailored to their specific regional and business needs.',
        ),
        const SizedBox(height: 20),
        
        _buildKeyFact(
          icon: Icons.trending_up,
          title: 'Continuous Growth',
          description: 'Constantly expanding our capabilities, technologies, and team to better serve our clients.',
        ),
      ],
    );
  }

  Widget _buildKeyFact({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryBlue,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.headlineSmall(title),
              const SizedBox(height: 4),
              CustomText.bodyMedium(
                description,
                color: AppTheme.mediumColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
} 