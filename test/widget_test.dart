import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nepal_quiz_app/screens/login_screen.dart';

void main() {
  testWidgets('Login Screen renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify that the login screen has key elements
    expect(find.text('Nepal Quiz App'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Create New Account'), findsOneWidget);

    // Verify that the email and password text fields are present
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify the login button is present and enabled
    final loginButton = find.text('Login');
    expect(loginButton, findsOneWidget);

    // Optional: Check button properties if needed
    final buttonWidget = tester.widget<ElevatedButton>(
      find.descendant(of: loginButton, matching: find.byType(ElevatedButton)),
    );
    expect(buttonWidget.enabled, isTrue);
  });

  testWidgets('Login Screen validation works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Try to submit the form without entering any data
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify validation messages appear
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });
}
