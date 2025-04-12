import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/base_controller.dart';
import 'package:logiccraft_website/models/service_model.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';



class ServicesController extends BaseController {
  final RxList<ServiceModel> services = <ServiceModel>[].obs;
  final RxString selectedService = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadServices();
    selectedService.value = services[0].title;
  }
  
  void setSelectedService(String serviceName) {
    selectedService.value = serviceName;
  }
  
  void loadServices() {
    services.value = [
      ServiceModel(
        title: AppConstants.webDev,
        description: 'We build responsive, high-performance websites that deliver exceptional user experiences.',
        iconData: 'assets/images/Logiccraft_logo.png',
        features: [
          'Custom website development',
          'E-commerce solutions',
          'Progressive Web Apps (PWAs)',
          'Content Management Systems',
          'Website maintenance and support',
          'Performance optimization',
        ],
      ),
      ServiceModel(
        title: AppConstants.mobileDev,
        description: 'We create intuitive, feature-rich mobile applications for iOS and Android platforms.',
        iconData: 'assets/icons/mobile_dev.png',
        features: [
          'Native iOS development',
          'Native Android development',
          'Cross-platform development (Flutter/React Native)',
          'App Store optimization',
          'Mobile app testing',
          'Ongoing support and maintenance',
        ],
      ),
      ServiceModel(
        title: AppConstants.uiuxDesign,
        description: 'We design beautiful, user-centered interfaces that enhance engagement and conversions.',
        iconData: 'assets/icons/uiux_design.png',
        features: [
          'User experience (UX) research',
          'User interface (UI) design',
          'Wireframing and prototyping',
          'User testing and validation',
          'Responsive design',
          'Design systems',
        ],
      ),
      ServiceModel(
        title: AppConstants.customSoftware,
        description: 'We develop tailored software solutions to address your unique business challenges.',
        iconData: 'assets/icons/custom_software.png',
        features: [
          'Business process automation',
          'Enterprise applications',
          'SaaS product development',
          'Legacy system modernization',
          'Custom CRM and ERP solutions',
          'Database design and development',
        ],
      ),
      ServiceModel(
        title: AppConstants.apiIntegration,
        description: 'We seamlessly integrate third-party APIs and develop custom APIs for your applications.',
        iconData: 'assets/icons/api_integration.png',
        features: [
          'RESTful API development',
          'GraphQL API development',
          'Third-party API integration',
          'Payment gateway integration',
          'Social media API integration',
          'API documentation',
        ],
      ),
      ServiceModel(
        title: AppConstants.ecommerce,
        description: 'We build secure, scalable e-commerce solutions that drive sales and enhance customer experience.',
        iconData: 'assets/icons/ecommerce.png',
        features: [
          'Custom e-commerce development',
          'Shopping cart implementation',
          'Payment gateway integration',
          'Inventory management',
          'Order tracking systems',
          'Customer loyalty programs',
        ],
      ),
      ServiceModel(
        title: AppConstants.cloudComputing,
        description: 'We leverage cloud technologies to build scalable, reliable, and cost-effective solutions.',
        iconData: 'assets/icons/cloud_computing.png',
        features: [
          'Cloud migration services',
          'Infrastructure as a Service (IaaS)',
          'Platform as a Service (PaaS)',
          'Software as a Service (SaaS)',
          'Serverless architecture',
          'Cloud security and compliance',
        ],
      ),
    ];
  }
} 