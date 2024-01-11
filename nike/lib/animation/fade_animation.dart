import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  late final double delay;
  late final Widget child;

  FadeAnimation({
    required this.child,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        AniProps.opacity,
        Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      )
      ..tween(
        AniProps.translateY,
        Tween(begin: -30.0, end: 0.0),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

    return Container();
  }
}
