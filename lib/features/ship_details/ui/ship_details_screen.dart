import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/ship_details/model/cruise_ship_enum.dart';

class ShipDetailsScreen extends StatelessWidget {
  final CruiseShip cruiseShip;

  const ShipDetailsScreen({required this.cruiseShip, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(cruiseShip.name)));
  }
}
