

import 'package:event_countdown/screens/event_data_model.dart';
import 'package:event_countdown/screens/event_provider.dart';
import 'package:event_countdown/screens/notifications/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event.dart';



class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final EventDataModel eventData = EventDataModel();

  void _saveEvent() {
    if (eventData.titleController.text.isEmpty || eventData.selectedDate == null || eventData.selectedTime == null) {
      return;
    }

    final newEvent = Event(
      title: eventData.titleController.text,
      date: eventData.selectedDate!,
      time: eventData.selectedTime!,
      icon: eventData.selectedIcon,
      color: eventData.selectedColor,
      notes: eventData.notesController.text,

    );
    LocalNotificationService.showScheduledNotification(newEvent);

    Provider.of<EventProvider>(context, listen: false).addEvent(newEvent);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event added successfully!')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {return Scaffold(
    //backgroundColor: Color(0xFFbfbfdb),
    appBar: AppBar(
      title: Text('Add Event'), centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text('What is the event about?', style: TextStyle(fontSize: 16)),
          TextField(
            controller: eventData.titleController,
            decoration: InputDecoration(
              hintText: 'What is the Event Title?',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date'),
              Text(
                eventData.selectedDate != null ? '${eventData.selectedDate}'.split(' ')[0] : 'No Date Selected',
              ),
              ElevatedButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      eventData.selectedDate = pickedDate;
                    });
                  }
                },
                child: Text('Set Date'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time'),
              Text(
                eventData.selectedTime != null ? eventData.selectedTime!.format(context) : 'No Time Selected',
              ),
              ElevatedButton(
                onPressed: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      eventData.selectedTime = pickedTime;
                    });
                  }
                },
                child: Text('Set Time'),
              ),
            ],
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Icon'),
              eventData.selectedIcon != null
                  ? Image.asset(eventData.selectedIcon, width: 30, height: 30)
                  : Text('No Icon Selected'),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Choose Icon'),
                        content: SingleChildScrollView(
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: eventData.availableImageIcons.map((imagePath) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    eventData.selectedIcon = imagePath;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  imagePath,
                                  width: 30,
                                  height: 30,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Choose Icon'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Color'),
              eventData.selectedColor != null
                  ? Container(width: 30, height: 30, color: eventData.selectedColor)
                  : Text('No Color Selected'),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Choose Color'),
                        content: SingleChildScrollView(
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: eventData.availableColors.map((color) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    eventData.selectedColor = color;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: color,
                                  margin: EdgeInsets.all(4.0),
                                  child: eventData.selectedColor == color ? Icon(Icons.check, color: Colors.white) : null,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Choose Color'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Notes', style: TextStyle(fontSize: 16)),
          TextField(
            controller: eventData.notesController,
            decoration: InputDecoration(
              hintText: 'Describe your Event',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: OutlineInputBorder(),
            ),
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: _saveEvent,
              child: Text('Save'),
            ),
          ),
        ],
      ),
    ),
  );
  }
}