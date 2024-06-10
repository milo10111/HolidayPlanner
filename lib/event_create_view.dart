import 'package:flutter/material.dart';
import 'package:holiday_planner/holiday_provider.dart';
import 'package:holiday_planner/model/event_model.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'package:provider/provider.dart';

class EventCreateView extends StatefulWidget {
  final HolidayModel holiday;
  const EventCreateView({super.key, required this.holiday});

  @override
  EventCreateViewState createState() => EventCreateViewState();
}

class EventCreateViewState extends State<EventCreateView> {
  // Define your form fields here
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventDescriptionController =
      TextEditingController();
  DateTime? _eventDate; // Use DateTime instead of a TextEditingController
  final TextEditingController _eventLocationController =
      TextEditingController();

  void createEvent(HolidayProvider provider) {
    if (_eventDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date')),
      );
      return;
    }

    final event = EventModel(
      title: _eventNameController.text,
      description: _eventDescriptionController.text,
      date: _eventDate!,
      location: _eventLocationController.text,
    );
    var holidayToUpdate = widget.holiday;
    holidayToUpdate.events.add(event);
    provider.updateHolidays(holidayToUpdate);

    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      // REVIEW ADNOTATION: this calendar range is ok, but you will not plan holidays for past years
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        // REVIEW: Don't use 'BuildContext's across async gaps. Try rewriting the code to not use the 'BuildContext', or guard the use with a 'mounted' check
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          _eventDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var holidayProvider = Provider.of<HolidayProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _eventNameController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _eventDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Event Description',
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: Text(_eventDate == null
                  ? 'Select event date'
                  : _eventDate!.toLocal().toString().substring(0, 16)),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _eventLocationController,
              decoration: const InputDecoration(
                labelText: 'Event Location',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                createEvent(holidayProvider);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
