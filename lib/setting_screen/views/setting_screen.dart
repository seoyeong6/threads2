import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/setting_screen/view_models/darkmode_config_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread/authentication/viewmodel/authentication_viewmodel.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: Text("Dark Mode"),
            value: ref.watch(darkModeConfigViewModelProvider).isDarkMode,
            onChanged: (value) {
              ref.read(darkModeConfigViewModelProvider.notifier).setDarkMode(value);
            },
          ),
          ListTile(title: Text("Notifications")),
          GestureDetector(
            child: ListTile(
              title: Text("Privacy"),
              onTap: () {
                context.go('/settings/privacy');
              },
            ),
          ),
          ListTile(title: Text("Account")),
          ListTile(title: Text("Help")),
          ListTile(title: Text("About")),
          ListTile(
            title: const Text("Log out"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("로그아웃"),
                  content: const Text("정말 로그아웃하시겠습니까?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("취소"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        try {
                          await ref.read(authViewModelProvider.notifier).signOut();
                          if (context.mounted) {
                            context.go('/login');
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('로그아웃 실패: ${e.toString()}')),
                            );
                          }
                        }
                      },
                      isDestructiveAction: true,
                      child: const Text("로그아웃"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
