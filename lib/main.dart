import 'package:flutter/material.dart';
import 'router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setting_screen/repos/darkmode_config_repo.dart';
import 'setting_screen/view_models/darkmode_config_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final preferences = await SharedPreferences.getInstance();
  final repository = DarkModeConfigRepo(preferences);
  runApp(
    ProviderScope(
      overrides: [darkModeConfigRepoProvider.overrideWithValue(repository)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeConfig = ref.watch(darkModeConfigViewModelProvider);
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      themeMode: darkModeConfig.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
      ),
    );
  }
}
