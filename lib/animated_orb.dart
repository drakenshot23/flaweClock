import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AnimatedOrb extends StatelessWidget {
  final String _firstAnimationName = "Aura";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlareActor("assets/animated_orb.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: _firstAnimationName),
      ),
    );
  }
}
