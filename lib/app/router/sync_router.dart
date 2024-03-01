import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_up/pages/auth_page.dart';
import 'package:sync_up/pages/home_page.dart';
import 'package:sync_up/pages/splash_page.dart';

final GoRouter syncRouter = GoRouter(routes: <GoRoute>[
  GoRoute(
    routes: <GoRoute>[
      GoRoute(
        path: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: 'home',
        builder: (context, state) => const HomePage()
      )
    ],
  
    path: '/',
    builder: (BuildContext context, GoRouterState state) => const AuthPage(),

  ),
]);
