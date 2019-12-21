import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';


class AnimatedOrb extends StatefulWidget {
  @override
  _AnimatedOrbState createState() => _AnimatedOrbState();
}

class _AnimatedOrbState extends State<AnimatedOrb> {
  String _animationName = "Aura2";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlareActor("assets/animated_orb.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: _animationName),
    );
  }
}