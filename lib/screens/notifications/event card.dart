import 'package:flutter/material.dart';

import '../../event.dart';

class EventCard extends StatelessWidget{
  final Event event;

  EventCard({required this.event});
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        // color: Color(0xFFDEDEE7),
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Date: ${event.date.toIso8601String().split(' ')[0]}',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Time: ${event.time.format(context)}',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.notes,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Notes: ${event.notes}',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    )
    ;
  }

}