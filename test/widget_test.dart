import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';

import 'package:rimrid_study/app.dart';

void main() {
  testWidgets('App boots and shows the splash screen', (WidgetTester tester) async {
    await GetStorage.init();
    await tester.pumpWidget(const RimRidStudyApp());
    await tester.pump();

    expect(find.text('RimRid Study'), findsOneWidget);
  });
}
