import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/controllers/services_controller.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/service_card.dart';

class ServicesListSection extends GetView<ServicesController> {
  const ServicesListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: TextConstants.allServicesTitle,
      subtitle: TextConstants.allServicesSubtitle,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildServicesGrid(context),
        ],
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context) {
    // Determine grid layout based on screen size
    int crossAxisCount;
    double childAspectRatio;
    double crossAxisSpacing;
    double mainAxisSpacing;

    if (ResponsiveUtils.isMobile(context)) {
      crossAxisCount = 1;
      childAspectRatio = 1.2;
      crossAxisSpacing = 16;
      mainAxisSpacing = 16;
    } else if (ResponsiveUtils.isTablet(context)) {
      crossAxisCount = 2;
      childAspectRatio = 1.1;
      crossAxisSpacing = 24;
      mainAxisSpacing = 24;
    } else {
      crossAxisCount = 3;
      childAspectRatio = 1;
      crossAxisSpacing = 32;
      mainAxisSpacing = 32;
    }

    return Obx(() => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: controller.services.length,
      itemBuilder: (context, index) {
        final service = controller.services[index];
        return FadeInUp(
          delay: Duration(milliseconds: index * 100),
          child: ServiceCard(
            title: service.title,
            description: service.description,
            icon: Icons.code,
            onTap: () => controller.setSelectedService(service.title),
          ),
        );
      },
    ));
  }
} 