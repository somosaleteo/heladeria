import 'package:flutter_test/flutter_test.dart';
import 'package:heladeria/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'End-to-end Verificar que ejecute 500 horneados en menos de 15 segundos',
      (WidgetTester widgetTester) async {
    app.main();
    await widgetTester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
    final Finder fab = find.byTooltip('Increment');
    await widgetTester.tap(fab);
    await widgetTester.pumpAndSettle(const Duration(seconds: 15));
    expect(find.text('500'), findsOneWidget);
  });
}
