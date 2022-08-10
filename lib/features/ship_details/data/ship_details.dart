class ShipDetails {
  static const String detailsBaseImagePath = "https://www.ncl.com/";

  final String shipName;
  final String passengerCapacity;
  final String crewCount;
  final String inauguralDate;
  final String imagePath;
  final List<String> highlights;

  ShipDetails({
    this.shipName = "",
    this.passengerCapacity = "",
    this.crewCount = "",
    this.inauguralDate = "",
    this.imagePath = "",
    this.highlights = const [],
  });

  ShipDetails.fromJson(Map<String, dynamic> json)
      : shipName = json["shipName"] ?? "",
        passengerCapacity = json["shipFacts"]?["passengerCapacity"] ?? "",
        crewCount = json["shipFacts"]?["crew"] ?? "",
        inauguralDate = json["shipFacts"]?["inauguralDate"] ?? "",
        imagePath = json["bgeImagePath"] != null
            ? "$detailsBaseImagePath${json["bgeImagePath"]}"
            : "",
        highlights = List.unmodifiable(json["highlights"] ?? []);
}
