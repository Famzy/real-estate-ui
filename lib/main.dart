import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/app.dart';
import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    Providers.init(const App()),
  );
}
