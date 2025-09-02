import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/widget/nav_tab.dart';
import 'package:faker/faker.dart';
import 'write_screen/write_sheet.dart';
import 'package:thread/utils.dart';

class MainNavigation extends StatefulWidget {
  final Widget child;
  
  const MainNavigation({required this.child, super.key});

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
    
    // GoRouter를 사용해서 경로 변경
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/search');
        break;
      case 3:
        context.go('/activity');
        break;
      case 4:
        context.go('/profile');
        break;
    }
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // 현재 경로에 따라 선택된 인덱스 결정
    final location = GoRouterState.of(context).matchedLocation;
    int currentIndex = 0;
    if (location.startsWith('/settings')) {
      currentIndex = 4; // settings는 profile 탭과 같은 위치
    } else {
      switch (location) {
        case '/':
          currentIndex = 0;
          break;
        case '/search':
          currentIndex = 1;
          break;
        case '/activity':
          currentIndex = 3;
          break;
        case '/profile':
          currentIndex = 4;
          break;
        default:
          currentIndex = _selectedIndex;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 올라와도 배경 화면 고정
      body: widget.child, // GoRouter에서 전달받은 child 표시
      
      bottomNavigationBar: BottomAppBar(
        color: isDarkMode(context) ? Colors.black : Colors.white, // 색상 추가
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              isSelected: currentIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => onTap(0),
            ),
            NavTab(
              isSelected: currentIndex == 1,
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
              isSelected: currentIndex == 3,
              icon: FontAwesomeIcons.heart,
              onTap: () => onTap(3),
            ),
            NavTab(
              isSelected: currentIndex == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
