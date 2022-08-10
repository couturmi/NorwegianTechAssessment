import 'package:mockito/mockito.dart';
import 'package:norwegian_tech_assessment/features/ship_details/api/ship_details_service.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/ship_details.dart';
import 'package:norwegian_tech_assessment/features/ship_details/provider/ship_details_view_model.dart';

class MockShipDetailsService extends Mock implements ShipDetailsService {
  MockShipDetailsService._();

  factory MockShipDetailsService.success() {
    final service = MockShipDetailsService._();
    when(service.getShipDetails(any))
        .thenAnswer((_) async => Future.value(mockShipDetails()));
    return service;
  }

  factory MockShipDetailsService.error() {
    final service = MockShipDetailsService._();
    when(service.getShipDetails(any)).thenThrow(Error());
    return service;
  }

  // Overrides to avoid null-safety mocking errors.
  @override
  Future<ShipDetails> getShipDetails(CruiseShip? cruiseShip) =>
      super.noSuchMethod(Invocation.method(#getShipDetails, [cruiseShip]),
          returnValue: Future.value(ShipDetails()));
}

class MockShipDetailsViewModel extends Mock implements ShipDetailsViewModel {
  MockShipDetailsViewModel._();

  factory MockShipDetailsViewModel.success() {
    final viewModel = MockShipDetailsViewModel._();
    when(viewModel.isLoading).thenReturn(false);
    when(viewModel.hasErrors).thenReturn(false);
    when(viewModel.shipDetails).thenReturn(mockShipDetails());
    return viewModel;
  }

  factory MockShipDetailsViewModel.loading() {
    final viewModel = MockShipDetailsViewModel._();
    when(viewModel.isLoading).thenReturn(true);
    when(viewModel.hasErrors).thenReturn(false);
    return viewModel;
  }

  factory MockShipDetailsViewModel.error() {
    final viewModel = MockShipDetailsViewModel._();
    when(viewModel.isLoading).thenReturn(false);
    when(viewModel.hasErrors).thenReturn(true);
    return viewModel;
  }

  // Overrides to avoid null-safety mocking errors.
  @override
  bool get isLoading =>
      super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false);
  @override
  bool get hasErrors =>
      super.noSuchMethod(Invocation.getter(#hasErrors), returnValue: false);
  @override
  Future<void> retrieveShipDetails() async =>
      super.noSuchMethod(Invocation.method(#retrieveShipDetails, []));
}

ShipDetails mockShipDetails() {
  return ShipDetails(
      shipName: "MockShip",
      inauguralDate: "2022",
      passengerCapacity: "10000",
      crewCount: "2000",
      highlights: ["Test Highlight"]);
}
