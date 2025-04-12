import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/services_controller.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/views/pages/services/widgets/services_hero_section.dart';
import 'package:logiccraft_website/views/pages/services/widgets/services_list_section.dart';
import 'package:logiccraft_website/views/pages/services/widgets/service_detail_section.dart';
import 'package:logiccraft_website/views/pages/services/widgets/technologies_section.dart';
import 'package:logiccraft_website/views/widgets/common/page_layout.dart';

class ServicesPage extends GetView<ServicesController> {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppConstants.servicesRoute,
      child: Column(
        children: const [
          // Services Hero Section
          ServicesHeroSection(),
          
          // Services List Section
          ServicesListSection(),
          
          // Service Detail Section
          ServiceDetailSection(),
          
          // Technologies Section
          TechnologiesSection(),
        ],
      ),
    );
  }
} 