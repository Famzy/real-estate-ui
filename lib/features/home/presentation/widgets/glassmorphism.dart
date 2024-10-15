import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final Color color;

  const GlassContainer({
    Key? key,
    required this.child,
    this.blur = 10.0, // Default blur for frosted effect
    this.opacity = 0.2, // Default opacity for the glass effect
    this.color = Colors.white, // Default tint color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // Rounded corners
      child: Stack(
        children: [
          // Apply a blur to the background content
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              color: color.withOpacity(opacity), // Transparent color for glass effect
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}