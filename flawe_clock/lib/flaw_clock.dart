import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

import 'clock_container.dart';

class FlawClock extends StatefulWidget {
  final ClockModel model;

  const FlawClock(this.model);

  @override
  _FlawClockState createState() => _FlawClockState();
}

class _FlawClockState extends State<FlawClock> {
  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateModel();
  }

  @override
  void didUpdateWidget(FlawClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  @override
  Widget build(BuildContext context) {
    final double clockFontSize =
        (MediaQuery.of(context).size.width / (5 / 3)) / 5.3;
    final double temperatureFontSize =
        (MediaQuery.of(context).size.width / (5 / 3)) / 7;

    final ThemeData theme = ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.white,
                fontFamily: "Varela Round",
                fontSize: clockFontSize,
                shadows: [Shadow(blurRadius: 15.0, color: Colors.black)]),
            body1: TextStyle(
                color: Colors.white,
                fontSize: temperatureFontSize,
                fontFamily: "Varela Round",
                shadows: [Shadow(blurRadius: 15.0, color: Colors.black)])));

    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: ClockContainer(widget.model));
  }
}
