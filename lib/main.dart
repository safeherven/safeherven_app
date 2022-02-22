import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/map.dart';
import 'package:safeherven_app/screens/about.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/screens/home.dart';
import 'package:safeherven_app/screens/alert.dart';

void main() {
  runApp(const SafeHervenApp());
}

class SafeHervenApp extends StatelessWidget {
  const SafeHervenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/chat': (context) => const ChatScreen(),
        '/map': (context) => const SafeSpotsScreen(),
        '/alert': (context) => const AlertScreen(),
      },
    );
  }
}

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const appTitle = 'Safe Herven';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(title)
//       ),
//       body: const Center(
//         child: Text('Safe Herven!'),
//       ),

//       // drawer: Drawer(
//       //   child: ListView(
//       //     // Important: Remove any padding from the ListView.
//       //     padding: EdgeInsets.zero,
//       //     children: [
//       //       const DrawerHeader(
//       //         decoration: BoxDecoration(
//       //           color: Colors.blue,
//       //         ),
//       //         child: Text('Safe Herven'),
//       //       ),
//       //       ListTile(
//       //         title: const Text('Map'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //       ListTile(
//       //         title: const Text('Chat'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //       ListTile(
//       //         title: const Text('About'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.location_on),
//       //       label: 'Safe Spots',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.person),
//       //       label: 'About',
//       //     ),
//       //   ],
//       //   selectedItemColor: Colors.amber[800],
//       // ),



//   }
// }
