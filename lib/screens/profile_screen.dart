import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/constants.dart';

import '../widgets/profile_header.dart';
import '../widgets/social_stats.dart';
import '../widgets/category_tabs.dart';
import '../widgets/media_grid.dart';

import '../screens/about_me_screen.dart';
import '../screens/projects_screen.dart';
import '../screens/resume_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedCategory = 'All';

  void _updateCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Portfolio")),
      drawer: Container(
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
        ),
        child: Drawer(
          
          backgroundColor: const Color.fromARGB(255, 62, 107, 145),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 30, 46),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/MyPic.jpeg',
                      ), // Profile picture
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Misbah Ur Rehman",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Divider(
                      thickness: 1,
                      color:  Color.fromARGB(255, 62, 107, 145))
                  ],
                ),
              ),
              
              
              _drawerItem(icon: Icons.home, text: 'Home', page: ProfileScreen()),
              _drawerItem(
                icon: Icons.person,
                text: 'About Me',
                page: AboutMeScreen(),
              ),
              _drawerItem(
                icon: Icons.work,
                text: 'Projects',
                page: ProjectsScreen(),
              ),
              _drawerItem(
                icon: Icons.file_download,
                text: 'Resume',
                page: ResumeScreen(),
              ),
              _drawerItem(
                icon: Icons.contact_mail,
                text: 'Contact',
                page: ContactScreen(),
              ),
              _drawerItem(
                icon: Icons.settings,
                text: 'Settings',
                page: SettingsScreen(),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                elevation: 10,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(70, 70),
                  bottomLeft: Radius.elliptical(70, 70),
                ),

                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 11, 30, 46),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ProfileHeader(user: sampleUser),
                      const SizedBox(height: 16),
                      SocialStats(
                        stats: sampleUser.socialStats,
                        profileUrls: sampleUser.profileUrls,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              CategoryTabs(
                onCategorySelected: _updateCategory,
                selectedCategory: _selectedCategory,
              ),
              const SizedBox(height: 16),
              MediaGrid(
                mediaItems: sampleMediaItems,
                category: _selectedCategory,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Drawer Item Function (Using Get.to)
  Widget _drawerItem({
    
    required IconData icon,
    required String text,
    required Widget page,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Get.back(); // ✅ Close drawer first
        Get.to(
          () => page,
          transition: Transition.fadeIn,
        ); // ✅ Smooth GetX navigation
      },
    );
  }
}
