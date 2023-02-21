import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

part 'styles.dart';

// ignore_for_file: avoid_print

//TODO: change function name in future
//This function is created so we can handel errors and messages

enum ScreenType { login, itemSelection }

//Quick => Will check only required test case in file || all => Will check all test cases in file
enum CommonCaseType { quick, all }

const Duration duration500ms = Duration(milliseconds: 500);
const Duration duration1s = Duration(seconds: 1);
const Duration duration2s = Duration(seconds: 2);
const Duration duration5s = Duration(seconds: 5);
const Duration duration10s = Duration(seconds: 10);
const Duration duration20s = Duration(seconds: 20);
const Duration duration40s = Duration(seconds: 40);
const Duration duration60s = Duration(seconds: 60);

enum FindBy { text, key }

Future<void> doTest(List<String> navigationRoutes, dynamic Function() body) async {
  try {
    await body();
    print(testStyle(navigationRoutes, 'pass'));
  } catch (e) {
    print(testStyle(navigationRoutes, 'fail'));
    print(e);
    rethrow;
  }
}

String testStyle(List<String> navigationRoutes, String type) {
  if (type == 'pass') {
    String pasBGTag = _applyStyle(Styles.bgGreen, " ✔ PASS ");
    String passNavigation = getNavigationString(navigationRoutes, Styles.green);

    return "$pasBGTag $passNavigation";
  } else {
    String failBGTag = _applyStyle(Styles.bgRed, " ✘ FAIL ");
    String failNavigation = getNavigationString(navigationRoutes, Styles.red);

    return "$failBGTag $failNavigation";
  }
}

String getNavigationString(List<String> navigationRoutes, Styles style) {
  String val = '';
  for (String value in navigationRoutes) {
    int index = navigationRoutes.indexOf(value);
    var nav = _applyStyle(style, value);
    var arrow = index + 1 < navigationRoutes.length ? _applyStyle(Styles.blue, ' > ') : '';
    val += (nav + arrow);
  }

  return val;
}

Future<void> expectWidgets({required WidgetTester tester, dynamic value, int? widgetCount, Duration? pumpDuration}) async {
  expect(value, findsNWidgets(widgetCount ?? 1));
  await tester.pumpAndSettle(pumpDuration ?? duration500ms);
}

Future<void> tap({required WidgetTester tester, required Finder finder, Duration? pumpDuration}) async {
  await tester.tap(finder);
  await tester.pumpAndSettle(pumpDuration ?? duration500ms);
}

Future<void> enterText({required WidgetTester tester, required Finder finder, required String text, Duration? pumpDuration}) async {
  await tester.enterText(finder, text);
  await tester.pumpAndSettle(pumpDuration ?? duration500ms);
}

Future<void> fireOnRichTextTap(Finder finder, String text) async {
  final Element element = finder.evaluate().single;
  final RenderParagraph paragraph = element.renderObject as RenderParagraph;
  // The children are the individual TextSpans which have GestureRecognizers
  paragraph.text.visitChildren((dynamic span) {
    if (span.text != text) return true; // continue iterating.

    (span.recognizer as TapGestureRecognizer).onTap!();
    return false; // stop iterating, we found the one.
  });
}
