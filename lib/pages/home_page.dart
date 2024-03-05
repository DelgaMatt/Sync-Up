import 'package:flutter/material.dart';
import 'package:sync_up/features/authentication/sign_out.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Up'),
        titleTextStyle:
            TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 25
              ),
        actions: [
          IconButton(
              onPressed: signOut,
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.onBackground,
              ))
        ],
      ),
    );
  }
}
