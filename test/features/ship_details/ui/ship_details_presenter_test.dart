import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:norwegian_tech_assessment/features/ship_details/provider/ship_details_view_model.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_error_screen.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_presenter.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_screen.dart';
import 'package:provider/provider.dart';

import '../ship_details_mocks.dart';

void main() {
  group("ShipDetailsPresenter", () {
    Widget _buildWidget(MockShipDetailsViewModel shipDetailsViewModel) {
      return MaterialApp(
        home: ChangeNotifierProvider<ShipDetailsViewModel>(
          create: (_) => shipDetailsViewModel,
          child: const ShipDetailsPresenter(),
        ),
      );
    }

    testWidgets("When data loading", (widgetTester) async {
      MockShipDetailsViewModel viewModel = MockShipDetailsViewModel.loading();
      await widgetTester.pumpWidget(
        _buildWidget(viewModel),
      );

      verify(viewModel.retrieveShipDetails()).called(1);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ShipDetailsErrorScreen), findsNothing);
      expect(find.byType(ShipDetailsScreen), findsNothing);
    });

    testWidgets("When error occurs", (widgetTester) async {
      MockShipDetailsViewModel viewModel = MockShipDetailsViewModel.error();
      await widgetTester.pumpWidget(
        _buildWidget(viewModel),
      );

      verify(viewModel.retrieveShipDetails()).called(1);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ShipDetailsErrorScreen), findsOneWidget);
      expect(find.byType(ShipDetailsScreen), findsNothing);
    });

    testWidgets("When data load is successful", (widgetTester) async {
      MockShipDetailsViewModel viewModel = MockShipDetailsViewModel.success();
      await widgetTester.pumpWidget(
        _buildWidget(viewModel),
      );

      verify(viewModel.retrieveShipDetails()).called(1);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ShipDetailsErrorScreen), findsNothing);
      expect(find.byType(ShipDetailsScreen), findsOneWidget);
    });
  });
}
