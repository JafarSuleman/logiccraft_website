import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/home_controller.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/views/pages/home/widgets/hero_section.dart';
import 'package:logiccraft_website/views/pages/home/widgets/services_section.dart';
import 'package:logiccraft_website/views/pages/home/widgets/why_choose_us_section.dart';
import 'package:logiccraft_website/views/pages/home/widgets/stats_section.dart';
import 'package:logiccraft_website/views/pages/home/widgets/cta_section.dart';
import 'package:logiccraft_website/views/widgets/common/page_layout.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppConstants.homeRoute,
      transparentNavbar: true,
      child: Column(
        children: const [
          SizedBox(height: 80,),

          // Hero Section
          HeroSection(),
          
          // Services Overview Section
          ServicesSection(),
          
          // Why Choose Us Section
          WhyChooseUsSection(),
          
          // Stats Section
          StatsSection(),
          
          // CTA Section
          CTASection(),
        ],
      ),
    );
  }
} 