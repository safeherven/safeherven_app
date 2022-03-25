import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:safeherven_app/screens/help.dart';
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
    IconData icon = Icons.check;
    final List<String> menuTitles = [
      'Home',
      'Places',
      'Chat',
      'About',
      'Alert Others',
      'Get Help',
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.purple
      ),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/logos/white.png", width: 100, height: 100,),
          Text('Safe Herven', style: TextStyle(color: Colors.white, fontSize: 25),)
        ],
      ),
    ));
    for (var element in menuTitles) {
      switch (element) {
        case 'Home':
          icon = Icons.home;
          break;
        case 'Places':
          icon = Icons.location_on;
          break;
        case 'Chat':
          icon = Icons.chat;
          break;
        case 'About':
          icon = Icons.person;
          break;
        case 'Alert Others':
          icon = Icons.edit_notifications_rounded;
          break;
        case 'Get Help':
          icon = Icons.health_and_safety;
          break;
      }
      Widget screen = Container();
      menuItems.add(ListTile(
        leading: Icon(icon, color: Colors.purple,),
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
            case 'Get Help':
              screen = const HelpScreen();
              break;

          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen)
          );
        },
      ));
    }
    menuItems.add(Divider(thickness: 2,));
    menuItems.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: const SignOutButton(),
    ));
    return menuItems;
  }

}