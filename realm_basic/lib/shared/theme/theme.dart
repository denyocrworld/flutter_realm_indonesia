import 'package:flutter/material.dart';

const primaryColor = Color(0xffa2852e);
const backgroundColor = Color(0xff212121);
const disabledTextColor = Colors.grey;

ThemeData get defaultTheme {
  return ThemeData.dark().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey[800],
    ),
  );
}
