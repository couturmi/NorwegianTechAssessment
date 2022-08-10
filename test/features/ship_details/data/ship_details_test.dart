import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:norwegian_tech_assessment/features/ship_details/data/ship_details.dart';

void main() {
  group("ShipDetails", () {
    test("fromJson", () {
      var json = '''
        {
          "shipName": "Norwegian Mock",
          "shipFacts": {
            "passengerCapacity": "10000",
            "crew": "1500",
            "inauguralDate": "2001"
          },
          "bgeImagePath": "path/to/image",
          "highlights": [
            "Highlight 1",
            "Highlight 2"
          ]
        }
      ''';
      final shipDetailsDTO = ShipDetails.fromJson(jsonDecode(json));

      expect(shipDetailsDTO, isNotNull);
      expect(shipDetailsDTO.shipName, "Norwegian Mock");
      expect(shipDetailsDTO.passengerCapacity, "10000");
      expect(shipDetailsDTO.crewCount, "1500");
      expect(shipDetailsDTO.inauguralDate, "2001");
      expect(shipDetailsDTO.imagePath, "https://www.ncl.com/path/to/image");
      expect(shipDetailsDTO.highlights.length, 2);
      expect(shipDetailsDTO.highlights[0], "Highlight 1");
      expect(shipDetailsDTO.highlights[1], "Highlight 2");
    });
  });
}
