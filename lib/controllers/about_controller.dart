import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/base_controller.dart';
import 'package:logiccraft_website/models/team_member_model.dart';

class AboutController extends BaseController {
  final RxList<TeamMemberModel> teamMembers = <TeamMemberModel>[].obs;
  final RxInt yearsOfExperience = 5.obs;
  final RxInt projectsCompleted = 150.obs;
  final RxInt clientsServed = 80.obs;
  final RxInt teamSize = 5.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadTeamMembers();
  }
  
  void loadTeamMembers() {
    teamMembers.value = [
      TeamMemberModel(
        name: 'Zakir Ullah',
        position: 'Founder & CEO',
        bio: 'Flutter, Firebase, Node.js developer with 5+ years of experience. Has an MS degree in Computer Science.',
        imageUrl: 'assets/images/zakir.png',
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/zakir-ullah',
          'github': 'https://github.com/zakirullah',
        },
      ),
      TeamMemberModel(
        name: 'Jafar Suleman',
        position: 'Co-Founder & Project Manager',
        bio: 'Flutter + Firebase full stack developer with 5+ years of experience. Has an MA in Islamic Studies.',
        imageUrl: 'assets/images/jafar.jpg',
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/jafar-suleman',
          'github': 'https://github.com/jafarsuleman',
        },
      ),
      TeamMemberModel(
        name: 'Asim Bangash',
        position: 'Senior Full Stack Developer',
        bio: 'Flutter + Firebase full stack developer with 5+ years of experience. Has a BSCS degree in Computer Science.',
        imageUrl: 'assets/images/asim.png',
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/asim-bangash',
          'github': 'https://github.com/asimbangash',
        },
      ),
      TeamMemberModel(
        name: 'Touseef Khattak',
        position: 'Senior Flutter Developer',
        bio: 'Flutter developer with Firebase expertise and 5+ years of experience.',
        imageUrl: 'assets/images/touseef.png',
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/touseef-khattak',
          'github': 'https://github.com/touseefkhattak',
        },
      ),
      TeamMemberModel(
        name: 'Muneeb',
        position: 'UI/UX Designer',
        bio: 'Experienced UI/UX Designer with 4+ years of experience creating intuitive and engaging user interfaces.',
        imageUrl: 'assets/images/placeholder.png',
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/muneeb',
          'dribbble': 'https://dribbble.com/muneeb',
        },
      ),
    ];
  }
} 