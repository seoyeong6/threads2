import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:thread/widget/home_screen/widget/posting_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final faker = Faker();
  final random = RandomGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: FaIcon(FontAwesomeIcons.threads)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostingScreen(),
            SizedBox(height: 20),
            PostingScreen(),
            SizedBox(height: 20),
            PostingScreen(),
          ],
        ),
      ),
    );
  }
}
