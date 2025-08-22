import 'package:flutter/material.dart';
import 'package:thread/activity_screen/activity_widget.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final List<String> tabs = [
    'All',
    'Replies',
    'Mentions',
    'Verified',
    'Follow',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Activity',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
            ),
          ),
          centerTitle: false,
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
          children: [
            // All 탭
            ListView(
              children: [
                ActivityWidget(
                  optionText: 'Mentioned',
                  timeText: '4h',
                  name: 'John Doe',
                ),
                ActivityWidget(
                  optionText: 'Replied',
                  timeText: '2h',
                  name: 'Jane Smith',
                ),
                ActivityWidget(
                  optionText: 'Followed',
                  timeText: '1h',
                  name: 'Mike Johnson',
                ),
              ],
            ),
            // Replies 탭
            ListView(
              children: [
                ActivityWidget(
                  optionText: 'Replied',
                  timeText: '4h',
                  name: 'John Doe',
                ),
                ActivityWidget(
                  optionText: 'Replied',
                  timeText: '2h',
                  name: 'Jane Smith',
                ),
              ],
            ),
            // Mentions 탭
            ListView(
              children: [
                ActivityWidget(
                  optionText: 'Mentioned',
                  timeText: '4h',
                  name: 'John Doe',
                ),
                ActivityWidget(
                  optionText: 'Mentioned',
                  timeText: '3h',
                  name: 'Bob Wilson',
                ),
              ],
            ),
            // Verified 탭
            ListView(
              children: [
                ActivityWidget(
                  optionText: 'Verified',
                  timeText: '4h',
                  name: 'John Doe',
                ),
                ActivityWidget(
                  optionText: 'Verified',
                  timeText: '1h',
                  name: 'Alice Brown',
                ),
              ],
            ),
            // Follow 탭
            ListView(
              children: [
                ActivityWidget(
                  optionText: 'Followed',
                  timeText: '4h',
                  name: 'John Doe',
                ),
                ActivityWidget(
                  optionText: 'Followed',
                  timeText: '2h',
                  name: 'Sarah Davis',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
