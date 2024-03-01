import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
      ),
      body: const Text('Loading..'),
    );
  }
}