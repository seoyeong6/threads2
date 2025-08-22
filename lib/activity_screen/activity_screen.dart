import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final List<String> tabs = ['All', 'Replies', 'Mentions', 'Verified', 'Media'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activity'),
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabAlignment: TabAlignment.start,
            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          children: [for (var tab in tabs) Center(child: Text(tab))],
        ),
      ),
    );
  }
}
