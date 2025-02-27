import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Me")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Hello! I am Misbah Ur Rehman, a Flutter Developer passionate about creating innovative mobile applications.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
