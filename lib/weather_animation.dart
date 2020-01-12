import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WeatherAnimation extends StatelessWidget {
  final String weatherCondition;

  WeatherAnimation({@required this.weatherCondition})
      : assert(weatherCondition != null);

  final weatherMap = {
    "cloudy": "03d",
    "foggy": "50d",
    "rainy": "09d",
    "snowy": "13d",
    "sunny": "01d",
    "thunderstorm": "11d",
    "windy": "wind",
  };

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.orientation == Orientation.portrait
        ? (mediaQueryData.size.height / (5 / 3)) / 2.1
        : (mediaQueryData.size.height / 1.3);

    return Container(
      height: height,
      margin: EdgeInsets.only(top: 3.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Semantics(
        child: FlareActor("assets/weather_animation.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: this.weatherMap[this.weatherCondition]),
        label: "Weather condition : $weatherCondition",
      ),
    );
  }
}
