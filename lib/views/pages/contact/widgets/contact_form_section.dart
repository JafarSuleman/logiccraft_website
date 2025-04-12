import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:logiccraft_website/controllers/contact_controller.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/constants/text_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/core/utils/responsive_utils.dart';
import 'package:logiccraft_website/views/widgets/common/custom_button.dart';
import 'package:logiccraft_website/views/widgets/common/custom_section.dart';
import 'package:logiccraft_website/views/widgets/common/custom_text.dart';

class ContactFormSection extends GetView<ContactController> {
  const ContactFormSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: TextConstants.contactFormTitle,
      subtitle: TextConstants.contactFormSubtitle,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveUtils.responsiveSpacing(context, 80),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          ResponsiveUtils.isMobile(context)
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact form - left side
        Expanded(
          flex: 3,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: _buildContactForm(context),
          ),
        ),
        
        const SizedBox(width: 60),
        
        // Contact info - right side
        Expanded(
          flex: 2,
          child: FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: _buildContactInfo(context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        // Contact form
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: _buildContactForm(context),
        ),
        
        const SizedBox(height: 60),
        
        // Contact info
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 300),
          child: _buildContactInfo(context),
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Obx(() => Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name field
          _buildTextField(
            controller: controller.nameController,
            hintText: 'Your Name',
            labelText: 'Name',
            prefixIcon: Icons.person_outline,
            validator: controller.validateName,
          ),
          const SizedBox(height: 20),
          
          // Email field
          _buildTextField(
            controller: controller.emailController,
            hintText: 'Your Email',
            labelText: 'Email',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: controller.validateEmail,
          ),
          const SizedBox(height: 20),
          
          // Message field
          _buildTextField(
            controller: controller.messageController,
            hintText: 'Your Message',
            labelText: 'Message',
            prefixIcon: Icons.message_outlined,
            maxLines: 5,
            validator: controller.validateMessage,
          ),
          const SizedBox(height: 24),
          
          // Submit button
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Send Message',
              onPressed: controller.isSubmitting.value
                  ? null
                  : () => controller.submitForm(),
              type: ButtonType.primary,
              icon: Icons.send_outlined,
              isIconLeading: false,
              isLoading: controller.isSubmitting.value,
              size: ButtonSize.large,
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlue.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.headlineMedium(
                'Contact Information',
                color: Colors.white,
              ),
              const SizedBox(height: 24),
              
              // Email
              _buildContactItem(
                icon: Icons.email_outlined,
                title: 'Email',
                content: AppConstants.email,
              ),
              const SizedBox(height: 20),
              
              // Phone
              _buildContactItem(
                icon: Icons.phone_outlined,
                title: 'Phone',
                content: AppConstants.phone,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.bodyMedium(
                title,
                color: Colors.white.withOpacity(0.8),
              ),
              const SizedBox(height: 4),
              CustomText.bodyLarge(
                content,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
} 