import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:safeherven_app/screens/places.dart';
import 'package:safeherven_app/screens/about.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/screens/home.dart';
import 'package:safeherven_app/screens/alert.dart';


class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Places',
      'Chat',
      'About',
      'Alert Others',
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.purple
      ),
      child: Text('Safe Herven',
      style: TextStyle(color: Colors.white, fontSize: 28),)
    ));
    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element,
        style: const TextStyle(fontSize: 18),),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SignInScreen(providerConfigs: [
                        EmailProviderConfiguration(),
                      ],);
                    }
                    return HomeScreen(user: snapshot.data!);
                  }
              );
              break;
            case 'Places':
              screen = const PlacesScreen();
              break;
            case 'Chat':
              screen = const ChatScreen();
              break;
            case 'About':
              screen = const AboutScreen();
              break;
            case 'Alert Others':
              screen = const AlertScreen();
              break;

          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen)
          );
        },
      ));
    }
    menuItems.add(const SignOutButton());
    return menuItems;
  }

}