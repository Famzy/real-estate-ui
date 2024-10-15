import 'dart:async';
import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:realestate/core/usecase/usecase.dart';

class RandomLocationsUseCase implements UseCase<Set<LatLng>, int> {
  final LatLng _centralPoint = LatLng(52.5200, 13.4050);

  @override
  Future<Set<LatLng>> call({int? params}) async =>
      await _generateNearbyMarkers(params!);

  generateTestMarkers(int numMarkers) => _generateNearbyMarkers(numMarkers);

  Future<Set<LatLng>> _generateNearbyMarkers(int numMarkers) async {
    Set<LatLng> markerLatLang = {};
    const double earthRadius = 6371.0; // Radius of Earth in kilometers

    for (int i = 0; i < numMarkers; i++) {
      // Random angle and distance within 20 km
      double distanceKm = Random().nextDouble() * 200; // 0 to 50 km
      double angle = Random().nextDouble() * 2 * pi; // Random direction

      // Calculate new latitude and longitude
      double deltaLat = distanceKm / earthRadius;
      double deltaLng =
          distanceKm / (earthRadius * cos(pi * _centralPoint.latitude / 180.0));

      double newLat = _centralPoint.latitude + deltaLat * cos(angle);
      double newLng = _centralPoint.longitude + deltaLng * sin(angle);

      markerLatLang.add(LatLng(newLat, newLng));
    }

    return markerLatLang;
  }
}
