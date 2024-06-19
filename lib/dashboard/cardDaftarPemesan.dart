import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeForm extends StatefulWidget {
  @override
  _DateRangeFormState createState() => _DateRangeFormState();
}

class _DateRangeFormState extends State<DateRangeForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  List<DateTime> _weekendDates = [];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2101);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  void _calculateWeekends() {
    if (_startDate != null &&
        _endDate != null &&
        _startDate!.isBefore(_endDate!)) {
      DateTime date = _startDate!;
      List<DateTime> weekends = [];
      while (date.isBefore(_endDate!)) {
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          weekends.add(date);
        }
        date = date.add(Duration(days: 1));
      }
      setState(() {
        _weekendDates = weekends;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Tanggal Awal',
                  hintText: _startDate != null
                      ? _dateFormat.format(_startDate!)
                      : 'Pilih Tanggal Awal',
                ),
                onTap: () => _selectDate(context, true),
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Tanggal Akhir',
                  hintText: _endDate != null
                      ? _dateFormat.format(_endDate!)
                      : 'Pilih Tanggal Akhir',
                ),
                onTap: () => _selectDate(context, false),
              ),
              ElevatedButton(
                onPressed: _calculateWeekends,
                child: Text('Tampilkan Akhir Pekan'),
              ),
            ],
          ),
        ),
        if (_weekendDates.isNotEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _weekendDates
                    .map((date) => Text(
                          _dateFormat.format(date),
                          style: TextStyle(fontSize: 16),
                        ))
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
