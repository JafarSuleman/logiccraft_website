import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/contact_controller.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/views/pages/contact/widgets/contact_form_section.dart';
import 'package:logiccraft_website/views/pages/contact/widgets/contact_hero_section.dart';
import 'package:logiccraft_website/views/pages/contact/widgets/contact_info_section.dart';
import 'package:logiccraft_website/views/pages/contact/widgets/map_section.dart';
import 'package:logiccraft_website/views/widgets/common/page_layout.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppConstants.contactRoute,
      child: Column(
        children: [
          // Contact Hero Section
          const ContactHeroSection(),
          
          // Contact Form + Info Section
          const ContactFormSection(),
          
          // Contact Info Section
          const ContactInfoSection(),
          
          // Map Section
          const MapSection(),
        ],
      ),
    );
  }
} 