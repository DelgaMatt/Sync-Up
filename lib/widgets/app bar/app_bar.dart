import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_up/app/router/sync_router.dart';
import 'package:sync_up/features/authentication/auth_controller.dart';

class SyncAppBar extends ConsumerWidget {
  const SyncAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      shadowColor: Theme.of(context).colorScheme.tertiary,
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
    );
  }
}
