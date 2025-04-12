import 'package:flutter/material.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/views/widgets/common/footer.dart';
import 'package:logiccraft_website/views/widgets/common/navbar.dart';

class PageLayout extends StatelessWidget {
  final String currentRoute;
  final Widget child;
  final bool transparentNavbar;
  final Color? backgroundColor;
  final bool showFooter;
  final ScrollController? scrollController;
  //New Code

  const PageLayout({
    Key? key,
    required this.currentRoute,
    required this.child,
    this.transparentNavbar = false,
    this.backgroundColor,
    this.showFooter = true,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppTheme.backgroundLight,
      body: Stack(
        children: [
          _buildContent(),
          _buildNavbar(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          // Content
          child,
          
          // Footer
          if (showFooter) const Footer(),
        ],
      ),
    );
  }

  Widget _buildNavbar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Navbar(
        isTransparent: transparentNavbar,
        activeRoute: currentRoute,
      ),
    );
  }
} 