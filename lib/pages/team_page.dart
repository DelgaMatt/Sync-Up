import 'package:flutter/material.dart';
import 'package:sync_up/widgets/drawer/nav_drawer.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Meet the Team'),
        titleTextStyle:
            TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 25
              ),      
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Card(child: 
              Column(
                children: [
                  IconButton(onPressed: onPressed, icon: Image.asset()),
        
                  ],
              ),
            )
          ]
        ),
      ),
    );
  }
}