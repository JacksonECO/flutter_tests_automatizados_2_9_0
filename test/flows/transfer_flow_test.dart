import 'package:bytebank/main.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helps/matchers.dart';
import '../helps/mocks.dart';

main() {
  testWidgets('Should transfer to contact', (tester) async {
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
  });
}
