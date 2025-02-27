import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Projects")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Here are some of my projects:\n\n- Apna VPN (A VPN app using OpenVPN API)\n- Bluetooth Call Bridge (A solution for non-PTA devices)\n- Portfolio App (This app!)",
            textAlign: TextAlign.center,
            
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
