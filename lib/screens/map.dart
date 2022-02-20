import 'package:flutter/material.dart';
import 'package:safeherven_app/shared/drawer.dart';
import 'package:safeherven_app/shared/bottom.dart';

class SafeSpotsScreen extends StatelessWidget {
  const SafeSpotsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Safe Spots'),),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(
      ),
    );
  }
}