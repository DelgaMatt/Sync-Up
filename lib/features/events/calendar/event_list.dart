import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:sync_up/app/router/sync_router.dart';
// import 'package:sync_up/features/events/calendar/event_controller.dart';

final supabase = Supabase.instance.client;

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() {
    return EventListState();
  }
}

class EventListState extends State<EventList> {
  final _events = supabase.from('events').select();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _events,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            final events = snapshot.data!;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event['event_name']),
                );
              },
            );
          }
        });
  }
}
