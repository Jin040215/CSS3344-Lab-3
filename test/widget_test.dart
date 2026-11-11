import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_3/main.dart';

void main() {
  testWidgets('Rajang River Cruise app renders correctly and handles interactions',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify title and location are displayed
    expect(find.text('Rajang River Cruise Details'), findsOneWidget);
    expect(find.text('Rajang River Cruise'), findsWidgets);
    expect(find.text('Sibu, Sarawak, Malaysia'), findsWidgets);

    // Verify initial star count is 41
    expect(find.text('41'), findsOneWidget);

    // Tap star button to increment rating
    await tester.tap(find.byTooltip('Rate / Favorite'));
    await tester.pumpAndSettle();

    // Verify star count incremented to 42
    expect(find.text('42'), findsOneWidget);

    // Verify action buttons exist
    expect(find.text('CALL'), findsOneWidget);
    expect(find.text('ROUTE'), findsOneWidget);
    expect(find.text('SHARE'), findsOneWidget);

    // Verify interactive controls exist
    expect(find.text('Visit Date Picker'), findsOneWidget);
    expect(find.text('Cruise Package'), findsOneWidget);
    expect(find.text('Dark Mode Theme'), findsOneWidget);
  });
}
