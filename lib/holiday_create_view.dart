import 'package:flutter/material.dart';

class HolidayCreateView extends StatefulWidget {
  const HolidayCreateView({super.key});

  @override
  HolidayCreateViewState createState() => HolidayCreateViewState();
}

class HolidayCreateViewState extends State<HolidayCreateView> {
  final _formKey = GlobalKey<FormState>();
  final _vacationNameController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create holiday'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _vacationNameController,
                decoration: const InputDecoration(labelText: 'Holiday name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name for the holiday';
                  }
                  return null;
                },
              ),
              ListTile(
                title: Text(_startDate == null
                    ? 'Select start date'
                    : '${_startDate!.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: Text(_endDate == null
                    ? 'Select end date'
                    : '${_endDate!.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_startDate == null || _endDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select dates')),
                        );
                      } else {
                        // Handle the vacation saving logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Vacation saved!')),
                        );
                        //Go back in router
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text('Save holiday'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
