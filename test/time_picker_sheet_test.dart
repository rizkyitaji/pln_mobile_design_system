import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

void main() {
  Widget buildTestWidget({
    required DateTime date,
    DateTime? selectedDateTime,
    void Function(DateTime?)? onResult,
  }) {
    return MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showAppTimePickerSheet(
                    context: context,
                    date: date,
                    selectedDateTime: selectedDateTime,
                  );
                  onResult?.call(result);
                },
                child: const Text('Open Picker'),
              ),
            );
          },
        ),
      ),
    );
  }

  testWidgets('renders AppTimePickerSheet correctly with initial time', (
    tester,
  ) async {
    DateTime? selectedResult;
    final date = DateTime(2026, 9, 21, 8, 0);

    await tester.pumpWidget(
      buildTestWidget(
        date: date,
        selectedDateTime: date,
        onResult: (res) => selectedResult = res,
      ),
    );

    // Open sheet
    await tester.tap(find.text('Open Picker'));
    await tester.pumpAndSettle();

    // Verify title and button
    expect(find.text('Pilih Jam Mulai Pelaksanaan'), findsOneWidget);
    expect(find.text('Pilih'), findsOneWidget);

    // Verify colon is present
    expect(find.text(':'), findsWidgets);

    // Confirm selection
    await tester.tap(find.text('Pilih'));
    await tester.pumpAndSettle();

    expect(selectedResult, isNotNull);
    expect(selectedResult!.hour, equals(8));
    expect(selectedResult!.minute, equals(0));
  });

  testWidgets(
    'manual input keeps keyboard open on 1st digit and can type 2 digits',
    (tester) async {
      DateTime? selectedResult;
      final date = DateTime(2026, 9, 21, 8, 0);

      await tester.pumpWidget(
        buildTestWidget(
          date: date,
          selectedDateTime: date,
          onResult: (res) => selectedResult = res,
        ),
      );

      // Open sheet
      await tester.tap(find.text('Open Picker'));
      await tester.pumpAndSettle();

      // Tap on selected hour '08' in the center row
      await tester.tap(find.text('08').first);
      await tester.pumpAndSettle();

      // Verify TextField appears for hour input
      expect(find.byType(TextField), findsOneWidget);

      // Enter ONLY 1 digit '1'
      await tester.enterText(find.byType(TextField), '1');
      await tester.pumpAndSettle();

      // TextField MUST still be present (keyboard NOT closed on 1st digit)
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('1'), findsOneWidget);

      // Enter second digit '5' -> '15'
      await tester.enterText(find.byType(TextField), '15');
      await tester.pumpAndSettle();

      // After 2 digits, focus moves to minute TextField
      expect(find.byType(TextField), findsOneWidget);

      // Enter minute '4' (1 digit)
      await tester.enterText(find.byType(TextField), '4');
      await tester.pumpAndSettle();

      // Still present
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('4'), findsOneWidget);

      // Enter second digit '5' -> '45'
      await tester.enterText(find.byType(TextField), '45');
      await tester.pumpAndSettle();

      // Confirm selection
      await tester.tap(find.text('Pilih'));
      await tester.pumpAndSettle();

      expect(selectedResult, isNotNull);
      expect(selectedResult!.hour, equals(15));
      expect(selectedResult!.minute, equals(45));
    },
  );

  testWidgets(
    'manual input clamps values out of range to 23 for hour and 59 for minute',
    (tester) async {
      DateTime? selectedResult;
      final date = DateTime(2026, 9, 21, 8, 0);

      await tester.pumpWidget(
        buildTestWidget(
          date: date,
          selectedDateTime: date,
          onResult: (res) => selectedResult = res,
        ),
      );

      // Open sheet
      await tester.tap(find.text('Open Picker'));
      await tester.pumpAndSettle();

      // Tap on selected hour '08'
      await tester.tap(find.text('08').first);
      await tester.pumpAndSettle();

      // Enter hour out of format: '28' (or > 23)
      await tester.enterText(find.byType(TextField), '28');
      await tester.pumpAndSettle();

      // Focus moved to minute, now enter minute out of format: '75' (or > 59)
      await tester.enterText(find.byType(TextField), '75');
      await tester.pumpAndSettle();

      // Confirm selection
      await tester.tap(find.text('Pilih'));
      await tester.pumpAndSettle();

      expect(selectedResult, isNotNull);
      // Hour clamped to 23
      expect(selectedResult!.hour, equals(23));
      // Minute clamped to 59
      expect(selectedResult!.minute, equals(59));
    },
  );

  testWidgets('can scroll wheels to change hour and minute', (tester) async {
    DateTime? selectedResult;
    final date = DateTime(2026, 9, 21, 10, 20);

    await tester.pumpWidget(
      buildTestWidget(
        date: date,
        selectedDateTime: date,
        onResult: (res) => selectedResult = res,
      ),
    );

    // Open sheet
    await tester.tap(find.text('Open Picker'));
    await tester.pumpAndSettle();

    // Find wheels
    final wheels = find.byType(ListWheelScrollView);
    expect(wheels, findsNWidgets(2));

    // Drag hour wheel downwards to decrease hour or upwards to increase
    await tester.drag(wheels.first, const Offset(0, -112)); // drag 2 items
    await tester.pumpAndSettle();

    // Drag minute wheel
    await tester.drag(wheels.last, const Offset(0, -56)); // drag 1 item
    await tester.pumpAndSettle();

    // Confirm
    await tester.tap(find.text('Pilih'));
    await tester.pumpAndSettle();

    expect(selectedResult, isNotNull);
    expect(selectedResult!.hour, equals(12));
    expect(selectedResult!.minute, equals(21));
  });

  testWidgets('close button dismisses sheet without selection', (tester) async {
    DateTime? selectedResult;
    final date = DateTime(2026, 9, 21, 8, 0);

    await tester.pumpWidget(
      buildTestWidget(
        date: date,
        selectedDateTime: date,
        onResult: (res) => selectedResult = res,
      ),
    );

    // Open sheet
    await tester.tap(find.text('Open Picker'));
    await tester.pumpAndSettle();

    // Tap close button
    await tester.tap(find.byType(AppBackButton));
    await tester.pumpAndSettle();

    expect(selectedResult, isNull);
  });
}
