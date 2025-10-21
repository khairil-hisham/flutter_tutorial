// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/main.dart'; // <-- change to your actual import

void main() {
  testWidgets('App builds without errors', (WidgetTester tester) async {
    // Try to build the app
    await tester.pumpWidget(const MyApp());

    // Let all frames settle
    await tester.pumpAndSettle();

    // If we reached here with no exceptions, the test passes
    expect(find.byType(MyApp), findsOneWidget);
  });
}
