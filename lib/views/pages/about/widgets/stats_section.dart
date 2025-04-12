import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/controllers/about_controller.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class StatsSection extends GetView<AboutController> {
  const StatsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 60),
      ),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: Column(
          children: [
            CustomText.headlineMedium(
              TextConstants.statsTitle,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ResponsiveUtils.isMobile(context)
                ? _buildMobileStats()
                : _buildDesktopStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopStats() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStat(
          number: '${controller.projectsCompleted.value}+',
          label: TextConstants.statsProjects,
          delay: 0,
        ),
        _buildStat(
          number: '${controller.clientsServed.value}+',
          label: TextConstants.statsClients,
          delay: 200,
        ),
        _buildStat(
          number: '${controller.yearsOfExperience.value}+',
          label: TextConstants.statsYears,
          delay: 400,
        ),
        _buildStat(
          number: '${controller.teamSize.value}',
          label: TextConstants.statsTeam,
          delay: 600,
        ),
      ],
    ));
  }

  Widget _buildMobileStats() {
    return Obx(() => Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _buildStat(
                number: '${controller.projectsCompleted.value}+',
                label: TextConstants.statsProjects,
                delay: 0,
              ),
            ),
            Expanded(
              child: _buildStat(
                number: '${controller.clientsServed.value}+',
                label: TextConstants.statsClients,
                delay: 200,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _buildStat(
                number: '${controller.yearsOfExperience.value}+',
                label: TextConstants.statsYears,
                delay: 400,
              ),
            ),
            Expanded(
              child: _buildStat(
                number: '${controller.teamSize.value}',
                label: TextConstants.statsTeam,
                delay: 600,
              ),
            ),
          ],
        ),
      ],
    ));
  }

  Widget _buildStat({
    required String number,
    required String label,
    required int delay,
  }) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: Column(
        children: [
          CustomText.displayMedium(
            number,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          CustomText.bodyLarge(
            label,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 