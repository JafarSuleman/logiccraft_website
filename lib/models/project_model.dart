class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final List<String>? technologies;
  final String? clientName;
  final String? projectUrl;
  
  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    this.technologies,
    this.clientName,
    this.projectUrl,
  });
} 