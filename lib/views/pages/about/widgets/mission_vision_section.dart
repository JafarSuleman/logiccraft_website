import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class MissionVisionSection extends StatelessWidget {
  const MissionVisionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.lightColor,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: Column(
          children: [
            CustomText.headlineMedium(
              'Our Mission & Vision',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ResponsiveUtils.isMobile(context)
                ? _buildMobileLayout()
                : _buildDesktopLayout(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mission - left side
        Expanded(
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: _buildMissionCard(),
          ),
        ),
        
        const SizedBox(width: 30),
        
        // Vision - right side
        Expanded(
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: _buildVisionCard(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Mission
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: _buildMissionCard(),
        ),
        
        const SizedBox(height: 30),
        
        // Vision
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 300),
          child: _buildVisionCard(),
        ),
      ],
    );
  }

  Widget _buildMissionCard() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.flag,
                  color: AppTheme.primaryBlue,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              CustomText.headlineSmall(TextConstants.aboutMissionTitle),
            ],
          ),
          const SizedBox(height: 20),
          CustomText.bodyLarge(
            TextConstants.aboutMissionText,
            color: AppTheme.mediumColor,
          ),
          const SizedBox(height: 24),
          _buildValuesList(),
        ],
      ),
    );
  }

  Widget _buildVisionCard() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.remove_red_eye,
                  color: AppTheme.primaryBlue,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              CustomText.headlineSmall(TextConstants.aboutVisionTitle),
            ],
          ),
          const SizedBox(height: 20),
          CustomText.bodyLarge(
            TextConstants.aboutVisionText,
            color: AppTheme.mediumColor,
          ),
          const SizedBox(height: 40),
          _buildValueTitle(),
        ],
      ),
    );
  }

  Widget _buildValueTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.star,
                color: AppTheme.primaryBlue,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            CustomText.headlineSmall(TextConstants.aboutValuesTitle),
          ],
        ),
      ],
    );
  }

  Widget _buildValuesList() {
    // Split the values string into a list
    final valuesList = TextConstants.aboutValuesList.split(', ');
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: valuesList.map((value) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle,
                color: AppTheme.accentColor,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomText.bodyMedium(
                  value,
                  color: AppTheme.mediumColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
} 