class AppConstants {
  // App information
  static const String appName = 'LogicCraft Technologies';
  static const String appSlogan = 'Crafting Digital Excellence';
  static const String appDescription = 'Expert IT solutions tailored for your business needs';
  
  // Contact information
  static const String email = 'info@logiccrafttechnologies.com';
  static const String phone = '0334 6665 950';
  static const String address = 'Flat No 14, 3rd Floor, Collage Town Plaza, opposite to GPGC, Pendi Road,Kohat';
  
  // Social media links
  static const String linkedIn = 'https://www.linkedin.com/company/logic-craft-technologies/?viewAsMember=true';
  static const String facebook = 'https://facebook.com/logiccraft';
  static const String twitter = 'https://twitter.com/logiccraft';
  static const String instagram = 'https://instagram.com/logiccraft';
  
  // Route names
  static const String homeRoute = '/';
  static const String aboutRoute = '/about';
  static const String servicesRoute = '/services';
  static const String portfolioRoute = '/portfolio';
  static const String contactRoute = '/contact';
  
  // Page names
  static const String homePage = 'Home';
  static const String aboutPage = 'About';
  static const String servicesPage = 'Services';
  static const String portfolioPage = 'Portfolio';
  static const String contactPage = 'Contact';
  
  // Service names
  static const String webDev = 'Web Development';
  static const String mobileDev = 'Mobile Development';
  static const String uiuxDesign = 'UI/UX Design';
  static const String customSoftware = 'Custom Software';
  static const String apiIntegration = 'API Integration';
  static const String ecommerce = 'E-Commerce';
  static const String cloudComputing = 'Cloud Computing';
  
  // Menu items for navigation
  static final List<Map<String, String>> menuItems = [
    {'title': homePage, 'route': homeRoute},
    {'title': aboutPage, 'route': aboutRoute},
    {'title': servicesPage, 'route': servicesRoute},
    {'title': portfolioPage, 'route': portfolioRoute},
    {'title': contactPage, 'route': contactRoute},
  ];
  
  // Assets paths
  static const String logoPath = 'assets/images/Logiccraft_logo.png';
  static const String placeholderImagePath = 'assets/images/placeholder.png';
  static const String heroBackgroundPath = 'assets/images/hero_background.jpg';
  
  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 600);
  static const Duration longAnimationDuration = Duration(milliseconds: 900);
} 