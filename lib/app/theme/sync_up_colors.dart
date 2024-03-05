import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black,
    primary: const Color.fromARGB(255, 0, 0, 0),
    secondary: const Color.fromARGB(255, 164, 164, 164),
    tertiary: const Color.fromARGB(255, 255, 255, 255)
  ),
  cardColor: Colors.white
);