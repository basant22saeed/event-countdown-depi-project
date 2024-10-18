
import 'package:event_countdown/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../model/event.dart';
import 'event card.dart';




class NotificationHistory extends StatefulWidget {

  static List<Event> notifiedEvents = [];

  @override
  State<NotificationHistory> createState() => _NotificationHistoryState();
}

class _NotificationHistoryState extends State<NotificationHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(
          S.of(context).notifications,
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: NotificationHistory.notifiedEvents.isNotEmpty
       ? ListView.builder(
        itemCount: NotificationHistory.notifiedEvents.length,
        itemBuilder: (context, index) {
          final eventData = NotificationHistory.notifiedEvents[index];
          return EventCard(eventData: eventData);
        },
      )
         : Center(child: Text(S.of(context).notifications_history),)
    );
  }
}
