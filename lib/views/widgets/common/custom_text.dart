import 'package:flutter/material.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool isResponsive;
  final double? baseSize;

  const CustomText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.isResponsive = true,
    this.baseSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isResponsive && baseSize != null) {
      final responsiveSize = ResponsiveUtils.responsiveFontSize(context, baseSize!);
      
      return Text(
        text,
        style: style?.copyWith(
          fontSize: responsiveSize,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );
    }
    
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // Factory constructors for different text styles
  factory CustomText.displayLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 40,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 40,
    );
  }

  factory CustomText.displayMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 32,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 32,
    );
  }

  factory CustomText.displaySmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 28,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 28,
    );
  }

  factory CustomText.headlineLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 26,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 26,
    );
  }

  factory CustomText.headlineMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 24,
    );
  }

  factory CustomText.headlineSmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 20,
    );
  }

  factory CustomText.bodyLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 18,
    );
  }

  factory CustomText.bodyMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppTheme.textDark,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 16,
    );
  }

  factory CustomText.bodySmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool isResponsive = true,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return CustomText(
      text: text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppTheme.textDark,
        decoration: decoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      isResponsive: isResponsive,
      baseSize: 14,
    );
  }
} 