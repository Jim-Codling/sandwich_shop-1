import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/login_page.dart';

void main() {
  group('LoginPage Widget Tests', () {
    testWidgets('LoginPage builds and shows fields', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Log In'), findsOneWidget);
    });

    testWidgets('Shows error if fields are empty', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      await tester.tap(find.text('Log In'));
      await tester.pump();
      expect(
          find.text('Please enter both email and password.'), findsOneWidget);
    });

    testWidgets('Shows error for invalid email', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      await tester.enterText(find.byType(TextField).first, 'invalidemail');
      await tester.enterText(find.byType(TextField).last, 'password123');
      await tester.tap(find.text('Log In'));
      await tester.pump();
      expect(find.text('Please enter a valid email address.'), findsOneWidget);
    });

    testWidgets('Shows success dialog for valid login', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      await tester.enterText(find.byType(TextField).first, 'user@example.com');
      await tester.enterText(find.byType(TextField).last, 'password123');
      await tester.tap(find.text('Log In'));
      await tester.pump(); // Start animation
      await tester.pump(const Duration(seconds: 1)); // Wait for dialog
      expect(find.text('Login Successful'), findsOneWidget);
      expect(find.textContaining('user@example.com'), findsOneWidget);
      expect(find.textContaining('password123'), findsOneWidget);
    });

    testWidgets('Password field is obscured', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      final passwordField =
          tester.widget<TextField>(find.byType(TextField).last);
      expect(passwordField.obscureText, true);
    });
  });
}
