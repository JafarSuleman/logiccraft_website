import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class ContactHeroSection extends StatelessWidget {
  const ContactHeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
      ),
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 60),
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 1000),
              child: CustomText.displaySmall(
                TextConstants.contactTitle,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 1000),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: CustomText.bodyLarge(
                  TextConstants.contactSubtitle,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 