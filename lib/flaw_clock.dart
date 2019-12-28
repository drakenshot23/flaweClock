import 'package:flutter/material.dart';
import 'clock_container.dart';

class FlawClock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double fontSize = (MediaQuery.of(context).size.width / (5/3)) / 4.2;
    final ThemeData theme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
          fontFamily: "Varela Round",
          fontSize: fontSize,
          shadows: [
            Shadow(
                blurRadius: 15.0,
                color: Colors.black
            )
          ],
        )
      )
    );

    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: ClockContainer()
    );
  }
}