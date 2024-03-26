import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_up/app/router/sync_router.dart';

import 'package:sync_up/widgets/app%20bar/app_bar.dart';
import 'package:sync_up/widgets/carousel/carousel_home.dart';
import 'package:sync_up/widgets/drawer/nav_drawer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: const NavDrawer(),
      appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: SyncAppBar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  width: 125,
                  child: Image.asset('lib/assets/images/logo/sync_up_logo.png'),
                ),
              const Text(style: TextStyle(fontSize: 50), 'Welcome'),
              Container(
                padding: const EdgeInsets.all(10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20
                    ),
                   text: 'Sync Up is a live music production company based out of Vancouver, Washington with a deep rooted passion for electronic music. Our goal is to create experiences that are both captivating and inspiring by utilizing the latest technologies, techniques and sounds in the industry. We work with a diverse range of artists to deliver unique and exceptional curations.',
                  ),
                ),
              ),
              const SizedBox(height: 50),
              OutlinedButton(
                onPressed: () {
                  context.go(RoutePath.events.path);
                },
                child: const Text( 'Events', 
                  style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
                ),
                OutlinedButton(
                onPressed: () {
                  context.go(RoutePath.contact.path);
                },
                child: const Text( 'Contact', 
                  style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
                ),
              const SizedBox(height: 50),
              const HomeCarousel(),
            ],
          ),
        ),
    );
  }
}
