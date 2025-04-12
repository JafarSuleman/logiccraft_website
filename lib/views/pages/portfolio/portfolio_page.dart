import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/portfolio_controller.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/views/pages/portfolio/widgets/portfolio_hero_section.dart';
import 'package:logiccraft_website/views/pages/portfolio/widgets/portfolio_filter_section.dart';
import 'package:logiccraft_website/views/pages/portfolio/widgets/projects_grid_section.dart';
import 'package:logiccraft_website/views/widgets/common/page_layout.dart';

class PortfolioPage extends GetView<PortfolioController> {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppConstants.portfolioRoute,
      child: Column(
        children: const [
          // Portfolio Hero Section
          PortfolioHeroSection(),
          
          // Portfolio Filter Section
          PortfolioFilterSection(),
          
          // Projects Grid Section
          ProjectsGridSection(),
        ],
      ),
    );
  }
} 