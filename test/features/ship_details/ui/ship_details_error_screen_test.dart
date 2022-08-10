import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:norwegian_tech_assessment/features/ship_details/provider/ship_details_view_model.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_error_screen.dart';
import 'package:provider/provider.dart';

import '../ship_details_mocks.dart';

void main() {
  group("ShipDetailsErrorScreen", () {
    Widget _buildWidget([MockShipDetailsViewModel? shipDetailsViewModel]) {
      return MaterialApp(
        home: ChangeNotifierProvider<ShipDetailsViewModel>(
          create: (_) =>
              shipDetailsViewModel ?? MockShipDetailsViewModel.success(),
          child: const ShipDetailsErrorScreen(),
        ),
      );
    }

    testWidgets("Content test", (widgetTester) async {
      await widgetTester.pumpWidget(_buildWidget());

      expect(find.text("Whoops!"), findsOneWidget);
      expect(
          find.text(
              "Something happened while trying to retrieve the ship details. Try to refresh the page."),
          findsOneWidget);
    });

    testWidgets("Retry button onTap", (widgetTester) async {
      final mockViewModel = MockShipDetailsViewModel.success();
      await widgetTester.pumpWidget(_buildWidget(mockViewModel));

      await widgetTester.tap(find.text("Retry"));
      await widgetTester.pumpAndSettle();

      verify(mockViewModel.retrieveShipDetails()).called(1);
    });
  });
}
