import 'package:flutter/material.dart';

class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final bool? isScale;
  FadeInAnimation({
    Key? key,
    required this.child,
    this.duration,
    this.isScale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration ?? Duration(milliseconds: 500),
      builder: (context, double val, child) {
        return Opacity(
          opacity: Curves.ease.transform(val),
          child: isScale != null
              ? TweenAnimationBuilder(
                  curve: Curves.ease,
                  tween: Tween<double>(begin: 0.1, end: 1),
                  // tween: Tween<double>(begin: 0.4, end: 1),
                  duration: duration ?? Duration(milliseconds: 500),
                  builder: (context, double val, child) => Transform.scale(
                    scale: Curves.ease.transform(val),
                    child: child,
                  ),
                  child: child,
                )
              : child,
        );
      },
      child: child,
    );
  }
}
