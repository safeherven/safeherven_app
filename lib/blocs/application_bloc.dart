import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safeherven_app/models/geometry.dart';
import 'package:safeherven_app/models/location.dart';
import 'package:safeherven_app/models/place.dart';
import 'package:safeherven_app/services/geolocator_service.dart';
import 'package:safeherven_app/services/marker_service.dart';
import 'package:safeherven_app/services/places_service.dart';

import '../models/place_search.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();


  // Variables
  Position? currentLocation;
  List<PlaceSearch>? searchResults;
  StreamController<Place> selectedLocation = StreamController<Place>.broadcast();
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>.broadcast();
  Place? selectedLocationStatic;
  String? placeType;
  List<Marker> markers = <Marker>[];

  ApplicationBloc() {
    setCurrentLocation();
  }

  Place? get event => null;

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    selectedLocationStatic = Place(
        geometry: Geometry(
            location: Location(
                lat: currentLocation!.latitude,
                lng: currentLocation!.longitude)
        ),
        name: null,
        vicinity: 'none'
    );
    notifyListeners();
  }
  searchPLaces(String searchTerm) async {
     searchResults = await placesService.getAutoComplete(searchTerm) as List<PlaceSearch>;
     notifyListeners();
  }
  
  setSelectedLocation(String? placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(await placesService.getPlace(placeId));
    selectedLocationStatic = sLocation;
    searchResults = null;
    notifyListeners();
  }

  clearSelectedLocation() {
    selectedLocation.add(event!);
    selectedLocationStatic = null;
    searchResults = null;
    placeType = null;
    notifyListeners();
  }

  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
    } else {
      placeType = null;
    }

    if (placeType != null) {
      var places = await placesService.getPlaces(
          selectedLocationStatic!.geometry.location.lat,
          selectedLocationStatic!.geometry.location.lng,
          placeType!,
      );

      markers = [];

      if (places.isNotEmpty) {
        var newMarker = markerService.createMarkerFromPlace(places[0]);
        markers.add(newMarker);
      }

      var locationMarker = markerService.createMarkerFromPlace(selectedLocationStatic!);
      markers.add(locationMarker);

      var _bounds = markerService.bounds(Set<Marker>.of(markers));
      bounds.add(_bounds!);

    }

    notifyListeners();
  }

  @override
  void dispose() {
    selectedLocation.close();
    super.dispose();
  }

}