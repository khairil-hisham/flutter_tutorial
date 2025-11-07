import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App builds without errors', (WidgetTester tester) async {

    // Put a JWT into the mocked SharedPreferences BEFORE pumping the widget.
    SharedPreferences.setMockInitialValues({'jwt': 'fake.jwt.token'});

    // Try to build the app
    await tester.pumpWidget(const MyApp());

    // Let all frames settle
    await tester.pumpAndSettle();

    // If we reached here with no exceptions, the test passes
    expect(find.byType(MyApp), findsOneWidget);
  });
}
