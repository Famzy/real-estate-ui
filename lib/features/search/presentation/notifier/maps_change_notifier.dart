import 'package:latlong2/latlong.dart';
import 'package:realestate/features/search/domain/usecase/get_random_locations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'map_state.dart';

part 'maps_change_notifier.g.dart';

@riverpod
class NearByVendors extends _$NearByVendors {
  final markers = RandomLocationsUseCase();
  @override
  MapStateData build() {
    return MapStateData.initial();
  }

  void updateMarkers() async {
    final points = await markers(params: 10);
    state = state.copyWith(points: points.toList());
  }

  void updateCameraPosition(LatLng center, double zoom) {
    state = state.copyWith(center: center, zoom: zoom);
  }
}
