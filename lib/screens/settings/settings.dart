import 'package:flutter/material.dart';
import 'package:safeherven_app/shared/bottom.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/shared/appbar.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SafeHervenAppBar("Settings"),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(
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
