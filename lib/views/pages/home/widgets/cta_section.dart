import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_button.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class CTASection extends StatelessWidget {
  const CTASection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: Container(
            padding: EdgeInsets.all(
              ResponsiveUtils.responsiveSpacing(context, 48),
            ),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ResponsiveUtils.isMobile(context)
                ? _buildMobileCTA(context)
                : _buildDesktopCTA(context),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopCTA(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.headlineLarge(
                TextConstants.ctaTitle,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              CustomText.bodyLarge(
                TextConstants.ctaSubtitle,
                color: Colors.white.withOpacity(0.9),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: CustomButton(
              text: TextConstants.ctaButtonSecondary,
              onPressed: () => Get.toNamed(AppConstants.contactRoute),
              type: ButtonType.white,
              icon: Icons.arrow_forward,
              isIconLeading: false,
              size: ButtonSize.large,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCTA(BuildContext context) {
    return Column(
      children: [
        CustomText.headlineLarge(
          TextConstants.ctaTitle,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        CustomText.bodyLarge(
          TextConstants.ctaSubtitle,
          color: Colors.white.withOpacity(0.9),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        CustomButton(
          text: TextConstants.ctaButtonSecondary,
          onPressed: () => Get.toNamed(AppConstants.contactRoute),
          type: ButtonType.white,
          icon: Icons.arrow_forward,
          isIconLeading: false,
          size: ButtonSize.large,
        ),
      ],
    );
  }
} 