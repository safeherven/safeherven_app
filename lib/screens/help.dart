import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safeherven_app/models/organization.dart';
import 'package:safeherven_app/shared/org_card.dart';

import '../shared/appbar.dart';
import '../shared/bottom.dart';
import 'chat.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Object?> _orgList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getOrgList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: SafeHervenAppBar('Get Help', isHome: false,),
      bottomNavigationBar: const MenuBottom(),
      body: Column(
        children: <Widget>[
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 8.0),
                child: Text(
                  "Non Govenmental Organizations",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                child: Text(
                  "Here are a curated list of Organizations you can reach out to if you need help.",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _orgList.length,
              itemBuilder: (context, index) {
              return OrgCard(ngo: _orgList[index] as Organization,);
            })
          ),
        ],
      )
      );

  }

  Future getOrgList() async {
    var data = await FirebaseFirestore.instance.collection('ngos').get();

    setState(() {
      _orgList = List.from(data.docs.map((doc) => Organization.fromSnapshot(doc)));
    });
  }
}
