import 'package:flutter/material.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';
import 'package:animate_do/animate_do.dart';

class CustomSection extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool useGradient;
  final CrossAxisAlignment crossAxisAlignment;
  final bool animated;
  final bool centerTitle;
  final double? titleSpacing;
  final double? contentSpacing;

  const CustomSection({
    Key? key,
    this.title,
    this.subtitle,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.useGradient = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.animated = true,
    this.centerTitle = true,
    this.titleSpacing,
    this.contentSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsivePadding = padding ?? ResponsiveUtils.screenPadding(context);
    final responsiveTitleSpacing = titleSpacing ?? ResponsiveUtils.responsiveSpacing(context, 20);
    final responsiveContentSpacing = contentSpacing ?? ResponsiveUtils.responsiveSpacing(context, 40);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        gradient: useGradient ? AppTheme.primaryGradient : null,
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        padding: responsivePadding,
        child: _buildContent(context, responsiveTitleSpacing, responsiveContentSpacing),
      ),
    );
  }

  Widget _buildContent(BuildContext context, double titleSpacing, double contentSpacing) {
    final hasTitleContent = title != null || subtitle != null;
    
    if (!hasTitleContent) {
      return child;
    }

    final titleContent = _buildTitleContent(context, titleSpacing);
    
    final column = Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (titleContent != null) titleContent,
        SizedBox(height: contentSpacing),
        child,
      ],
    );
    
    if (!animated) {
      return column;
    }
    
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      child: column,
    );
  }

  Widget? _buildTitleContent(BuildContext context, double spacing) {
    if (title == null && subtitle == null) {
      return null;
    }
    
    final textAlign = centerTitle ? TextAlign.center : TextAlign.start;
    
    return Column(
      crossAxisAlignment: centerTitle ? CrossAxisAlignment.center : crossAxisAlignment,
      children: [
        if (title != null) ...[
          CustomText.displayMedium(
            title!,
            textAlign: textAlign,
          ),
        ],
        if (title != null && subtitle != null) 
          SizedBox(height: spacing / 2),
        if (subtitle != null) ...[
          CustomText.bodyLarge(
            subtitle!,
            textAlign: textAlign,
          ),
        ],
      ],
    );
  }
} 