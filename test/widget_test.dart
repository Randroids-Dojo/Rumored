// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rumored/main.dart';

void main() {
  testWidgets('Can enter rumor and get one back', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('I heard a rumor...'), findsOneWidget);
    expect(find.text('Thanks! Did you hear...'), findsNothing);

    await tester.enterText(find.byType(TextField), 'Bob wears a wig');
    await tester.pumpAndSettle();

    expect(find.text('Bob wears a wig'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Bob wears a wig'), findsNothing);
    expect(find.text('Thanks! Did you hear...'), findsOneWidget);
    expect(find.text('Stefan wears a fake beard!'), findsOneWidget);
  });
}
