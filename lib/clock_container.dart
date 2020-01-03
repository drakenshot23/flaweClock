import 'dart:async';

import 'package:flawe_clock/animated_orb.dart';
import 'package:flawe_clock/weather_animation.dart';
import 'package:flutter/material.dart';

import 'package:flawe_clock/shadow_circle.dart';
import 'package:flawe_clock/clock_circle.dart';
import 'package:flawe_clock/clock_seconds.dart';

import 'clock_time.dart';


class ClockContainer extends StatefulWidget {

  @override
  State createState() => _ClockContainerState();
}


class _ClockContainerState extends State<ClockContainer> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  var _isWeatherDisplayed = true;

  @override
  void initState()
  {
    super.initState();
    setState(() {
      displayWeather();
    });
  }

  /*
  * Display the weather when _dateTime.second between 0 and 10
  * then display the time using a timer until the end of the minute
  * */
  void displayWeather() {
    setState(() {
      _dateTime = DateTime.now();

      if (_dateTime.second > 10 && _isWeatherDisplayed) {
        _isWeatherDisplayed = false;
        _timer = Timer(
            Duration(minutes: 1) -
                Duration(seconds: _dateTime.second) -
                Duration(milliseconds: _dateTime.millisecond), displayWeather);
      } else {
        _isWeatherDisplayed = true;
        _timer = Timer(
            Duration(seconds: 1) -
                Duration(milliseconds: _dateTime.millisecond), displayWeather);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: Stack(
              children: <Widget>[
                ShadowCircle(),
                ClockCircle(),
                AnimatedOpacity(
                  child: AnimatedOrb(),
                  opacity: _isWeatherDisplayed ? 0 : 1,
                  duration: Duration(milliseconds: 500),
                ),
                AnimatedOpacity(
                  child: WeatherAnimation(),
                  opacity: _isWeatherDisplayed ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                ),
                ClockSeconds(),
                AnimatedOpacity(
                    child: ClockTime(),
                    opacity: _isWeatherDisplayed ? 0 : 1,
                    duration: Duration(milliseconds: 500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}