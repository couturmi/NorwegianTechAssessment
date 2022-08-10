import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/home/ui/ship_details_button.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/shared/app_bar/welcome_app_bar.dart';
import 'package:norwegian_tech_assessment/shared/app_strings.dart';
import 'package:norwegian_tech_assessment/shared/asset_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WelcomeAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstants.homeScreenBackgroundPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
                child: Text(
                  AppStrings.homeScreenMessage,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ..._createShipButtons(),
            ],
          ),
        ),
      ),
    );
  }

  /// Create a list of buttons containing one for each ship.
  List<ShipDetailsButton> _createShipButtons() {
    return CruiseShip.values
        .map((ship) => ShipDetailsButton(cruiseShip: ship))
        .toList();
  }
}
