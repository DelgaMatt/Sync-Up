import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_up/pages/auth_page.dart';
import 'package:sync_up/pages/home_page.dart';
import 'package:sync_up/pages/splash_page.dart';

enum RoutePath {
  initial(path: '/auth'),
  home(path: 'home'),
  contact(path: 'contact'),
  events(path: 'events'),
  admin(path: 'admin'); //will need specific priveledges associated with user

  const RoutePath({required this.path});
  final String path;
}

final GoRouter syncRouter =
    GoRouter(initialLocation: RoutePath.initial.path, routes: <GoRoute>[
  GoRoute(
    redirect: (BuildContext context, GoRouterState state) {
      if (supabase.auth.currentSession != null) {
        return RoutePath.initial.path;
      } else {
        return null;
      }
    },
    path: RoutePath.initial.path,
    pageBuilder: (BuildContext context, GoRouterState state) => MaterialPage(child: AuthPage()),
    routes: <GoRoute>[
      GoRoute(
        path: RoutePath.home.path,
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   path: RoutePath.contact.path,
      //   pageBuilder: (context, state) => const MaterialPage(child: ContactPage()),
      //   ),
      // GoRoute(
      //   path: RoutePath.events.path,
      //   pageBuilder: (context, state) => const MaterialPage(child: EventsPage()),
      //   ),
      // GoRoute(
      //   path: RoutePath.admin.path,
      //   pageBuilder: (context, state) => const MaterialPage(child: AdminPage()),
      //   ),
      GoRoute(
        path: 'splash',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashPage()),
      ),
    ],
  ),
]);
