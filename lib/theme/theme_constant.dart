import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    canvasColor: Colors.white,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.white,
      errorColor: Colors.red,
      brightness: Brightness.light,
    ));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.white),
);
