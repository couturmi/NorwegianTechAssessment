import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/features/ship_details/provider/ship_details_view_model.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_presenter.dart';
import 'package:provider/provider.dart';

/// Entry-point class for widget that is responsible for creating the view model.
class ShipDetailsWidget extends StatelessWidget {
  final CruiseShip cruiseShip;

  const ShipDetailsWidget({required this.cruiseShip, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get to know the ship"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<ShipDetailsViewModel>(
        create: (_) => ShipDetailsViewModel(cruiseShip: cruiseShip),
        child: const ShipDetailsPresenter(),
      ),
    );
  }
}
