import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/base_controller.dart';
import 'package:logiccraft_website/models/service_model.dart';
import 'package:logiccraft_website/models/testimonial_model.dart';
import 'package:logiccraft_website/models/project_model.dart';
import 'package:logiccraft_website/core/constants/app_constants.dart';

class HomeController extends BaseController {
  final RxList<ServiceModel> featuredServices = <ServiceModel>[].obs;
  final RxList<TestimonialModel> testimonials = <TestimonialModel>[].obs;
  final RxList<ProjectModel> featuredProjects = <ProjectModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadFeaturedServices();
    loadTestimonials();
    loadFeaturedProjects();
  }
  
  void loadFeaturedServices() {
    featuredServices.value = [
      ServiceModel(
        title: AppConstants.webDev,
        description: 'Responsive websites optimized for performance and user experience.',
        iconData: 'assets/icons/web_dev.png',
      ),
      ServiceModel(
        title: AppConstants.mobileDev,
        description: 'Native and cross-platform mobile applications for iOS and Android.',
        iconData: 'assets/icons/mobile_dev.png',
      ),
      ServiceModel(
        title: AppConstants.uiuxDesign,
        description: 'Beautiful, intuitive designs that enhance user engagement.',
        iconData: 'assets/icons/uiux_design.png',
      ),
      ServiceModel(
        title: AppConstants.cloudComputing,
        description: 'Scalable cloud solutions for your business needs.',
        iconData: 'assets/icons/cloud_computing.png',
      ),
    ];
  }
  
  void loadTestimonials() {
    testimonials.value = [
      TestimonialModel(
        name: 'John Smith',
        position: 'CEO, Tech Innovations',
        testimonial: 'LogicCraft delivered exceptional results. Their team understood our vision and executed it flawlessly.',
        avatarUrl: 'assets/images/avatar1.jpg',
        rating: 5,
      ),
      TestimonialModel(
        name: 'Sarah Johnson',
        position: 'Marketing Director, Global Solutions',
        testimonial: 'The mobile app developed by LogicCraft increased our customer engagement by 40%. Highly recommended!',
        avatarUrl: 'assets/images/avatar2.jpg',
        rating: 5,
      ),
      TestimonialModel(
        name: 'Michael Brown',
        position: 'CTO, Future Systems',
        testimonial: 'Expert technical knowledge combined with excellent communication made working with LogicCraft a pleasure.',
        avatarUrl: 'assets/images/avatar3.jpg',
        rating: 4,
      ),
    ];
  }
  
  void loadFeaturedProjects() {
    featuredProjects.value = [
      ProjectModel(
        title: 'E-Commerce Platform',
        description: 'A comprehensive online shopping solution with advanced features.',
        imageUrl: 'assets/images/project1.jpg',
        category: 'Web Development',
      ),
      ProjectModel(
        title: 'Fitness Tracking App',
        description: 'Mobile application for tracking workouts and health metrics.',
        imageUrl: 'assets/images/project2.jpg',
        category: 'Mobile Development',
      ),
      ProjectModel(
        title: 'Corporate Dashboard',
        description: 'Data visualization dashboard for business analytics.',
        imageUrl: 'assets/images/project3.jpg',
        category: 'UI/UX Design',
      ),
    ];
  }
} 