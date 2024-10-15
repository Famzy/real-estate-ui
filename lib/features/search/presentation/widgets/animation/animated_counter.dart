import 'package:flutter/material.dart';
import 'package:realestate/core/themes/color_constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedCounter extends StatefulWidget {
  final int start;
  final int end;
  final Duration duration;
  final TextStyle? textStyle;
  final Curve curve;
  final Color? color;

  const AnimatedCounter({
    Key? key,
    this.start = 0, // Starting value
    required this.end, // Ending value (required)
    this.duration = const Duration(seconds: 3), // Default animation duration
    this.textStyle,
    this.color, // Customizable text style
    this.curve = Curves.easeInOut, // Default animation curve
  }) : super(key: key);

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _counterAnimation;
  bool _hasStarted = false; // To ensure the animation only starts once

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with the provided duration
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Set up the animation from start to end using the specified curve
    _counterAnimation = IntTween(begin: widget.start, end: widget.end).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when not in use
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasStarted) {
      setState(() {
        _hasStarted = true;
      });
      _controller.forward(); // Start the animation
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('animated-counter-${widget.end}'), // Unique key for the detector
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.1) {
          _startAnimation(); // Start animation when at least 10% is visible
        }
      },
      child: AnimatedBuilder(
        animation: _counterAnimation,
        builder: (context, child) {
          return Text(
            _counterAnimation.value.toString(), // Display the animated number
            style: widget.textStyle ??
                Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(
                      color: widget.color ?? ColorConstants().secondaryColor,
                      fontWeight: FontWeight.w600,
                    ), // Default text style
          );
        },
      ),
    );
  }
}