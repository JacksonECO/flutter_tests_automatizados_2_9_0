import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder featureItemMatcher(String text, IconData icon) {
  return find.byWidgetPredicate((widget) {
    if (widget is FeatureItem) {
      return widget.name == text && widget.icon == icon;
    }
    return false;
  });
}
