import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WeatherAnimation extends StatefulWidget {

  @override
  State createState() => _WeatherAnimationState();
}

class _WeatherAnimationState extends State<WeatherAnimation> {

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.orientation == Orientation.portrait ? (mediaQueryData.size.height / (5/3)) / 2 : (mediaQueryData.size.height / (5/3));

    return Container(
      height: height,
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: FlareActor("assets/weather_animation.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "01d"),
    );
  }
}