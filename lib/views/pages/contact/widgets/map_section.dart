import 'package:flutter/material.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class MapSection extends StatelessWidget {
  const MapSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ResponsiveUtils.isMobile(context) ? 300 : 400,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // This is a placeholder for a real map
                // In a real app, you would use a map widget like google_maps_flutter
                Container(
                  width: double.infinity,
                  color: AppTheme.backgroundLight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_outlined,
                          size: 64,
                          color: AppTheme.primaryBlue,
                        ),
                        const SizedBox(height: 16),
                        CustomText.headlineSmall(
                          'Map Placeholder',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: CustomText.bodyMedium(
                            AppConstants.address,
                            textAlign: TextAlign.center,
                            color: AppTheme.mediumColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Map overlay with office marker
                Positioned(
                  bottom: 24,
                  right: 24,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppTheme.primaryBlue,
                        ),
                        const SizedBox(width: 8),
                        CustomText.bodyMedium(
                          'Our Office',
                          color: AppTheme.darkColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 