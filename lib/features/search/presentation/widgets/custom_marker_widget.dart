import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/core/themes/color_constants.dart';
import 'package:realestate/core/utils/image_constants.dart';

class AnimatedMarker extends StatefulWidget {
  final VoidCallback onTap;
  final double minWidth;
  final double maxWidth;
  final double height;
  final Duration duration;

  const AnimatedMarker({
    Key? key,
    required this.onTap,
    required this.minWidth,
    required this.maxWidth,
    required this.height,
    required this.duration,
  }) : super(key: key);

  @override
  _AnimatedMarkerState createState() => _AnimatedMarkerState();
}

class _AnimatedMarkerState extends State<AnimatedMarker>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  bool _animationStarted = false;

  @override
  void initState() {
    super.initState();

    // Register the observer to listen for app lifecycle changes
    WidgetsBinding.instance.addObserver(this);

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _widthAnimation = Tween<double>(
      begin: widget.minWidth,
      end: widget.maxWidth,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation if the widget is mounted and visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && ModalRoute.of(context)?.isCurrent == true) {
        _startAnimation();
      }
    });
  }

  void _startAnimation() {
    if (!_animationStarted) {
      _animationStarted = true;
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Start the animation when the app is resumed
    if (state == AppLifecycleState.resumed) {
      if (mounted && !_animationController.isCompleted) {
        _startAnimation();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _widthAnimation,
        builder: (context, child) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: _widthAnimation.value,
              height: widget.height,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(0),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: _widthAnimation.value < 60
                  ? Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(AllImages().officeIcon))
                  : Center(
                    child: Text(
                        "600 P",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ColorConstants().stoneWhite),
                      ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
