import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either home or authentication screen
    // return const AuthenticateScreen();
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(providerConfigs: const [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(
              clientId: 'Your-Client-Id'
            )
          ],
          headerBuilder: (context, constraints, _) {
            return const CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/images/logos/mixed-logo.png'),
            );
          },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  action == AuthAction.signIn ?
                  "Sign in to Safe Herven" : "Sign up to Safe Herven"
                ),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
                child: Text(
                  "By signing in, you agree to our Terms & Conditions",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        }
        return HomeScreen(user: snapshot.data!);
      }
    );
  }
}

