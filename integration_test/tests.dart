import 'package:flutter_test/flutter_test.dart';

import 'common/index.dart';
import 'utils/utils.dart';

Future<void> initLogin({required WidgetTester tester, required CommonCaseType type}) async {
  await login(tester: tester, type: type);
}

Future<void> initItemSelection({required WidgetTester tester, required CommonCaseType type}) async {
  await login(tester: tester, type: type);
  await home(tester: tester, type: type);
}
