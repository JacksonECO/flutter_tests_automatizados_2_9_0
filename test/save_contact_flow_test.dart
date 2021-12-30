import 'package:bytebank/main.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matchers.dart';
import 'mocks.dart';

void main() {
  testWidgets('Should save a contact', (WidgetTester tester) async {
    final MockContactDao mockContactDao = MockContactDao();
    await tester.pumpWidget(BytebankApp(contactDao: mockContactDao));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferFeatureItem = featureItemMatcher('Transfer', Icons.monetization_on);
    expect(transferFeatureItem, findsOneWidget);

    await tester.tap(transferFeatureItem);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    // Verifica de a função foi chamada pelo menos uma vez com o verify do mockito,
    // Também é possível definir a quantidade que foi chamada da seguinte forma forma
    verify(mockContactDao.findAll()).called(1);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);

    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = textFieldMatcher('Full name');
    expect(nameTextField, findsOneWidget);

    await tester.enterText(nameTextField, 'Alex');

    final accountNumberTextField = textFieldMatcher('Account number');
    expect(accountNumberTextField, findsOneWidget);

    await tester.enterText(accountNumberTextField, '1000');

    // ignore: deprecated_member_use
    final createButton = find.widgetWithText(RaisedButton, 'Create');
    expect(createButton, findsOneWidget);

    await tester.tap(createButton);
    await tester.pumpAndSettle();

    // Para isso foi preciso sobrecarregar o operador == na class Contact
    verify(mockContactDao.save(Contact(0, 'Alex', 1000)));

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);

    verify(mockContactDao.findAll());
  });
}
