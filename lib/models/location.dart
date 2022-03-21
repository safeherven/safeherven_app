class Location {
  late final double lat;
  late final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Location(
      lat: parsedJson['lat'],
      lng: parsedJson['lng']
    );
  }
}