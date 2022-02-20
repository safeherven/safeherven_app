import 'package:flutter/material.dart';
import 'package:safeherven_app/shared/drawer.dart';
import 'package:safeherven_app/shared/bottom.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us'),),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(
      ),
      floatingActionButton:
      FloatingActionButton(child: const Icon(Icons.chat), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}