import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'Noto_Sans_KR',
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[900],
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
