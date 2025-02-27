import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("📧 Email: misbah@example.com", style: TextStyle(fontSize: 18)),
            Text("📞 Phone: +92 300 1234567", style: TextStyle(fontSize: 18)),
            Text("🌐 Website: www.misbah.dev", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
