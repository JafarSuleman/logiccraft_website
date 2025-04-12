import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryBlack,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 40),
      ),
      child: ResponsiveUtils.createResponsiveContainer(
        context: context,
        child: ResponsiveUtils.isMobile(context)
            ? _buildMobileFooter(context)
            : _buildDesktopFooter(context),
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildCompanyInfo(context),
            ),
            Expanded(
              flex: 1,
              child: _buildQuickLinks(context),
            ),
            Expanded(
              flex: 1,
              child: _buildServices(context),
            ),
            Expanded(
              flex: 1,
              child: _buildContactInfo(context),
            ),
          ],
        ),
        const SizedBox(height: 40),
        _buildBottomBar(context),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        _buildCompanyInfo(context),
        const SizedBox(height: 30),
        _buildQuickLinks(context),
        const SizedBox(height: 30),
        _buildServices(context),
        const SizedBox(height: 30),
        _buildContactInfo(context),
        const SizedBox(height: 40),
        _buildBottomBar(context),
      ],
    );
  }

  Widget _buildCompanyInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              AppConstants.logoPath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            CustomText(
              text: AppConstants.appName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: ResponsiveUtils.isMobile(context) ? null : 300,
          child: CustomText(
            text: 'Innovative digital solutions powered by technology and expertise.',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, () {}),
            _buildSocialIcon(Icons.facebook, () {}),
            _buildSocialIcon(Icons.facebook, () {}),
            _buildSocialIcon(Icons.facebook, () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryBlue,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Quick Links',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink(AppConstants.homePage, () => Get.toNamed(AppConstants.homeRoute)),
        _buildFooterLink(AppConstants.aboutPage, () => Get.toNamed(AppConstants.aboutRoute)),
        _buildFooterLink(AppConstants.servicesPage, () => Get.toNamed(AppConstants.servicesRoute)),
        _buildFooterLink(AppConstants.portfolioPage, () => Get.toNamed(AppConstants.portfolioRoute)),
        _buildFooterLink(AppConstants.contactPage, () => Get.toNamed(AppConstants.contactRoute)),
      ],
    );
  }

  Widget _buildServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Our Services',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink(AppConstants.webDev, () => Get.toNamed(AppConstants.servicesRoute)),
        _buildFooterLink(AppConstants.mobileDev, () => Get.toNamed(AppConstants.servicesRoute)),
        _buildFooterLink(AppConstants.uiuxDesign, () => Get.toNamed(AppConstants.servicesRoute)),
        _buildFooterLink(AppConstants.apiIntegration, () => Get.toNamed(AppConstants.servicesRoute)),
        _buildFooterLink(AppConstants.cloudComputing, () => Get.toNamed(AppConstants.servicesRoute)),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.location_on, TextConstants.addressText),
        _buildContactItem(Icons.email, TextConstants.emailText),
        _buildContactItem(Icons.phone, TextConstants.phoneText),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppTheme.primaryBlue,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomText(
              text: text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.primaryBlue,
              size: 12,
            ),
            const SizedBox(width: 8),
            CustomText(
              text: text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.white24,
          thickness: 1,
        ),
        const SizedBox(height: 20),
        ResponsiveUtils.isMobile(context)
            ? Column(
                children: [
                  CustomText(
                    text: TextConstants.copyrightText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildBottomBarLink(TextConstants.privacyPolicyText, () {}),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                        ),
                      ),
                      _buildBottomBarLink(TextConstants.termsOfServiceText, () {}),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: TextConstants.copyrightText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      _buildBottomBarLink(TextConstants.privacyPolicyText, () {}),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                        ),
                      ),
                      _buildBottomBarLink(TextConstants.termsOfServiceText, () {}),
                    ],
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildBottomBarLink(String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: CustomText(
        text: text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }
} 