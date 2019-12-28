import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockTime extends StatefulWidget {
  @override
  _ClockTimeState createState() => _ClockTimeState();
}

class _ClockTimeState extends State<ClockTime> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;


  @override
  void initState() {
    super.initState();
    setState(() {
      _updateTime();
    });
  }

  _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    final String hour = DateFormat('HH').format(_dateTime);
    final String minute = DateFormat('mm').format(_dateTime);

    return Center(
      child: Text(
        hour + ' : ' + minute,
        style: Theme.of(context).textTheme.title,
      )
    );
  }
}