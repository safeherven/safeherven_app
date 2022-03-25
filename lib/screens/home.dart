import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/shared/drawer.dart';
import 'package:safeherven_app/shared/bottom.dart';
import 'package:safeherven_app/shared/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SafeHervenAppBar("Home", isHome: true,),
      drawer: MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50)
              ),
              color: Colors.purple,
              boxShadow: [
                BoxShadow(
                    color: Colors.purple.withOpacity(0.7),
                    offset: const Offset(-10.0, 0.0),
                    blurRadius: 20.0,
                    spreadRadius: 4.0
                ),
              ]
            ),
            child: Stack(
              children: [
                Positioned(
                  top:30,
                  left: 0,
                  child: Container(
                    height: 65,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                    ),
                  )
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    "Hi ${user.displayName == null ? "there" : user.displayName.toString()}, Welcome!",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple
                    ),
                  )
                )
              ],
            ),
          ),
          SizedBox(
            height: height*0.02,
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    child: Container(
                      height: 180,
                      width: width*0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.0),
                        boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          offset: const Offset(-10.0, 10.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,
                        )],
                      ),
                    ),
                  )
                ),
                Positioned(
                  top: 0,
                  left: 30,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/home/free-woman.jpeg")
                        )
                      ),
                    ),
                  )
                ),
                Positioned(
                  top: 60,
                  left: 186,
                  child: SizedBox(
                    height: 150,
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "A Safe Haven",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple
                          ),
                        ),
                        Text(
                          "Embrace your freedom",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey
                          ),
                        ),
                        Divider(
                        color: Colors.black,
                        // indent: 25,
                        endIndent: 10,
                        ),
                        Text(
                          "A safe space for survivors/victims of sexual assault and abuse, "
                              "harmful practices and other traumatic experiences",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 7, top: 15),
                      height: 120,
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.purple.withOpacity(0.5),
                                  offset: const Offset(-10.0, 0.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0
                              ),
                            ]
                        ),
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10.0,
                          bottom: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Flexible(
                                    child: Text(
                                      "A friendly chatbot",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.chat_outlined, color: Colors.white,)
                                ]
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Flexible(
                              child: Text(
                                "Need someone to talk to and let it all out? "
                                    "Looking for a way forward? The chatbot is there for you :)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 25),
                      height: 120,
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.purple.withOpacity(0.5),
                                  offset: const Offset(-10.0, 0.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0
                              ),
                            ]
                        ),
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10.0,
                          bottom: 10,
                          right: 10
                        ),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Flexible(
                                    child: Text(
                                      "Common Places",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.location_on_outlined, color: Colors.white,)
                                ]
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Flexible(
                              child: Text(
                                "There is a map with common places you will most likely need to head to in case of an emergency."
                                    "Find the closest place to run to with just one click",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 7, top: 15),
                      height: 120,
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.purple.withOpacity(0.5),
                                  offset: const Offset(-10.0, 0.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0
                              ),
                            ]
                        ),
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10.0,
                          bottom: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Flexible(
                                    child: Text(
                                      "NGOs & First Responders",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.health_and_safety_outlined, color: Colors.white,)
                                ]
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Flexible(
                              child: Text(
                                "We have provided you with information about NGOs that are out to help you "
                                    "as well as frist responders. Your health (mental and physical) and safety is our priority.",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                )
            )

          )
        ],
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: <Widget>[
      //     Container(
      //       padding: const EdgeInsets.all(20),
      //       width: 200,
      //       child: Column(
      //         children: <Widget>[
      //           Text(
      //             'Hi ' + user.displayName.toString(),
      //             style: const TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           const Text(
      //             'Welcome back! \nWe are here for you as always to help.',
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         padding: const EdgeInsets.all(20),
      //         child: Column(
      //           children: const <Widget>[
      //             Text(
      //               'Need Help?',
      //               style: TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Text(
      //               'Explore the menu to find places or  create danger alerts'
      //                   ' to keep others around you safe. The chatbot is there '
      //                   'for you if you just wanna talk and let it all out.',
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // floatingActionButton:
      // FloatingActionButton(child: const Icon(Icons.chat), onPressed: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const ChatScreen()),
      //   );
      // }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}