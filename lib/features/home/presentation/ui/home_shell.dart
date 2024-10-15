import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realestate/core/core.dart';
import 'dart:async';
import 'package:realestate/core/themes/color_constants.dart';
import 'package:realestate/features/home/presentation/widgets/custom_bottom_bar.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
      : super(key: key);

  final StatefulNavigationShell navigationShell;
  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> {
  bool _isVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goBranch(2);
      // Delay of 3 seconds before starting the animation
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _isVisible = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.navigationShell.currentIndex == 0 &&
            Navigator.of(context).canPop()) {
          // If on the home tab and there's a route to pop, pop the route
          Navigator.of(context).pop();
          return false; // Prevent the app from exiting
        } else if (widget.navigationShell.currentIndex != 0) {
          // If not on the home tab, switch to the home tab
          context.go(AppRoutes.home);
          return false; // Prevent the app from exiting
        }
        return true; // Allow the app to exit
      },
      child: Scaffold(
        body: Stack(
          children: [
            widget.navigationShell,
            AnimatedPositioned(
              duration:
                  const Duration(milliseconds: 500), // Duration of the slide-in
              curve: Curves.easeInOut, // Slide animation curve
              bottom: _isVisible ? 0 : -300, // Start off-screen, slide to 50px
              left: 0,
              right: 0,
              child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: CustomBottomBar(
                  onDestinationSelected: _goBranch,
                  selectedIndex: widget.navigationShell.currentIndex,
                ),
              ), // Bottom nav bar widget
            ),
          ],
        ),
        backgroundColor: ColorConstants().secondaryColor,
        bottomNavigationBar: const SizedBox.shrink(),
      ),
    );
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: false,
    );
  }
}
