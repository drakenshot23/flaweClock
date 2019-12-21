import 'package:flawe_clock/animated_orb.dart';
import 'package:flutter/material.dart';

import 'package:flawe_clock/shadow_circle.dart';
import 'package:flawe_clock/clock_circle.dart';
import 'package:flawe_clock/clock_seconds.dart';

import 'clock_time.dart';

class ClockContainer extends StatelessWidget {
  static var mediaQueryData;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: Stack(
              children: <Widget>[
                //Text("Hello World !", style: TextStyle(color: Colors.white, fontSize: 30.0))
                // Use BoxShadow() or something else to create the shadow effect
                ShadowCircle(),
                ClockCircle(),
                AnimatedOrb(),
                ClockSeconds(),
                ClockTime(),
                Positioned(
                  left: mediaQueryData.size.width / 2 - 50,
                  bottom: 100.0,
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}