import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Screen size breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  // Device type detection
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;
  
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;
  
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;
  
  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  // Responsive padding
  static EdgeInsets screenPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 24);
    } else {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 32);
    }
  }

  // Responsive sizing
  static double responsiveWidth(BuildContext context, {double percentage = 1.0}) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double responsiveHeight(BuildContext context, {double percentage = 1.0}) {
    return MediaQuery.of(context).size.height * percentage;
  }

  // Responsive spacing
  static double responsiveSpacing(BuildContext context, double baseSize) {
    if (isMobile(context)) {
      return baseSize * 0.8;
    } else if (isTablet(context)) {
      return baseSize;
    } else {
      return baseSize * 1.2;
    }
  }

  // Responsive font size
  static double responsiveFontSize(BuildContext context, double baseSize) {
    if (isMobile(context)) {
      return baseSize * 0.8;
    } else if (isTablet(context)) {
      return baseSize;
    } else if (isDesktop(context)) {
      return baseSize * 1.1;
    } else {
      return baseSize * 1.2;
    }
  }

  // Responsive widget builder
  static Widget responsiveWidget({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
    Widget? largeDesktop,
  }) {
    if (isLargeDesktop(context) && largeDesktop != null) {
      return largeDesktop;
    } else if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  // Get the content width based on screen size (for centering content)
  static double getContentMaxWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth > desktopBreakpoint) {
      return 1200; // Max content width for large screens
    } else if (screenWidth > tabletBreakpoint) {
      return screenWidth * 0.85; // 85% of screen width for desktops
    } else if (screenWidth > mobileBreakpoint) {
      return screenWidth * 0.9; // 90% of screen width for tablets
    } else {
      return screenWidth * 0.95; // 95% of screen width for mobiles
    }
  }

  // Helper for creating a centered content container with max width
  static Widget createResponsiveContainer({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: getContentMaxWidth(context),
        ),
        padding: padding ?? screenPadding(context),
        child: child,
      ),
    );
  }
} 