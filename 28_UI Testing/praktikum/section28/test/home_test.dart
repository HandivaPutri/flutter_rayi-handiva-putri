import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:section28/home_screen.dart';

void main() {
  testWidgets('Judul Halaman harus Home Screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    expect(find.text('Home Screen'), findsOneWidget);
  });
}
