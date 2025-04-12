import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_button.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ResponsiveUtils.responsiveHeight(context, percentage: 0.85),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryBlue.withOpacity(0.1),
            AppTheme.backgroundLight,
          ],
        ),
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: ResponsiveUtils.isMobile(context)
            ? _buildMobileHero(context)
            : _buildDesktopHero(context),
      ),
    );
  }

  Widget _buildDesktopHero(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side - text content
        Expanded(
          flex: 6,
          child: _buildHeroContent(context),
        ),
        
        // Right side - illustration
        Expanded(
          flex: 5,
          child: _buildHeroIllustration(),
        ),
      ],
    );
  }

  Widget _buildMobileHero(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Illustration
        SizedBox(
          height: ResponsiveUtils.responsiveHeight(context, percentage: 0.3),
          child: _buildHeroIllustration(),
        ),
        
        const SizedBox(height: 40),
        
        // Text content
        _buildHeroContent(context),
      ],
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText.displayLarge(
            TextConstants.heroTitle,
            textAlign: ResponsiveUtils.isMobile(context) 
                ? TextAlign.center 
                : TextAlign.start,
          ),
          SizedBox(height: ResponsiveUtils.responsiveSpacing(context, 24)),
          CustomText.bodyLarge(
            TextConstants.heroSubtitle,
            textAlign: ResponsiveUtils.isMobile(context) 
                ? TextAlign.center 
                : TextAlign.start,
          ),
          SizedBox(height: ResponsiveUtils.responsiveSpacing(context, 40)),
          Row(
            mainAxisAlignment: ResponsiveUtils.isMobile(context) 
                ? MainAxisAlignment.center 
                : MainAxisAlignment.start,
            children: [
              CustomButton(
                text: TextConstants.ctaButtonText,
                onPressed: () => Get.toNamed(AppConstants.servicesRoute),
                type: ButtonType.primary,
                icon: Icons.arrow_forward,
                isIconLeading: false,
              ),
              const SizedBox(width: 16),
              CustomButton(
                text: TextConstants.learnMoreButtonText,
                onPressed: () => Get.toNamed(AppConstants.aboutRoute),
                type: ButtonType.outline,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroIllustration() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        // Placeholder for a hero illustration/image
        decoration: BoxDecoration(
          color: AppTheme.primaryBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            Icons.code,
            size: 140,
            color: AppTheme.primaryBlue.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
} 