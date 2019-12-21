import 'dart:async';

import 'package:flawe_clock/clock_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockTime extends StatefulWidget {
  @override
  _ClockTimeState createState() => _ClockTimeState();
}

class _ClockTimeState extends State<ClockTime> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  String formattedDateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _updateTime();
    });
  }

  _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      //formattedDateTime = DateFormat('Hm').format(_dateTime);

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
    formattedDateTime = DateFormat('Hm').format(_dateTime);

    return Center(
      child: Text(
        formattedDateTime,
        style: TextStyle(color: Colors.white, fontSize: ClockContainer.mediaQueryData.orientation == Orientation.portrait ? 65.0 : 110.0),
      ),
    );
  }
}