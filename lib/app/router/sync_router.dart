import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_up/pages/auth_page.dart';
import 'package:sync_up/pages/home_page.dart';
import 'package:sync_up/pages/splash_page.dart';

enum RoutePath {
  initial(path: '/'),
  home(path: '/home'),
  contact(path: '/contact'),
  events(path: '/events'),
  splash(path: '/splash'),
  admin(path: '/admin'); //will need specific priveledges associated with user

  const RoutePath({required this.path});
  final String path;
}

final GoRouter syncRouter = GoRouter(
  initialLocation: RoutePath.initial.path,
  routes: _routes,
  redirect: (BuildContext context, GoRouterState state) {
    if (supabase.auth.currentSession != null) {
      return RoutePath.home.path;
    } else {
      return null;
    }
  },
);

final _routes = [
  GoRoute(
    path: RoutePath.initial.path,
    pageBuilder: (context, state) => const MaterialPage(child: AuthPage()),
  ),
  GoRoute(
    path: RoutePath.home.path,
    pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
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
    path: RoutePath.splash.path,
    pageBuilder: (context, state) => const MaterialPage(child: SplashPage()),
  ),
];
