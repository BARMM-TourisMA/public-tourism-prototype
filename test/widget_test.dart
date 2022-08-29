import 'package:flutter_test/flutter_test.dart';
import 'package:public_tourism/main.dart';

void main() {
  testWidgets('Home page to show at startup', (WidgetTester tester) async {
    await tester.pumpWidget(const PublicTourismApp());

    expect(find.text('Home Page Here!'), findsOneWidget);
  });
}
