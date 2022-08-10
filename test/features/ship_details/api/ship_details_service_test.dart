import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:norwegian_tech_assessment/features/ship_details/api/ship_details_service.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/ship_details.dart';

import '../../../mocks.dart';

void main() {
  group("ShipDetailsService", () {
    test("On success", () async {
      final mockClient = MockRestClient();
      when(mockClient.get(path: anyNamed("path")))
          .thenAnswer((_) => Future.value({}));
      final service = ShipDetailsService(restClient: mockClient);

      final response = await service.getShipDetails(CruiseShip.bliss);

      expect(response, isA<ShipDetails>());
      expect(response, isNotNull);
    });

    test("On error", () async {
      final mockClient = MockRestClient();
      when(mockClient.get(path: anyNamed("path")))
          .thenThrow(HttpResponseException("error", "500"));
      final service = ShipDetailsService(restClient: mockClient);

      expect(() => service.getShipDetails(CruiseShip.bliss),
          throwsA(isA<HttpResponseException>()));
    });
  });
}
