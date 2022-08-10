import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/features/ship_details/provider/ship_details_view_model.dart';

import '../ship_details_mocks.dart';

void main() {
  group("ShipDetailsViewModel", () {
    test("retrieveShipDetails - success", () async {
      final mockShipDetailsService = MockShipDetailsService.success();
      final viewModel = ShipDetailsViewModel(
        cruiseShip: CruiseShip.bliss,
        shipDetailsService: mockShipDetailsService,
      );

      await viewModel.retrieveShipDetails();

      verify(mockShipDetailsService.getShipDetails(any)).called(1);
      expect(viewModel.isLoading, isFalse);
      expect(viewModel.hasErrors, isFalse);
      expect(viewModel.shipDetails, isNotNull);
    });

    test("retrieveShipDetails - error", () async {
      final mockShipDetailsService = MockShipDetailsService.error();
      final viewModel = ShipDetailsViewModel(
        cruiseShip: CruiseShip.bliss,
        shipDetailsService: mockShipDetailsService,
      );

      await viewModel.retrieveShipDetails();

      verify(mockShipDetailsService.getShipDetails(any)).called(1);
      expect(viewModel.isLoading, isFalse);
      expect(viewModel.hasErrors, isTrue);
      expect(viewModel.shipDetails, isNull);
    });
  });
}
