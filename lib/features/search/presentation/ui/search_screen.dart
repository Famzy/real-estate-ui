import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:latlong2/latlong.dart';
import 'package:realestate/core/utils/image_constants.dart';
import 'package:realestate/features/search/presentation/notifier/maps_change_notifier.dart';
import 'package:realestate/features/search/presentation/widgets/animation/fade_in_expanded.dart';
import 'package:realestate/features/search/presentation/widgets/custom_marker_widget.dart';
import 'package:realestate/features/search/presentation/widgets/map_fab_action.dart';
import 'package:realestate/features/search/presentation/widgets/maps_circle_widget.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController? _cameraAnimationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(nearByVendorsProvider.notifier).updateMarkers();

    markerHeight = (30 / 60) * maxWidth;
  }

  @override
  void dispose() {
    // Remove the observer when the widget is disposed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final double minWidth = 30.0;
  final double maxWidth = 60.0;
  late final double markerHeight;
  @override
  Widget build(BuildContext context) {
    final vendors = ref.watch(nearByVendorsProvider);
    return Scaffold(
        floatingActionButton: const MapFabAction(),
        body: Stack(
          children: [
            FlutterMap(
              mapController: vendors.mapController,
              options: MapOptions(
                center: vendors.center,
                zoom: 14.0,
                onTap: (tapPosition, point) {},
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}@2x.png',
                  subdomains: const ['a', 'b', 'c', 'd'],
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: List.generate(vendors.points.length, (index) {
                    return Marker(
                      width: maxWidth, // Set to maxWidth
                      height: markerHeight,
                      point: vendors.points[index],
                      anchorPos: AnchorPos.align(AnchorAlign.left),
                      builder: (ctx) => AnimatedMarker(
                        onTap: () => _onMarkerTap(
                            vendors.points[index], vendors.mapController),
                        minWidth: minWidth,
                        maxWidth: maxWidth,
                        height: markerHeight,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  '© Real-Estate App',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
            ),
            Positioned(
              top: 50.h,
              left: 24.w,
              right: 24.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInExpandWidget(
                    child: Container(
                      height: 41.h,
                      width: 255.w,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 0.7,
                            child: SvgPicture.asset(
                                AllImages().outlinedSearchIcon),
                          ),
                          Gap(5.w),
                          Text(
                            "List of variants",
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(5.w),
                  FadeInExpandWidget(
                    child: MapCircleWidget(
                      itemHeight: 40,
                      itemWidth: 40,
                      itemColor: Colors.white,
                      assetColor: Colors.black,
                      asset: AllImages().settingsIcon,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void _onMarkerTap(LatLng destLocation, MapController _mapController) {
    final latTween = Tween<double>(
      begin: _mapController.center.latitude,
      end: destLocation.latitude,
    );

    final lngTween = Tween<double>(
      begin: _mapController.center.longitude,
      end: destLocation.longitude,
    );

    // No change in zoom level
    final zoomTween = Tween<double>(
      begin: _mapController.zoom,
      end: _mapController.zoom,
    );

    // Dispose of any existing animation controller
    _cameraAnimationController?.dispose();

    _cameraAnimationController = AnimationController(
      duration: const Duration(seconds: 2), // Adjust duration as needed
      vsync: this,
    );

    final animation = CurvedAnimation(
      parent: _cameraAnimationController!,
      curve: Curves.easeInOut,
    );

    _cameraAnimationController!.addListener(() {
      _mapController.move(
        LatLng(
          latTween.evaluate(animation),
          lngTween.evaluate(animation),
        ),
        zoomTween.evaluate(animation),
      );
    });

    _cameraAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _cameraAnimationController!.dispose();
        _cameraAnimationController = null;
      }
    });

    _cameraAnimationController!.forward();
  }
}
