import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:norwegian_tech_assessment/features/home/ui/home_screen.dart';
import 'package:norwegian_tech_assessment/features/home/ui/ship_details_button.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/cruise_ship_enum.dart';

void main() {
  group("HomeScreen", () {
    testWidgets("Content test", (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: HomeScreen(),
      ));

      expect(find.text("Norwegian Cruise Lines"), findsOneWidget);
      expect(find.text("Check out our cruise options below!"), findsOneWidget);

      int shipTypesCount = CruiseShip.values.length;
      expect(find.byType(ShipDetailsButton), findsNWidgets(shipTypesCount));
      expect(find.text("Norwegian Sky"), findsOneWidget);
      expect(find.text("Norwegian Bliss"), findsOneWidget);
      expect(find.text("Norwegian Escape"), findsOneWidget);
    });
  });
}
