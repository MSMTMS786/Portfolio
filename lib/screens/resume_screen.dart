import 'package:flutter/material.dart';

class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resume")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // TODO: Add functionality to download or view resume
          },
          child: Text("Download Resume"),
        ),
      ),
    );
  }
}
