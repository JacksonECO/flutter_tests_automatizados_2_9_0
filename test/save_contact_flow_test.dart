import 'package:bytebank/main.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matchers.dart';

void main() {
  testWidgets('Should save a contact', (WidgetTester tester) async {
    await tester.pumpWidget(BytebankApp());

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferFeatureItem = featureItemMatcher('Transfer', Icons.monetization_on);
    expect(transferFeatureItem, findsOneWidget);

    await tester.tap(transferFeatureItem);
    await tester.pump();
    await tester.pump();

    final contactsListt = find.byType(ContactsList);
    expect(contactsListt, findsOneWidget);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);

    await tester.tap(fabNewContact);
    await tester.pump();
    await tester.pump();
    await tester.pump();

    /// Apresenta problemas :(

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);
  });
}
