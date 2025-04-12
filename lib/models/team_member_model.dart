class TeamMemberModel {
  final String name;
  final String position;
  final String bio;
  final String imageUrl;
  final Map<String, String> socialLinks;
  
  TeamMemberModel({
    required this.name,
    required this.position,
    required this.bio,
    required this.imageUrl,
    required this.socialLinks,
  });
} 