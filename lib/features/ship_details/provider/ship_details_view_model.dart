import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/ship_details.dart';
import 'package:norwegian_tech_assessment/features/ship_details/api/ship_details_service.dart';

class ShipDetailsViewModel extends ChangeNotifier {
  final CruiseShip cruiseShip;
  final ShipDetailsService _shipDetailsService;

  ShipDetails? _shipDetailsDTO;
  bool _errorOccurred;

  bool get hasErrors => _errorOccurred;
  bool get isLoading => !_errorOccurred && _shipDetailsDTO == null;
  ShipDetails? get shipDetails => _shipDetailsDTO;

  ShipDetailsViewModel({
    required this.cruiseShip,
    ShipDetailsService? shipDetailsService,
  })  : _errorOccurred = false,
        _shipDetailsService = shipDetailsService ?? ShipDetailsService();

  Future<void> retrieveShipDetails() async {
    // Clear the current state to notify the view that new data is loading.
    _resetState();
    // Get details for the given [cruiseShip].
    try {
      _shipDetailsDTO = await _shipDetailsService.getShipDetails(cruiseShip);
    } catch (e) {
      _errorOccurred = true;
    }
    notifyListeners();
  }

  void _resetState() {
    _shipDetailsDTO = null;
    _errorOccurred = false;
    notifyListeners();
  }
}
