import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/widget/nav_tab.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screens = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Create')),
    const Center(child: Text('Notifications')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(offstage: _selectedIndex != 0, child: screens[0]),
          Offstage(offstage: _selectedIndex != 1, child: screens[1]),
          Offstage(offstage: _selectedIndex != 2, child: screens[2]),
          Offstage(offstage: _selectedIndex != 3, child: screens[3]),
          Offstage(offstage: _selectedIndex != 4, child: screens[4]),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => onTap(0),
              ),
              NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => onTap(1),
              ),
              NavTab(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                onTap: () => onTap(2),
              ),
              NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                onTap: () => onTap(3),
              ),
              NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
