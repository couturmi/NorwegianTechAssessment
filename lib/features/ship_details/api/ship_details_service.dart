import 'package:norwegian_tech_assessment/core/norwegian_rest_client.dart';
import 'package:norwegian_tech_assessment/core/rest_client.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/ship_details.dart';

class ShipDetailsService {
  static const String servicePath = "/cruise-ships";

  final RestClient _restClient;

  ShipDetailsService({
    RestClient? restClient,
  }) : _restClient = restClient ?? NorwegianRestClient();

  Future<ShipDetails> getShipDetails(CruiseShip cruiseShip) async {
    var response =
        await _restClient.get(path: "$servicePath/${cruiseShip.name}");
    return ShipDetails.fromJson(response);
  }
}
