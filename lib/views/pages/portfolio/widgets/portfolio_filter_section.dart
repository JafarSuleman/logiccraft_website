import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/portfolio_controller.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class PortfolioFilterSection extends GetView<PortfolioController> {
  const PortfolioFilterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 24),
      ),
      decoration: BoxDecoration(
        color: AppTheme.lightColor,
        border: Border(
          bottom: BorderSide(
            color: AppTheme.mediumColor.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: Column(
          children: [
            CustomText.headlineSmall(
              'Filter Projects',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _buildCategoryFilters(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilters(BuildContext context) {
    return Obx(() {
      final categories = controller.categories;
      final selectedCategory = controller.selectedCategory.value;

      // Always use Wrap for better responsiveness
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 12,
        children: _buildFilterButtons(categories, selectedCategory),
      );
    });
  }

  List<Widget> _buildFilterButtons(List<String> categories, String selectedCategory) {
    return categories.map((category) {
      final isSelected = category == selectedCategory;
      
      return FilterChip(
        label: CustomText.bodyMedium(
          category,
          color: isSelected ? Colors.white : AppTheme.darkColor,
        ),
        selected: isSelected,
        selectedColor: AppTheme.primaryBlue,
        backgroundColor: Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(
            color: isSelected 
                ? AppTheme.primaryBlue 
                : AppTheme.mediumColor.withOpacity(0.3),
          ),
        ),
        onSelected: (selected) {
          controller.setSelectedCategory(category);
        },
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      );
    }).toList();
  }
} 