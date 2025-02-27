import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/profile_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.,
        
      ),
      debugShowCheckedModeBanner: false,
      title: "Portfolio App",
      
      home: ProfileScreen(),
    );
  }
}
