import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_project/counter/counter.dart';
import 'package:portfolio_project/src/app/app_index.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
