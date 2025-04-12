import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/about_controller.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/views/pages/about/widgets/company_intro_section.dart';
import 'package:logiccraft_website/views/pages/about/widgets/mission_vision_section.dart';
import 'package:logiccraft_website/views/pages/about/widgets/team_section.dart';
import 'package:logiccraft_website/views/pages/about/widgets/stats_section.dart';
import 'package:logiccraft_website/views/widgets/common/page_layout.dart';

class AboutPage extends GetView<AboutController> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppConstants.aboutRoute,
      child: Column(
        children: [
          // Company Introduction Section
          const CompanyIntroSection(),
          
          // Mission & Vision Section
          const MissionVisionSection(),
          
          // Stats Section
          const StatsSection(),
          
          // Team Section
          const TeamSection(),
        ],
      ),
    );
  }
} 