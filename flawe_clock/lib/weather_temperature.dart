import 'package:flutter/material.dart';

class WeatherTemperature extends StatelessWidget {
  final String temperature;
  final double landscapeTopMargin = 180;
  final double portraitTopMargin = 100;

  const WeatherTemperature({@required this.temperature})
      : assert(temperature != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).orientation == Orientation.landscape
              ? landscapeTopMargin
              : portraitTopMargin),
      child: Center(
          child: Text(
        temperature,
        style: Theme.of(context).textTheme.body1,
      )),
    );
    ;
  }
}
