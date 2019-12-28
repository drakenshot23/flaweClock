import 'package:flawe_clock/animated_orb.dart';
import 'package:flutter/material.dart';

import 'package:flawe_clock/shadow_circle.dart';
import 'package:flawe_clock/clock_circle.dart';
import 'package:flawe_clock/clock_seconds.dart';

import 'clock_time.dart';

class ClockContainer extends StatelessWidget {

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
                AnimatedOrb(),
                ClockSeconds(),
                ClockTime()
              ],
            ),
          ),
        ),
      ),
    );
  }
}