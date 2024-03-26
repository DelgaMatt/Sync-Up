import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() {
    return EventListState();
  }
}

class EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return const Text('Events List');
  }
}
