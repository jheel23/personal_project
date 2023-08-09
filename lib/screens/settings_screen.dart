import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_project_one/providers/theme_manager.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeProvider);
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          child: SwitchListTile(
            inactiveTrackColor: Colors.grey,
            secondary: const Icon(Icons.dark_mode_sharp),
            subtitle: const Text('Toggle to change theme'),
            title: const Text(
              'Dark Mode',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            value: ref.read(themeProvider.notifier).themeMode == ThemeMode.dark,
            onChanged: (newvalue) {
              ref.read(themeProvider.notifier).toggleTheme(newvalue);
            },
          ),
        ),
      ],
    );
  }
}
