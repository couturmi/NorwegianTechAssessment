import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/ship_details.dart';
import 'package:norwegian_tech_assessment/features/ship_details/ui/ship_details_screen.dart';

import '../ship_details_mocks.dart';

void main() {
  group("ShipDetailsScreen", () {
    testWidgets("Content test 1", (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: ShipDetailsScreen(shipDetails: mockShipDetails()),
        ),
      );

      expect(find.text("MockShip"), findsOneWidget);
      expect(find.text("Inaugural Date: 2022"), findsOneWidget);
      expect(find.text("Capacity: 10000"), findsOneWidget);
      expect(find.text("Total Crew: 2000"), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(2));
    });

    testWidgets("Content test 2", (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: ShipDetailsScreen(
            shipDetails: ShipDetails(
              shipName: "Norwegian Mock",
              inauguralDate: "1995",
              passengerCapacity: "10",
              crewCount: "1000",
            ),
          ),
        ),
      );

      expect(find.text("Norwegian Mock"), findsOneWidget);
      expect(find.text("Inaugural Date: 1995"), findsOneWidget);
      expect(find.text("Capacity: 10"), findsOneWidget);
      expect(find.text("Total Crew: 1000"), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(2));
    });
  });
}
