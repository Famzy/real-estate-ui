import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapStateData {
  final List<LatLng> points;
  final LatLng center;
  final MapController mapController;
  final double zoom;

  MapStateData({
    required this.points,
    required this.center,
    required this.mapController,
    required this.zoom,
  });

  factory MapStateData.initial() {
    final basePoint = LatLng(52.5200, 13.4050);
    return MapStateData(
      points: [], // Initial points can be empty or pre-populated
      center: basePoint,
      mapController: MapController(),
      zoom: 14.0,
    );
  }

  MapStateData copyWith({
    List<LatLng>? points,
    LatLng? center,
    MapController? mapController,
    double? zoom,
  }) {
    return MapStateData(
      points: points ?? this.points,
      center: center ?? this.center,
      mapController: mapController ?? this.mapController,
      zoom: zoom ?? this.zoom,
    );
  }
}
