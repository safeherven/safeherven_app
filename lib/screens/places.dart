import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:safeherven_app/blocs/application_bloc.dart';
import 'package:safeherven_app/shared/bottom.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:safeherven_app/shared/appbar.dart';

import '../models/place.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  late GoogleMapController mapController;

  // final LatLng _center = const LatLng(45.521563, -122.677433);
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }
  final Completer<GoogleMapController> _mapController = Completer();
  late StreamSubscription locationSubscription;

  @override
  void initState() {
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);

    // listen for a selected location
    locationSubscription = applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _goToPlace(place);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
        appBar: SafeHervenAppBar("Find Places", isHome: false),
        bottomNavigationBar: const MenuBottom(),
        body: (applicationBloc.currentLocation == null)
        ? const Center(child: CircularProgressIndicator(),)
        : ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search Location",
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) => applicationBloc.searchPLaces(value),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller){
                      _mapController.complete(controller);
                    },
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        applicationBloc.currentLocation!.latitude,
                        applicationBloc.currentLocation!.longitude,
                      ),
                      zoom: 11.0,
                    ),
                  ),
                ),
               if (applicationBloc.searchResults != null &&
                   applicationBloc.searchResults!.isNotEmpty)
               Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.6),
                      backgroundBlendMode: BlendMode.darken
                  ),
                ),
                if (applicationBloc.searchResults != null &&
                    applicationBloc.searchResults!.isNotEmpty)
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: applicationBloc.searchResults?.length??0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          applicationBloc.searchResults![index].description,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          applicationBloc.setSelectedLocation(
                            applicationBloc.searchResults![index].placeId
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ]
        ),
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(place.geometry.location.lat, place.geometry.location.lng),
          zoom: 14
        )
      )
    );
  }

}
