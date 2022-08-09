import 'package:flutter/material.dart';
import 'package:norwegian_tech_assessment/features/home/ui/ship_details_button.dart';
import 'package:norwegian_tech_assessment/features/ship_details/model/cruise_ship_enum.dart';
import 'package:norwegian_tech_assessment/shared/app_bar/welcome_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WelcomeAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/norwegian_background.png"),
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
                  "Check out our cruise options below!",
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
