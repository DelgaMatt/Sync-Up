import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    // seedColor: Colors.black,
    primary:  Color.fromARGB(255, 0, 0, 0),
    secondary: Color.fromARGB(255, 164, 164, 164),
    tertiary: Color.fromARGB(255, 255, 255, 255)
  ),
  cardColor: Colors.white
);