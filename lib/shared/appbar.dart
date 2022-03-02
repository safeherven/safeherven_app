import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/places.dart';
import 'package:safeherven_app/screens/alert.dart';
import 'package:safeherven_app/screens/home.dart';

class SafeHervenAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  final Size preferredSize;

  final String title;

  SafeHervenAppBar(
      this.title, { Key? key,}) : preferredSize = const Size.fromHeight(50.0),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
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
    );
  }
}

