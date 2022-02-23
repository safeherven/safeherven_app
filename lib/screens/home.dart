import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/shared/drawer.dart';
import 'package:safeherven_app/shared/bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Safe Herven'),),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(
        child: Text('Safe Herven!'),
      ),
      floatingActionButton:
      FloatingActionButton(child: const Icon(Icons.chat), onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}