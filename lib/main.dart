import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portfolio_project/bootstrap.dart';
import 'package:portfolio_project/src/app/app_index.dart';

void main() async {
  await dotenv.load(mergeWith: Platform.environment);
  await bootstrap(() => const App());
}
