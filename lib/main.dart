import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/places.dart';
import 'package:safeherven_app/screens/about.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/screens/wrapper.dart';
import 'package:safeherven_app/screens/alert.dart';
import 'package:safeherven_app/screens/settings/settings.dart';
import 'package:google_fonts/google_fonts.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const Wrapper(),
        '/about': (context) => const AboutScreen(),
        '/chat': (context) => const ChatScreen(),
        '/map': (context) => const PlacesScreen(),
        '/alert': (context) => const AlertScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

