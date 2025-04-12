import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_button.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';
import 'package:animate_do/animate_do.dart';

class Navbar extends StatefulWidget {
  final bool isTransparent;
  final String activeRoute;

  const Navbar({
    Key? key,
    this.isTransparent = false,
    required this.activeRoute,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isScrolled = false;
  bool _isMobileMenuOpen = false;
  final GlobalKey _navbarKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Listen to scroll changes to make navbar transparent or solid
    if (widget.isTransparent) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final scrollController = ScrollController();
        scrollController.addListener(() {
          setState(() {
            _isScrolled = scrollController.offset > 50;
          });
        });
        PrimaryScrollController.of(context).addListener(() {
          setState(() {
            _isScrolled = PrimaryScrollController.of(context).offset > 50;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Main Navbar
        Container(
          key: _navbarKey,
          color: _getBackgroundColor(),
          child: SafeArea(
            child: ResponsiveUtils.createResponsiveContainer(
              context: context,
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtils.responsiveSpacing(context, 24),
                vertical: ResponsiveUtils.responsiveSpacing(context, 16),
              ),
              child: _buildNavbarContent(context),
            ),
          ),
        ),
        
        // Mobile Menu Dropdown
        if (_isMobileMenuOpen && ResponsiveUtils.isMobile(context))
          _buildMobileMenuDropdown(),
      ],
    );
  }

  Widget _buildNavbarContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        ResponsiveUtils.isMobile(context)
            ? _buildMobileMenuToggle()
            : _buildDesktopMenu(),
      ],
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: () => Get.toNamed(AppConstants.homeRoute),
      child: Row(
        children: [
          // Replace placeholder with actual logo
          Image.asset(
            AppConstants.logoPath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          CustomText.headlineSmall('LogicCraft'),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: [
        _buildNavItems(),
        const SizedBox(width: 24),
        CustomButton(
          text: 'Contact Us',
          onPressed: () => Get.toNamed(AppConstants.contactRoute),
          type: ButtonType.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ],
    );
  }

  Widget _buildNavItems() {
    return Row(
      children: [
        _buildNavItem(AppConstants.homePage, AppConstants.homeRoute),
        _buildNavItem(AppConstants.aboutPage, AppConstants.aboutRoute),
        _buildNavItem(AppConstants.servicesPage, AppConstants.servicesRoute),
        _buildNavItem(AppConstants.portfolioPage, AppConstants.portfolioRoute),
      ],
    );
  }

  Widget _buildNavItem(String title, String route) {
    final isActive = widget.activeRoute == route;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () => Get.toNamed(route),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: title,
              style: TextStyle(
                color: isActive ? AppTheme.primaryBlue : AppTheme.textDark,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: isActive ? 20 : 0,
              color: AppTheme.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuToggle() {
    return IconButton(
      icon: Icon(
        _isMobileMenuOpen ? Icons.close : Icons.menu,
        color: AppTheme.textDark,
      ),
      onPressed: () {
        setState(() {
          _isMobileMenuOpen = !_isMobileMenuOpen;
        });
      },
    );
  }

  Widget _buildMobileMenuDropdown() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isMobileMenuOpen ? null : 0,
      child: FadeInDown(
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Material(
            elevation: 4,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMobileNavItem(AppConstants.homePage, AppConstants.homeRoute),
                _buildMobileNavItem(AppConstants.aboutPage, AppConstants.aboutRoute),
                _buildMobileNavItem(AppConstants.servicesPage, AppConstants.servicesRoute),
                _buildMobileNavItem(AppConstants.portfolioPage, AppConstants.portfolioRoute),
                _buildMobileNavItem(AppConstants.contactPage, AppConstants.contactRoute),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(String title, String route) {
    final isActive = widget.activeRoute == route;
    
    return Material(
      color: isActive ? AppTheme.primaryBlue.withOpacity(0.1) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.toNamed(route);
          setState(() {
            _isMobileMenuOpen = false;
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: CustomText(
            text: title,
            style: TextStyle(
              color: isActive ? AppTheme.primaryBlue : AppTheme.textDark,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (!widget.isTransparent) {
      return Colors.white;
    }
    
    if (_isScrolled) {
      return Colors.white.withOpacity(0.9);
    }
    
    return Colors.transparent;
  }
} 