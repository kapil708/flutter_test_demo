// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_demo/main.dart' as app;
import 'package:integration_test/integration_test.dart';

import 'tests.dart';
import 'utils/utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  ScreenType defaultTestType = ScreenType.itemSelection;
  CommonCaseType defaultCaseType = CommonCaseType.all;

  testWidgets("Running test for -> ${defaultTestType.name}", (WidgetTester tester) async {
    ///Init App
    app.main();
    await tester.pumpAndSettle(duration5s);

    switch (defaultTestType) {
      case ScreenType.login:
        await initLogin(tester: tester, type: defaultCaseType);
        break;
      case ScreenType.itemSelection:
        await initItemSelection(tester: tester, type: defaultCaseType);
        break;
    }
  });
}

// command
// flutter test integration_test/index.dart
