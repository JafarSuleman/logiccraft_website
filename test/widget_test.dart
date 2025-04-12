// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logiccraft_website/main.dart';

void main() {
  testWidgets('Home page loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LogicCraftApp());

    // Verify that the app name is displayed
    expect(find.textContaining('LogicCraft'), findsWidgets);
    
    // Additional tests can be implemented here as the app develops
  });
}
