import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safeherven_app/models/place.dart';
import 'package:safeherven_app/services/geolocator_service.dart';
import 'package:safeherven_app/services/places_service.dart';

import '../models/place_search.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();


  // Variables
  Position? currentLocation;
  List<PlaceSearch>? searchResults;
  StreamController<Place> selectedLocation = StreamController<Place>();

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }
  searchPLaces(String searchTerm) async {
     searchResults = await placesService.getAutoComplete(searchTerm) as List<PlaceSearch>;
     notifyListeners();
  }
  
  setSelectedLocation(String? placeId) async {
    selectedLocation.add(await placesService.getPlace(placeId));
    notifyListeners();
  }

  @override
  void dispose() {
    selectedLocation.close();
    super.dispose();
  }

}