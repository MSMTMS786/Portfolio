import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: Text("⚙️ Settings Page (Coming Soon!)", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
