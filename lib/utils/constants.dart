import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/media_item.dart';

// Sample data
final User sampleUser = User(
  name: 'Misbah Ur Rehman',
  username: '@its_Misbah',
  profileImage: 'assets/MyPic.jpeg', // You'll need to add this asset
  socialStats: {
    'Facebook': 3500,
    'Github': 359,
    'linkedin': 1600,
    'Contact': 92,
  },
   profileUrls: {
    'facebook': 'https://www.facebook.com/misbahrehmansukhera.sukhera.9',
    'github': 'https://github.com/',
    'linkedin': 'https://www.linkedin.com/in/misbah-ur-rehman-580941274/',
    'Contact': 'tel:+923036887374',  // Use tel: protocol for phone calls
  },
);

final List<MediaItem> sampleMediaItems = [
  MediaItem(imageUrl: 'assets/photo1.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo2.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo3.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo4.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo5.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo6.jpg', type: 'photo'),
];

// Colors
const Color primaryColor = Color(0xFF1E1E2E);
const Color accentColor = Color(0xFFFFA726);
const Color cardColor = Color(0xFF2A2A3A);