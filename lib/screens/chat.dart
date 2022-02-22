import 'package:flutter/material.dart';
import 'package:safeherven_app/shared/drawer.dart';
import 'package:safeherven_app/shared/bottom.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Let's Talk"),),
      // drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(
      ),
    );
  }
}