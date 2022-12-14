import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_widget.dart';
import 'package:norwegian_tech_assessment/shared/app_strings.dart';

/// Button to navigate to a specific ship's details screen.
class ShipDetailsButton extends StatelessWidget {
  final CruiseShip cruiseShip;

  const ShipDetailsButton({required this.cruiseShip, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: OutlinedButton(
        onPressed: () => _navigateToShipDetails(context),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
              "${AppStrings.shipDetailsButtonPrefix} ${StringUtils.capitalize(cruiseShip.name)}"),
        ),
      ),
    );
  }

  /// Navigate to the details page for the given ship [cruiseShip].
  void _navigateToShipDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ShipDetailsWidget(cruiseShip: cruiseShip)),
    );
  }
}
