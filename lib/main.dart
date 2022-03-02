import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/places.dart';
import 'package:safeherven_app/screens/about.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/screens/home.dart';
import 'package:safeherven_app/screens/alert.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SafeHervenApp());
}

class SafeHervenApp extends StatelessWidget {
  const SafeHervenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.jostTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/chat': (context) => const ChatScreen(),
        '/map': (context) => const PlacesScreen(),
        '/alert': (context) => const AlertScreen(),
      },
    );
  }
}

