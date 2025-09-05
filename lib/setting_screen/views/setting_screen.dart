import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/setting_screen/view_models/darkmode_config_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            textColor: Colors.blue,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
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
