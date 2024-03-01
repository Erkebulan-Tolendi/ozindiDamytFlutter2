import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ozindi_damyt/features/bottom_nav_bar/sport_page/sport_page.dart';

void main() {
  testWidgets('Проверка ListTile и Icon', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SportPage()));

    expect(find.byType(ListTile), findsNWidgets(3));

    expect(find.byType(Icon), findsNWidgets(3));
  });
}
