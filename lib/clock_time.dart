import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockTime extends StatelessWidget {
  final DateTime dateTime;

  const ClockTime({@required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final String hour = DateFormat('HH').format(dateTime);
    final String minute = DateFormat('mm').format(dateTime);

    return Center(
        child: Text(
      hour + ' : ' + minute,
      style: Theme.of(context).textTheme.title,
    ));
  }
}
