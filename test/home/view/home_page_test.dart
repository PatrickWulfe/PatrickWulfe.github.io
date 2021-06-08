import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_webapp/home/home.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// HomePage tests
  group('HomePage', () {
    testWidgets(
      'test renders HomePage',
      (tester) async {
        await tester.pumpApp(const HomePage());
        expect(find.byType(HomePage), findsOneWidget);
      },
    );

    group('HomeView', () {});
  });
}
