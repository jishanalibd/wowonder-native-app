import 'package:flutter_test/flutter_test.dart';
import 'package:wowonder_mobile/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WoWonderApp());

    // Verify that the app builds without errors
    expect(find.byType(WoWonderApp), findsOneWidget);
  });
}
