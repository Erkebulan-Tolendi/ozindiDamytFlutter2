import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

final today = DateUtils.dateOnly(DateTime.now());

class MarathonePage extends StatefulWidget {
  const MarathonePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MarathonePage> createState() => _MarathonePageState();
}

class _MarathonePageState extends State<MarathonePage> {
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
              )
            ],
          ),
          child: AppBar(
            actions: [
              Icon(Icons.area_chart),
              SizedBox(
                width: 10,
              )
            ],
            title: const Text('Марафон'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.redAccent,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: SizedBox(
          width: 375,
          child: ListView(
            children: <Widget>[
              _buildDefaultMultiDatePickerWithValue(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultMultiDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.multi,
      selectedDayHighlightColor: Colors.redAccent,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CalendarDatePicker2(
          config: config,
          value: _multiDatePickerValueWithDefaultValue,
          onValueChanged: (dates) =>
              setState(() => _multiDatePickerValueWithDefaultValue = dates),
        ),
      ],
    );
  }
}
