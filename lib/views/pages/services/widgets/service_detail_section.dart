import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/controllers/services_controller.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_button.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';

class ServiceDetailSection extends GetView<ServicesController> {
  const ServiceDetailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedServiceName = controller.selectedService.value;
      if (selectedServiceName.isEmpty) {
        return const SizedBox.shrink();
      }

      final selectedService = controller.services.firstWhere(
        (service) => service.title == selectedServiceName,
      );

      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: ResponsiveUtils.responsiveSpacing(context, 80),
        ),
        color: AppTheme.lightColor,
        child: ResponsiveUtils.createResponsiveContainer(
          context: context,
          child: ResponsiveUtils.isMobile(context)
              ? _buildMobileDetail(context, selectedService)
              : _buildDesktopDetail(context, selectedService),
        ),
      );
    });
  }

  Widget _buildDesktopDetail(BuildContext context, service) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - service icon and title
        Expanded(
          flex: 4,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    service.iconData,
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 24),
                CustomText.headlineLarge(service.title),
                const SizedBox(height: 16),
                CustomText.bodyLarge(
                  service.description,
                  color: AppTheme.mediumColor,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Request a Quote',
                  onPressed: () => Get.toNamed(AppConstants.contactRoute),
                  type: ButtonType.primary,
                  icon: Icons.arrow_forward,
                  isIconLeading: false,
                ),
              ],
            ),
          ),
        ),
        
        // Spacer
        const SizedBox(width: 64),
        
        // Right side - features list
        Expanded(
          flex: 5,
          child: FadeInRight(
            duration: const Duration(milliseconds: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.headlineMedium('What We Offer'),
                const SizedBox(height: 24),
                if (service.features != null) ...[
                  ...service.features!.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final feature = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: FadeInUp(
                        delay: Duration(milliseconds: 200 + index * 100),
                        child: _buildFeatureItem(feature),
                      ),
                    );
                  }).toList(),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileDetail(BuildContext context, service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Service icon and title
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  service.iconData,
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 24),
              CustomText.headlineLarge(
                service.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CustomText.bodyLarge(
                service.description,
                color: AppTheme.mediumColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 40),
        
        // Features list
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Column(
            children: [
              CustomText.headlineMedium(
                'What We Offer',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              if (service.features != null) ...[
                ...service.features!.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final feature = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: FadeInUp(
                      delay: Duration(milliseconds: 200 + index * 100),
                      child: _buildFeatureItem(feature),
                    ),
                  );
                }).toList(),
              ],
            ],
          ),
        ),
        
        const SizedBox(height: 32),
        
        // CTA button
        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: CustomButton(
            text: 'Request a Quote',
            onPressed: () => Get.toNamed(AppConstants.contactRoute),
            type: ButtonType.primary,
            icon: Icons.arrow_forward,
            isIconLeading: false,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: AppTheme.primaryBlue,
            size: 16,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomText.bodyLarge(
            feature,
            color: AppTheme.textDark,
          ),
        ),
      ],
    );
  }
} 