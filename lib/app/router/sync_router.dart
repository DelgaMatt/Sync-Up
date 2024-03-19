import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_up/features/authentication/auth_controller.dart';
import 'package:sync_up/pages/auth_page.dart';
import 'package:sync_up/pages/home_page.dart';
import 'package:sync_up/pages/splash_page.dart';

final supabase = Supabase.instance.client;

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

final syncRouter = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePath.initial.path,
    routes: _routes,
    redirect: (BuildContext context, GoRouterState state) async {
      final authSession = await ref.read(authProvider.future); // ensures that the build function is complete and we have access to a value
      if (authSession == null && state.path != RoutePath.initial.path) {
        return RoutePath.initial.path;
      } else {
        return null;
      }
    },
  );
});

final _routes = [
  GoRoute(
    path: RoutePath.initial.path,
    name: 'Auth',
    pageBuilder: (context, state) => const MaterialPage(child: AuthPage()),
  ),
  GoRoute(
    path: RoutePath.home.path,
    name: 'Home',
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
