import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.blue[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[900],
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
