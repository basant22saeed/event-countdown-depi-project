//! الصفحة الرئيسية -> بسنت سعيد

import 'package:event_countdown/generated/l10n.dart';
import 'package:event_countdown/screens/eventdatamodel.dart';
import 'package:flutter/material.dart';
import 'package:event_countdown/screens/drawer.dart';
import 'addeventpage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<EventDataModel> events = [];

  @override
  Widget build(BuildContext context) {
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

//!           الصفحة الجانبية للاعدادات-> بشمهندسة نورهان
      drawer: AppDrawer(),
    );
  }
}
