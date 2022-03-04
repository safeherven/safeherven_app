import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/shared/drawer.dart';
import 'package:safeherven_app/shared/bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: IconButton(
          onPressed: null,
          icon: Image.asset('assets/images/logos/white.png'),
          iconSize: 50,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            width: 200,
            child: Column(
              children: <Widget>[
                Text(
                  'Hi ' + user.displayName.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Welcome back! \nWe are here for you as always to help.',
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const <Widget>[
                  Text(
                    'Need Help?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Explore the menu to find places or  create danger alerts'
                        ' to keep others around you safe. The chatbot is there '
                        'for you if you just wanna talk and let it all out.',
                  ),
                ],
              ),
            ),
          ),
        ],
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