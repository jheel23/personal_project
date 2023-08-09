import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeManagerNotifier extends StateNotifier<ThemeMode> {
  ThemeManagerNotifier() : super(ThemeMode.light);
  //Getter-->
  ThemeMode get themeMode => state;
  //TOGGLE THEME-->
  void toggleTheme(bool isDark) {
    if (isDark == true) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }
}

final themeProvider =
    StateNotifierProvider<ThemeManagerNotifier, ThemeMode>((ref) {
  return ThemeManagerNotifier();
});
