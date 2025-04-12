import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/home_controller.dart';
import 'package:logiccraft_website/controllers/about_controller.dart';
import 'package:logiccraft_website/controllers/services_controller.dart';
import 'package:logiccraft_website/controllers/portfolio_controller.dart';
import 'package:logiccraft_website/controllers/contact_controller.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';
import 'package:logiccraft_website/core/theme/app_theme.dart';
import 'package:logiccraft_website/views/pages/home/home_page.dart';
import 'package:logiccraft_website/views/pages/about/about_page.dart';
import 'package:logiccraft_website/views/pages/contact/contact_page.dart';
import 'package:logiccraft_website/views/pages/portfolio/portfolio_page.dart';
import 'package:logiccraft_website/views/pages/services/services_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations for mobile
  if (!kIsWeb) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  
  runApp(const LogicCraftApp());
}

class LogicCraftApp extends StatelessWidget {
  const LogicCraftApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppConstants.homeRoute,
      defaultTransition: Transition.fadeIn,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
        Get.lazyPut<AboutController>(() => AboutController());
        Get.lazyPut<ServicesController>(() => ServicesController());
        Get.lazyPut<PortfolioController>(() => PortfolioController());
        Get.lazyPut<ContactController>(() => ContactController());
      }),
      getPages: [
        GetPage(
          name: AppConstants.homeRoute,
          page: () => const HomePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<HomeController>(() => HomeController());
          }),
        ),
        GetPage(
          name: AppConstants.aboutRoute,
          page: () => const AboutPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<AboutController>(() => AboutController());
          }),
        ),
        GetPage(
          name: AppConstants.servicesRoute,
          page: () => const ServicesPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<ServicesController>(() => ServicesController());
          }),
        ),
        GetPage(
          name: AppConstants.portfolioRoute,
          page: () => const PortfolioPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<PortfolioController>(() => PortfolioController());
          }),
        ),
        GetPage(
          name: AppConstants.contactRoute,
          page: () => const ContactPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<ContactController>(() => ContactController());
          }),
        ),
      ],
      scrollBehavior: AppScrollBehavior(),
    );
  }
}

// Custom scroll behavior to enable scrolling on web
class AppScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
