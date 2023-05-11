import 'package:device_preview/device_preview.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:portfolio_project/bootstrap.dart';

void main() {
  bootstrap(
    () => DevicePreview(
      enabled: true,
      builder: (context) => const App(),
    ),
  );
}
