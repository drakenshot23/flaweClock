import 'dart:async';

import 'package:flawe_clock/animated_orb.dart';
import 'package:flawe_clock/weather_animation.dart';
import 'package:flawe_clock/weather_temperature.dart';
import 'package:flutter/material.dart';

import 'package:flawe_clock/shadow_circle.dart';
import 'package:flawe_clock/clock_circle.dart';
import 'package:flawe_clock/clock_seconds.dart';
import 'package:flutter_clock_helper/model.dart';

import 'clock_time.dart';

class ClockContainer extends StatefulWidget {
  const ClockContainer(this.model);

  final ClockModel model;

  @override
  _ClockContainerState createState() => _ClockContainerState(this.model);
}

class _ClockContainerState extends State<ClockContainer> {
  final ClockModel model;

  _ClockContainerState(this.model);

  DateTime _dateTime = DateTime.now();
  Timer _timer;
  var _isWeatherDisplayed = true;
  double completedPercent;

  @override
  void initState() {
    super.initState();
    setState(() {
      _updateClock();
    });
  }

  @override
  void didUpdateWidget(ClockContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateClock() {
    setState(() {
      _dateTime = DateTime.now();

      _displayWeather();
      _updateSeconds();

      _timer = Timer(
          Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
          _updateClock);
    });
  }

  /*
  * Display the weather when _dateTime.second between 0 and 9
  * */
  void _displayWeather() {
    if (_dateTime.second <= 9 && !_isWeatherDisplayed) {
      _isWeatherDisplayed = true;
    } else if (_dateTime.second > 9) {
      _isWeatherDisplayed = false;
    }
  }

  _updateSeconds() {
    completedPercent = _dateTime.second * 100 / 60;
  }

  @override
  Widget build(BuildContext context) {
    final Duration animationDuration = Duration(milliseconds: 500);

    return Stack(
      children: <Widget>[
        ShadowCircle(),
        ClockCircle(),
        AnimatedOpacity(
          child: AnimatedOrb(),
          opacity: _isWeatherDisplayed ? 0 : 1,
          curve: Curves.easeInOut,
          duration: animationDuration,
        ),
        AnimatedOpacity(
          child: WeatherAnimation(weatherCondition: model.weatherString),
          opacity: _isWeatherDisplayed ? 1 : 0,
          curve: Curves.easeInOut,
          duration: animationDuration,
        ),
        ClockSeconds(completedPercent: this.completedPercent),
        AnimatedOpacity(
          child: ClockTime(
            dateTime: _dateTime,
          ),
          opacity: _isWeatherDisplayed ? 0 : 1,
          curve: Curves.easeInOut,
          duration: animationDuration,
        ),
        AnimatedOpacity(
          child: WeatherTemperature(temperature: model.temperatureString),
          opacity: _isWeatherDisplayed ? 1 : 0,
          curve: Curves.easeInOut,
          duration: animationDuration,
        )
      ],
    );
  }
}
