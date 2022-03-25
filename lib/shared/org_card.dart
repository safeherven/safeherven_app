import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safeherven_app/models/organization.dart';
import 'package:url_launcher/url_launcher.dart';

class OrgCard extends StatelessWidget {
  final Organization ngo;
  const OrgCard({Key? key, required this.ngo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = ngo.name!;
    String country = ngo.country!;
    String location = ngo.location!;
    String description = ngo.description!;
    String website = ngo.website!;
    String telephone = ngo.telephone!;
    String email = ngo.email!;
    List votes = ngo.votes!;
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 2,
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          title: _buildTitle(name, description, country, location, telephone, email, votes),
          trailing: const SizedBox(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      description,
                    )
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.phone, size: 18,),
                  Text(
                    telephone,
                    style: const TextStyle(
                      fontSize: 12
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.email,
                    size: 18,
                  ),
                  Flexible(
                    child: Text(
                      email,
                      style: const TextStyle(
                      fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_up_outlined, color: Colors.purple,)),
                  const Text("Upvote", style: TextStyle(color: Colors.grey),),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_down_outlined, color: Colors.purple)),
                  const Text("Downvote", style: TextStyle(color: Colors.grey)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String name, String description, String country, String location, String telephone, String email, List votes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            // const Spacer(),
            // Text(
            //   country
            // ),
          ],
        ),
        Text(
          location,
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 14,
          ),
        ),
        Text(country),
        Row(
          children: <Widget>[
            Text("${votes[0]} votes"),
            const Spacer(),
            FlatButton.icon(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: _launchURL,
              label: const Text("Visit Site"),
              icon: const Icon(Icons.arrow_circle_right),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 2.0),
          child: Center(
            child: Text(
              "Tap to see more",
              style: TextStyle(fontSize: 10, color: Colors.purpleAccent),
              textAlign: TextAlign.center,),
          ),
        )
      ],
    );
  }

  void _launchURL() async {
    if (!await launch(ngo.website!)) throw 'Could not launch ${ngo.website}';
  }
}
