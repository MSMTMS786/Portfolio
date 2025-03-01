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
    'LinkedIn': 1600,
    'WhatsApp': 92,
  },
  profileUrls: {
    'facebook': 'https://www.facebook.com/misbahrehmansukhera.sukhera.9',
    'github': 'https://github.com/MSMTMS786',
    'linkedin': 'https://www.linkedin.com/in/misbah-ur-rehman-580941274/',
    'WhatsApp': 'https://wa.me/923036887374?text=${Uri.encodeComponent("Hey Misbah! I just explored your portfolio and I''m impressed. Let''s connect!")}',
  },
);

final List<MediaItem> sampleMediaItems = [
  MediaItem(imageUrl: 'assets/photo1.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo2.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo3.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo4.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo5.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/photo6.jpg', type: 'photo'),
  MediaItem(imageUrl: 'assets/wohi-khuda-hai-coke-studio.mp3', type: 'music'),
  MediaItem(imageUrl: 'assets/APNA VPN.mp4', type: 'video'),
];

// Colors

class AppColors {
  static const Color primary = Color.fromARGB(255, 32, 117, 193); // Change to your main color
  static const Color secondary = Color.fromARGB(255, 158, 127, 33); // Change to your secondary color
  static const Color accent = Color.fromARGB(255, 21, 201, 27); // Change to your accent color
}
