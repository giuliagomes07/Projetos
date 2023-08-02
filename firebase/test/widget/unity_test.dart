import 'package:firebase/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RegisterScreen - Campos inválidos', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: RegisterScreen(),
    ));

    // Find the 'Criar conta' button.
    final criarContaButton = find.text('Criar conta');
    expect(criarContaButton, findsOneWidget);

    // Tap the 'Criar conta' button.
    await tester.tap(criarContaButton);
    await tester.pump();

    // Expect a dialog with the error message to be shown.
    final errorMessage = find.text('Por favor, preencha todos os campos.');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('RegisterScreen - Senha inválida', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: RegisterScreen(),
    ));

    // Find the text field for the password.
    final passwordField = find.byType(TextFormField).at(2);
    expect(passwordField, findsOneWidget);

    // Enter a password with less than 6 characters.
    await tester.enterText(passwordField, '12345');

    // Find the 'Criar conta' button.
    final criarContaButton = find.text('Criar conta');
    expect(criarContaButton, findsOneWidget);

    // Tap the 'Criar conta' button.
    await tester.tap(criarContaButton);
    await tester.pump();

    // Expect a dialog with the error message to be shown.
    final errorMessage = find.text('A senha deve ter exatamente 6 caracteres.');
    expect(errorMessage, findsOneWidget);
  });
}
