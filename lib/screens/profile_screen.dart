import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/social_stats.dart';
import '../widgets/category_tabs.dart';
import '../widgets/media_grid.dart';
import '../utils/constants.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
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
}
