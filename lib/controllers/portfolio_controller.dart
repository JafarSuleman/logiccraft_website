import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/base_controller.dart';
import 'package:logiccraft_website/models/project_model.dart';

class PortfolioController extends BaseController {
  final RxList<ProjectModel> projects = <ProjectModel>[].obs;
  final RxList<String> categories = <String>[].obs;
  final RxString selectedCategory = 'All'.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadProjects();
    extractCategories();
  }
  
  void loadProjects() {
    projects.value = [
      ProjectModel(
        title: 'E-Commerce Platform',
        description: 'A comprehensive online shopping solution with advanced features such as personalized recommendations, inventory management, and secure payment processing.',
        imageUrl: 'assets/images/project1.jpg',
        category: 'Web Development',
        technologies: ['React.js', 'Node.js', 'MongoDB', 'Stripe API'],
        clientName: 'Fashion Outlet',
        projectUrl: 'https://fashionoutlet.com',
      ),
      ProjectModel(
        title: 'Fitness Tracking App',
        description: 'Mobile application for tracking workouts, nutrition, and health metrics. Features include goal setting, progress visualization, and social sharing.',
        imageUrl: 'assets/images/project2.jpg',
        category: 'Mobile Development',
        technologies: ['Flutter', 'Firebase', 'Google Fit API', 'Apple HealthKit'],
        clientName: 'FitLife Inc.',
        projectUrl: 'https://fitlife-app.com',
      ),
      ProjectModel(
        title: 'Corporate Dashboard',
        description: 'Data visualization dashboard for business analytics, with real-time monitoring, custom reports, and actionable insights.',
        imageUrl: 'assets/images/project3.jpg',
        category: 'UI/UX Design',
        technologies: ['Figma', 'D3.js', 'React.js', 'Node.js'],
        clientName: 'Global Analytics Corp',
        projectUrl: 'https://ga-dashboard.com',
      ),
      ProjectModel(
        title: 'Supply Chain Management System',
        description: 'Custom software solution for tracking inventory, managing suppliers, and optimizing logistics operations.',
        imageUrl: 'assets/images/project4.jpg',
        category: 'Custom Software',
        technologies: ['Java', 'Spring Boot', 'PostgreSQL', 'Docker'],
        clientName: 'Logistics Pro',
        projectUrl: 'https://logistics-pro.com',
      ),
      ProjectModel(
        title: 'Healthcare Patient Portal',
        description: 'Secure portal for patients to schedule appointments, access medical records, and communicate with healthcare providers.',
        imageUrl: 'assets/images/project5.jpg',
        category: 'Web Development',
        technologies: ['Angular', 'ASP.NET Core', 'SQL Server', 'Azure'],
        clientName: 'HealthFirst Medical Center',
        projectUrl: 'https://healthfirst-portal.com',
      ),
      ProjectModel(
        title: 'Real Estate Marketplace',
        description: 'Platform connecting property buyers, sellers, and agents with features such as virtual tours, mortgage calculators, and neighborhood analytics.',
        imageUrl: 'assets/images/project6.jpg',
        category: 'E-Commerce',
        technologies: ['Vue.js', 'Laravel', 'MySQL', 'Google Maps API'],
        clientName: 'HomeFind Realty',
        projectUrl: 'https://homefind-realty.com',
      ),
      ProjectModel(
        title: 'Restaurant Ordering System',
        description: 'Mobile app for table reservations, menu browsing, ordering, and payment processing with integration to kitchen management systems.',
        imageUrl: 'assets/images/project7.jpg',
        category: 'Mobile Development',
        technologies: ['React Native', 'Firebase', 'Stripe', 'Cloud Functions'],
        clientName: 'Gourmet Group',
        projectUrl: 'https://gourmet-app.com',
      ),
      ProjectModel(
        title: 'Financial Planning App',
        description: 'Personal finance application for budgeting, expense tracking, investment management, and financial goal planning.',
        imageUrl: 'assets/images/project8.jpg',
        category: 'UI/UX Design',
        technologies: ['Sketch', 'InVision', 'iOS', 'Swift'],
        clientName: 'WealthWise',
        projectUrl: 'https://wealthwise-app.com',
      ),
    ];
  }
  
  void extractCategories() {
    Set<String> uniqueCategories = {'All'};
    
    for (var project in projects) {
      uniqueCategories.add(project.category);
    }
    
    categories.value = uniqueCategories.toList();
  }
  
  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }
  
  List<ProjectModel> get filteredProjects {
    if (selectedCategory.value == 'All') {
      return projects;
    } else {
      return projects.where((project) => project.category == selectedCategory.value).toList();
    }
  }
} 