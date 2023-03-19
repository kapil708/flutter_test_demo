import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/utils.dart';

Future<void> home({required WidgetTester tester, required CommonCaseType type}) async {
  List<String> parentNavigation = ["home"];

  await doTest([...parentNavigation, "Click on 1st item"], () async {
    await tap(finder: find.byKey(const Key("item_0")), tester: tester);
  });

  await doTest([...parentNavigation, "Click on 2nd item"], () async {
    await tap(finder: find.byKey(const Key("item_1")), tester: tester);
    await tester.pumpAndSettle(duration1s);
  });
}
