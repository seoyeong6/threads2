import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy')),
      body: ListView(
        children: [
          ListTile(title: Text('Private Profile')),
          ListTile(title: Text('Mentions')),
          ListTile(title: Text('Muted')),
          ListTile(title: Text('Hidden Words')),
          ListTile(title: Text('Profiles rou follow')),
        ],
      ),
    );
  }
}
