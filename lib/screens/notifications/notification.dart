
import 'package:flutter/material.dart';

import '../../event.dart';
import 'event_card.dart';

class NotificationHistory extends StatelessWidget {
  final List<Event> events;
  NotificationHistory({required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(
          'Notification',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body:  ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return EventCard(event: event);
        },
      ),

    );
  }
}
