//! الصفحة الرئيسية -> بسنت سعيد

import 'package:event_countdown/generated/l10n.dart';
import 'package:event_countdown/screens/event_data_model.dart';
import 'package:event_countdown/screens/event_provider.dart';
import 'package:event_countdown/screens/eventview.dart';
import 'package:flutter/material.dart';
import 'package:event_countdown/screens/drawer.dart';
import 'package:provider/provider.dart';
import 'add_event_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<EventDataModel> events = [];

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).appName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
//!          الذهاب لصفحة اضافة الحدث -> بشمهندس محمود فاروق
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEventPage(),
                  ));
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
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
//!           الصفحة الجانبية للاعدادات-> بشمهندسة نورهان
      drawer: AppDrawer(),
    );
  }
}
