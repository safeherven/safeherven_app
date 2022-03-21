class PlaceSearch {
  late final dynamic description;
  late final dynamic placeId;

  PlaceSearch({required this.description, required this.placeId});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
        description: json['description'],
        placeId: json['place_id'],
    );
  }
}