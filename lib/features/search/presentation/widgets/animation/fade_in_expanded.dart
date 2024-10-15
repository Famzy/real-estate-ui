import 'package:flutter/material.dart';

class FadeInExpandWidget extends StatefulWidget {
  final Widget child;

  const FadeInExpandWidget({Key? key, required this.child}) : super(key: key);

  @override
  _FadeInExpandWidgetState createState() => _FadeInExpandWidgetState();
}

class _FadeInExpandWidgetState extends State<FadeInExpandWidget>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  bool _animationPlayed = false;

  @override
  void initState() {
    super.initState();

    // Observe app lifecycle changes
    WidgetsBinding.instance.addObserver(this);

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Define the scale animation with a curve
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Play the animation when the widget is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_animationPlayed) {
        _controller.forward();
        _animationPlayed = true;
      }
    });
  }

  @override
  void dispose() {
    // Remove the observer and dispose of the controller
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  // Listen for app lifecycle changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_animationPlayed && state == AppLifecycleState.resumed) {
      _controller.forward();
      _animationPlayed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
