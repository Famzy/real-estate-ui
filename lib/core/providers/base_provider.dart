import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Providers {
  static Widget init(Widget child) => ProviderScope(child: child);
}

final routeObserverProvider = Provider((ref) {
  return RouteObserver<ModalRoute>();
});