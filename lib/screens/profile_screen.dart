import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/models/media_item.dart';
import 'dart:io';
import '../utils/constants.dart';
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
  final List<MediaItem> _mediaItems = sampleMediaItems;

  void _updateCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  Future<void> _pickMedia(String type) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile;

    if (type == 'photo') {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else if (type == 'video') {
      pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      setState(() {
        _mediaItems.add(MediaItem(
          type: type,
          imageUrl: pickedFile!.path,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Portfolio")),
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              CategoryTabs(
                onCategorySelected: _updateCategory,
                selectedCategory: _selectedCategory,
              ),
              const SizedBox(height: 16),
              MediaGrid(
                mediaItems: _mediaItems,
                category: _selectedCategory,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMediaPicker(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showMediaPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.image),
            title: Text("Add Photo"),
            onTap: () {
              Navigator.pop(context);
              _pickMedia('photo');
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text("Add Video"),
            onTap: () {
              Navigator.pop(context);
              _pickMedia('video');
            },
          ),
          
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Material(
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
              whatsappNumber: '03036887374',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
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
                  backgroundImage: AssetImage('assets/MyPic.jpeg'),
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
              ],
            ),
          ),
          _drawerItem(icon: Icons.person, text: 'About Me', page: AboutMeScreen()),
          _drawerItem(icon: Icons.work, text: 'Projects', page: ProjectsScreen()),
          _drawerItem(icon: Icons.file_download, text: 'Resume', page: ResumeScreen()),
          _drawerItem(icon: Icons.contact_mail, text: 'Contact', page: ContactScreen()),
          _drawerItem(icon: Icons.settings, text: 'Settings', page: SettingsScreen()),
        ],
      ),
    );
  }

  Widget _drawerItem({required IconData icon, required String text, required Widget page}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Get.back();
        Get.to(() => page, transition: Transition.fadeIn);
      },
    );
  }
}
