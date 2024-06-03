import 'package:flutter/material.dart';



class VacationForm  extends StatefulWidget {
  @override
  _VacationFormState createState() => _VacationFormState();
}

class _VacationFormState extends State<VacationForm> {
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
    if (picked != null && picked != (isStartDate ? _startDate : _endDate))
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dodaj Wakacje'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _vacationNameController,
                decoration: InputDecoration(labelText: 'Nazwa Wakacji'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać nazwę wakacji';
                  }
                  return null;
                },
              ),
              ListTile(
                title: Text(_startDate == null
                    ? 'Wybierz datę rozpoczęcia'
                    : 'Data rozpoczęcia: ${_startDate!.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: Text(_endDate == null
                    ? 'Wybierz datę zakończenia'
                    : 'Data zakończenia: ${_endDate!.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_startDate == null || _endDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Proszę wybrać daty')),
                        );
                      } else {
                        // Handle the vacation saving logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Zapisano wakacje')),
                        );
                      }
                    }
                  },
                  child: Text('Zapisz'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
