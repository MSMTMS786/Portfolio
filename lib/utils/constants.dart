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
    'github': 'https://github.com/MSMTMS786',
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


class AppColors {
  static const Color primary = Color.fromARGB(255, 32, 117, 193); // Change to your main color
  static const Color secondary = Color.fromARGB(255, 158, 127, 33); // Change to your secondary color
  static const Color accent = Color.fromARGB(255, 21, 201, 27); // Change to your accent color
}
 

