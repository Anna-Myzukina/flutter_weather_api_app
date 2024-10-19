class FamousCityModel {
  final String name;
  final double lat;
  final double lon;

  const FamousCityModel({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

// List of famous cities as a constant
List<FamousCityModel> famousCities = const [
  FamousCityModel(name: 'Tokyo', lat: 35.6833, lon: 139.7667),
  FamousCityModel(name: 'New Delhi', lat: 28.5833, lon: 77.2),
  FamousCityModel(name: 'Paris', lat: 48.85, lon: 2.3333),
  FamousCityModel(name: 'London', lat: 51.4833, lon: -0.0833),
  FamousCityModel(name: 'New York', lat: 40.7167, lon: -74.0167),
  FamousCityModel(name: 'Tehran', lat: 35.6833, lon: 51.4167),
];