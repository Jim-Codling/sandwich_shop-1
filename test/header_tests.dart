import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/widgets/app_header.dart';

void main() {
  group('AppHeader Widget Tests', () {
    testWidgets('AppHeader builds', (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: AppHeader(title: 'My Shop'))));
      expect(find.byType(AppHeader), findsOneWidget);
    });

    testWidgets('AppHeader displays app title', (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: AppHeader(title: 'My Shop'))));
      expect(find.textContaining('Sandwich Shop'), findsWidgets);
    });

    testWidgets('AppHeader displays navigation icons', (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: AppHeader(title: 'My Shop'))));
      expect(find.byIcon(Icons.home), findsWidgets);
      expect(find.byIcon(Icons.shopping_cart), findsWidgets);
      expect(find.byIcon(Icons.info_outline), findsWidgets);
    });

    testWidgets('AppHeader displays login button', (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: AppHeader(title: 'My Shop'))));
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    });

    testWidgets('AppHeader responds to login button tap', (tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: AppHeader(title: 'My Shop'))));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pumpAndSettle();
      // You can add more checks here if navigation or dialog is triggered
    });
  });
}
