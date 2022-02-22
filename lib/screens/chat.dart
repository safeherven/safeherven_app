import 'package:flutter/material.dart';
import 'package:safeherven_app/shared/chat.dart';
import 'package:safeherven_app/shared/bottom.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Let's Talk"),),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(
        child: Chat(),
      ),
    );
  }
}


// class ChatScreen extends StatelessWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Let's Talk"),),
//       bottomNavigationBar: const MenuBottom(),
//       body: const Center(
//       ),
//     );
//   }
// }