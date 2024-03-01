import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_up/pages/auth_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _signOut() async {
      final response = await supabase.auth.signOut()
      .then((response) => print("success"))
      .catchError((e) => print("catch $e"));
  }

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
              onPressed: _signOut,
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.onBackground,
              ))
        ],
      ),
    );
  }
}
