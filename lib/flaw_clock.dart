import 'package:flutter/material.dart';
import 'clock_container.dart';

class FlawClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: ClockContainer()
    );
  }
}