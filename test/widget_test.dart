// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:characters_coding_test/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:characters_coding_test/main_simpsons.dart';

void main() {
  test('Simpsons variant title is correct', () {
    final variant = Simpsons();
    expect(variant.title, 'The Simpsons');
  });

  test('The Wire variant title is correct', () {
    final variant = TheWire();
    expect(variant.title, 'The Wire');
  });
}
