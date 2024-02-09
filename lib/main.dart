import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_up/config/app_config.dart';

import 'package:sync_up/pages/auth_page.dart';
import 'package:sync_up/pages/home_page.dart';
import 'package:sync_up/pages/splash_page.dart';

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
    url: AppConfig.supabaseUrl,
    anonKey: AppConfig.supabaseAnonKey,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home:StreamBuilder(
        stream: supabase.auth.onAuthStateChange,
        builder: (ctx, snapshot) {
          // if firebase is still waiting or loading the token..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashPage();
          }

          if (snapshot.hasData) {
            return const HomePage();
          }

          return const AuthPage();
        },
      ),
    );
  }
}