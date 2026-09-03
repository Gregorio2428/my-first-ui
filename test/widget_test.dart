import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:browser_exam/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const StudyWithCampusApp());
    expect(find.text('Study with Campus'), findsOneWidget);
  });
}