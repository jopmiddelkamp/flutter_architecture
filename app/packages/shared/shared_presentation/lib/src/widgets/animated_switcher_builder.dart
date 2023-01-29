import 'package:flutter/material.dart';

class AnimatedSwitcherBuilder extends StatelessWidget {
  const AnimatedSwitcherBuilder({
    required this.builder,
    this.duration,
    super.key,
  });

  final Widget Function(BuildContext context) builder;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 500),
      child: builder(context),
    );
  }
}
