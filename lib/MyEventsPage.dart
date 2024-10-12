import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AddEventPage.dart';
import 'eventview.dart';

import 'EventProvider.dart';

class MyEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFbfbfdb),
      appBar: AppBar(title: Text('My Events'), centerTitle: true),
      body: ListView.builder(
        itemCount: eventProvider.events.length,
        itemBuilder: (context, index) {
          final event = eventProvider.events[index];
          return ListTile(
            leading: Image.asset(event.icon, width: 30, height: 30), // Use Image.asset for icon
            title: Text(event.title),
            subtitle: Text('${event.date} at ${event.time.hour}:${event.time.minute}'),
            tileColor: event.color,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventView(event: event, eventIndex: index),
                ),
              );
            },

            // You can add more details here
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEventPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
