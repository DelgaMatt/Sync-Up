import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sync_up/widgets/app%20bar/app_bar.dart';
import 'package:sync_up/widgets/drawer/nav_drawer.dart';

class EventsPage extends ConsumerWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: const NavDrawer(),
      appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: SyncAppBar()),
    );
  }
}
