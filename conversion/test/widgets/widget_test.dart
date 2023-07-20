import 'package:conversion/widgets/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ///1 - Para achar um widget por chave

  testWidgets('Find and check Stack Widget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Home()),
    );

    await tester.pumpAndSettle();

    final widget = find.byKey(const ValueKey('StackKey'));

    expect(widget, findsOneWidget);
  });

  testWidgets('Search for container that has money image', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Home()),
    );

    await tester.pumpAndSettle();

    final widget = find.byKey(const ValueKey('MoneyImageContainerKey'));

    expect(widget, findsOneWidget);
  });
}
