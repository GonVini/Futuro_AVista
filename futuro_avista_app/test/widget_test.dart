import 'package:flutter_test/flutter_test.dart';
import 'package:futuro_avista_app/main.dart';

void main() {
  testWidgets('App inicializa com a Home', (tester) async {
    await tester.pumpWidget(const FuturoAvistaApp());
    expect(find.text('Vivencie profissões em minutos'), findsOneWidget);
  });
}
