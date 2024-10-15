import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FlyInFadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offsetY; // The offset from the bottom
  final Curve curve;

  const FlyInFadeIn({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.offsetY = 50.0, // Default to flying in from 50px below the starting position
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  @override
  _FlyInFadeInState createState() => _FlyInFadeInState();
}

class _FlyInFadeInState extends State<FlyInFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isAnimationStarted = false; // Track if the animation has started

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Fade animation (from 0 to 1)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    // Slide animation (from below the screen to the normal position)
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, widget.offsetY / 100), 
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_isAnimationStarted) {
      _isAnimationStarted = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('fly-in-fade-in-${widget.child.hashCode}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.1) {
          _startAnimation(); // Start the animation when the widget is at least 10% visible
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation, // Fade in effect
            child: SlideTransition(
              position: _slideAnimation, // Fly-in from bottom to up
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}