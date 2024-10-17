// Edit event page ----> Nourhan


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event.dart';
import 'event_data_model.dart';
import 'event_provider.dart';

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

    eventData.titleController.text = widget.event.title;
    eventData.selectedDate = widget.event.date;
    eventData.selectedTime = widget.event.time;
    eventData.selectedIcon = widget.event.icon;
    eventData.selectedColor = widget.event.color;
    eventData.notesController.text = widget.event.notes;
  }

  void _saveEditedEvent() {
    if (eventData.titleController.text.isEmpty ||
        eventData.selectedDate == null ||
        eventData.selectedTime == null) {
      return;
    }

    final editedEvent = Event(
      title: eventData.titleController.text,
      date: eventData.selectedDate!,
      time: eventData.selectedTime!,
      icon: eventData.selectedIcon,
      color: eventData.selectedColor,
      notes: eventData.notesController.text,
    );

    Provider.of<EventProvider>(context, listen: false)
        .updateEvent(widget.eventIndex, editedEvent);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Event updated successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _buildTextField('Enter Event Title', eventData.titleController),
            SizedBox(height: 20),
            _buildDatePicker(),
            SizedBox(height: 20),
            _buildTimePicker(),
            SizedBox(height: 20),
            _buildIconPicker(),
            SizedBox(height: 20),
            _buildColorPicker(),
            SizedBox(height: 20),
            _buildNotesField(),
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

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notes', style: TextStyle(fontSize: 16)),
        _buildTextField('Describe your event', eventData.notesController),
      ],
    );
  }

  Widget _buildDatePicker() {
    return _buildPicker(
      title: 'Date',
      displayText: eventData.selectedDate != null
          ? '${eventData.selectedDate}'.split(' ')[0]
          : 'No Date Selected',
      onEdit: () async {
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
    );
  }

  Widget _buildTimePicker() {
    return _buildPicker(
      title: 'Time',
      displayText: eventData.selectedTime != null
          ? eventData.selectedTime!.format(context)
          : 'No Time Selected',
      onEdit: () async {
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
    );
  }

  Widget _buildIconPicker() {
    return _buildPicker(
      title: 'Icon',
      displayWidget: eventData.selectedIcon.isNotEmpty
          ? Image.asset(eventData.selectedIcon, width: 30, height: 30)
          : Text('No Icon Selected'),
      onEdit: () {
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
    );
  }

  Widget _buildColorPicker() {
    return _buildPicker(
      title: 'Color',
      displayWidget: Container(
        width: 30,
        height: 30,
        color: eventData.selectedColor,
      ),
      onEdit: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Choose Color'),
              content: SingleChildScrollView(
                child: Wrap(
                  spacing: 10, // space between columns
                  runSpacing: 10, // space between rows
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
    );
  }

  Widget _buildPicker({
    required String title,
    String? displayText, // for time and date
    Widget? displayWidget, // for icons and colors
    required VoidCallback onEdit,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        displayWidget ?? Text(displayText ?? ''),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit,
          ),
        ),
      ],
    );
  }
}


