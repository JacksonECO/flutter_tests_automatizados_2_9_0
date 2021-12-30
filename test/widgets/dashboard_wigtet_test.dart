import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helps/matchers.dart';

void main() {
  testWidgets('Should display the main image whe the DashBoard is opened', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Dashboard(),
      ),
    );

    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets(
    'Should display the transfer feature when the Dashboard is opened',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Dashboard(),
        ),
      );

      // final iconTransferFeatureItem = find.widgetWithIcon(FeatureItem, Icons.monetization_on);
      // expect(iconTransferFeatureItem, findsOneWidget);

      // final nameTransferFeatureItem = find.widgetWithText(FeatureItem, 'Transfer');
      // expect(nameTransferFeatureItem, findsOneWidget);

      expect(featureItemMatcher('Transfer', Icons.monetization_on), findsOneWidget);
    },
  );

  testWidgets(
    'Should display the transaction feed feature when the Dashboard is opened',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Dashboard(),
        ),
      );

      // final iconTransactionFeedFeatureItem = find.widgetWithIcon(FeatureItem, Icons.description);
      // expect(iconTransactionFeedFeatureItem, findsOneWidget);

      // final nameTransactionFeedFeatureItem = find.widgetWithText(FeatureItem, 'Transaction Feed');
      // expect(nameTransactionFeedFeatureItem, findsOneWidget);

      expect(featureItemMatcher('Transaction Feed', Icons.description), findsOneWidget);
    },
  );
}


