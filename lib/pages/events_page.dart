import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_up/app/router/sync_router.dart';
import 'package:sync_up/features/authentication/auth_controller.dart';
import 'package:sync_up/widgets/drawer/nav_drawer.dart';

class EventsPage extends ConsumerWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Sync Up'),
        titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary, fontSize: 25),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(authProvider.notifier).signOut();

              if (context.mounted) {
                context.go(RoutePath.initial.path);
              }
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
