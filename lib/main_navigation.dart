import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread/home_screen/home_screen.dart';
import 'package:thread/widget/nav_tab.dart';
import 'package:faker/faker.dart';
import 'write_screen/write_sheet.dart';
import 'activity_screen/activity_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  final faker = Faker();
  final random = RandomGenerator();

  // 3번 탭(가운데 펜 아이콘) 클릭 시 모달 열기
  void _openWriteSheet() {
    // 타이핑 중 재빌드를 막기 위해 표시용 값은 한 번만 계산
    final displayName = faker.person.name();
    final avatarUrl =
        "https://picsum.photos/100/100?random=${random.integer(100)}";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      builder: (_) => WriteSheet(
        displayName: displayName,
        avatarUrl: avatarUrl,
        onPosted: (text) {
          // TODO: 업로드 로직 연결 (필요시)
          // print('Posted: $text');
        },
      ),
    );
  }

  void onTap(int index) {
    if (index == 2) {
      _openWriteSheet(); // 가운데 탭은 화면 전환 대신 모달만
      return; // _selectedIndex 변경 안 함
    }
    setState(() => _selectedIndex = index);
  }

  final screens = const [
    HomeScreen(),
    Center(child: Text('Search')),
    ActivityScreen(),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 올라와도 배경 화면 고정
      body: Stack(
        children: [
          Offstage(offstage: _selectedIndex != 0, child: screens[0]),
          Offstage(offstage: _selectedIndex != 1, child: screens[1]),
          Offstage(offstage: _selectedIndex != 3, child: screens[2]),
          Offstage(offstage: _selectedIndex != 4, child: screens[3]),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
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
            // ✅ 가운데 탭은 선택 상태를 표시하지 않음(모달만 띄움)
            NavTab(
              isSelected: false,
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
    );
  }
}
