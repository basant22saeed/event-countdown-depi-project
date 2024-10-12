import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event.dart';
import 'EventProvider.dart';
import 'eventdatamodel.dart';

class EditEventPage extends StatefulWidget {
  final Event event;
  final int eventIndex;

  EditEventPage({required this.event, required this.eventIndex});

  @override
  _EditEventPageState createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  late EventDataModel eventData;

  @override
  void initState() {
    super.initState();
    eventData = EventDataModel();

    // تحميل البيانات الحالية للحدث في حقول التحكم
    eventData.titleController.text = widget.event.title;
    eventData.selectedDate = widget.event.date;
    eventData.selectedTime = widget.event.time;
    eventData.selectedIcon = widget.event.icon;
    eventData.selectedColor = widget.event.color;
    eventData.notesController.text = widget.event.notes;
  }

  void _saveEditedEvent() {
    if (eventData.titleController.text.isEmpty || eventData.selectedDate == null || eventData.selectedTime == null) {
      return;
    }

    // إنشاء الحدث المعدل
    final editedEvent = Event(
      title: eventData.titleController.text,
      date: eventData.selectedDate!,
      time: eventData.selectedTime!,
      icon: eventData.selectedIcon,
      color: eventData.selectedColor,
      notes: eventData.notesController.text,
    );

    // تحديث الحدث في مزود البيانات
    Provider.of<EventProvider>(context, listen: false).updateEvent(widget.eventIndex, editedEvent);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event updated successfully!')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFbfbfdb),
      appBar: AppBar(
        title: Text('Edit Event'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Edit event details', style: TextStyle(fontSize: 16)),
            TextField(
              controller: eventData.titleController,
              decoration: InputDecoration(
                hintText: 'Enter Event Title',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _buildDatePicker(context),
            SizedBox(height: 20),
            _buildTimePicker(context),
            SizedBox(height: 20),
            _buildIconPicker(context),
            SizedBox(height: 20),
            _buildColorPicker(context),
            SizedBox(height: 20),
            Text('Notes', style: TextStyle(fontSize: 16)),
            TextField(
              controller: eventData.notesController,
              decoration: InputDecoration(
                hintText: 'Describe your event',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _saveEditedEvent,
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Date'),
        Text(
          eventData.selectedDate != null
              ? '${eventData.selectedDate}'.split(' ')[0]
              : 'No Date Selected',
        ),
        ElevatedButton(
          onPressed: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: eventData.selectedDate ?? DateTime.now(),
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
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Time'),
        Text(
          eventData.selectedTime != null
              ? eventData.selectedTime!.format(context)
              : 'No Time Selected',
        ),
        ElevatedButton(
          onPressed: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: eventData.selectedTime ?? TimeOfDay.now(),
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
    );
  }

  Widget _buildIconPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Icon'),
        eventData.selectedIcon.isNotEmpty
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
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Color'),
        Container(
          width: 30,
          height: 30,
          color: eventData.selectedColor,
        ),
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
                            child: eventData.selectedColor == color
                                ? Icon(Icons.check, color: Colors.white)
                                : null,
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
    );
  }
}
