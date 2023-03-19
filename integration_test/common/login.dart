import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/utils.dart';

Future<void> login({required WidgetTester tester, required CommonCaseType type}) async {
  List<String> parentNavigation = ["login"];

  if (type == CommonCaseType.all) {
    await doTest([...parentNavigation, "Check with null value"], () async {
      await tap(finder: find.byKey(const Key("login_button")), tester: tester);
      await expectWidgets(value: find.text('Please enter some value.'), widgetCount: 2, tester: tester);
    });
  }

  await doTest([...parentNavigation, "Check with correct values"], () async {
    await enterText(finder: find.byKey(const Key('user_name')), text: 'kapil@gmail.com', tester: tester);
    await enterText(finder: find.byKey(const Key('password')), text: 'password', tester: tester);

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(duration500ms);

    await tap(finder: find.byKey(const Key("login_button")), tester: tester);
  });

  await doTest([...parentNavigation, "Find home screen text"], () async {
    await expectWidgets(value: find.text('Home screen').last, tester: tester);
  });
}
