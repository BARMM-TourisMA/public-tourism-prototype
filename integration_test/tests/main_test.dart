// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:public_tourism/main.dart'  as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); 
  app.main();
  testWidgets('Test test testing', (WidgetTester tester) async {
    expect(true, isTrue);
  });
}