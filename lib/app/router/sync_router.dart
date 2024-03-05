import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_up/pages/auth_page.dart';
import 'package:sync_up/pages/home_page.dart';
import 'package:sync_up/pages/splash_page.dart';

enum RoutePath {
  initial(path: '/'),
  home(path: 'home'),
  contact(path: 'contact'),
  events(path: 'events'),
  admin(path: 'admin'); //will need specific priveledges associated with user

  const RoutePath({required this.path});
  final String path;
}

final GoRouter syncRouter =
    GoRouter(
      initialLocation: RoutePath.initial.path, 
      routes: <GoRoute>[
  GoRoute(
    redirect: (BuildContext context, GoRouterState state) {
      if (supabase.auth.currentSession != null) {
        return RoutePath.home.path;
      } else {
        return null;
      }
    },
    path: RoutePath.initial.path,
    builder: (BuildContext context, GoRouterState state) => const AuthPage(),
    routes: <GoRoute>[
      GoRoute(
        path: 'home',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
        ),
      // GoRoute(
      //   path: 'contact',
      //   pageBuilder: (context, state) => const MaterialPage(child: ContactPage()),
      //   ),
      // GoRoute(
      //   path: 'events',
      //   pageBuilder: (context, state) => const MaterialPage(child: EventsPage()),
      //   ),  
      // GoRoute(
      //   path: 'admin',
      //   pageBuilder: (context, state) => const MaterialPage(child: AdminPage()),
      //   ),  
      GoRoute(
        path: 'splash',
        pageBuilder: (context, state) => const MaterialPage(child: SplashPage()),
        ),          
    ],
  ),
]);

