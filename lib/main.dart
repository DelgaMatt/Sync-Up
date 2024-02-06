import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:sync_up/pages/auth_page.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black,
  ),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  await Supabase.initialize(
    url: 'https://afgjtighiqagtsfwhysg.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFmZ2p0aWdoaXFhZ3RzZndoeXNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcxNzYwNzYsImV4cCI6MjAyMjc1MjA3Nn0.TsPNCoQgRvNzw6eb_HFTT0qTUYPSngc6bkwElAHKCXo',
  );
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const AuthPage()
    );
  }
}