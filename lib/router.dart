import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/main_navigation.dart';
import 'package:thread/home_screen/home_screen.dart';
import 'package:thread/search/search_screen.dart';
import 'package:thread/activity_screen/activity_screen.dart';
import 'package:thread/profile_screen/profile_screen.dart';
import 'package:thread/setting_screen/views/setting_screen.dart';
import 'package:thread/setting_screen/views/privacy_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread/authentication/repos/authentication_repo.dart';
import 'package:thread/authentication/view/authentication_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != '/authentication') {
          return '/authentication';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/authentication',
        builder: (context, state) => AuthenticationScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainNavigation(child: child);
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) => HomeScreen()),
          GoRoute(path: '/search', builder: (context, state) => SearchScreen()),
          GoRoute(
            path: '/activity',
            builder: (context, state) => ActivityScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => ProfileScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => SettingScreen(),
            routes: [
              GoRoute(
                path: 'privacy',
                builder: (context, state) => PrivacyScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
