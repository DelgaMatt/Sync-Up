import 'package:flutter/material.dart';
import 'package:sync_up/features/authentication/sign_out.dart';
import 'package:sync_up/widgets/drawer/nav_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Sync Up'),
        titleTextStyle:
            TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 25
              ),
        actions:[
          IconButton(
            onPressed: signOut,
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
