import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safeherven_app/shared/drawer.dart';
import 'package:safeherven_app/shared/bottom.dart';
import 'package:flutter_config/flutter_config.dart';

// class SafeSpotsScreen extends StatelessWidget {
//   const SafeSpotsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Find Safe Spots'),),
//       drawer: const MenuDrawer(),
//       bottomNavigationBar: const MenuBottom(),
//       body: const MapSample(),
//     );
//   }
// }


class SafeSpotsScreen extends StatefulWidget {
  const SafeSpotsScreen({Key? key}) : super(key: key);

  @override
  _SafeSpotsScreenState createState() => _SafeSpotsScreenState();
}

class _SafeSpotsScreenState extends State<SafeSpotsScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Find Safe Spots'),
          backgroundColor: Colors.purple,
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
