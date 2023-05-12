import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:portfolio_project/app/utils/injection.dart';
import 'package:portfolio_project/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  bootstrap(
    () => DevicePreview(
      builder: (context) => const App(),
    ),
  );
}
