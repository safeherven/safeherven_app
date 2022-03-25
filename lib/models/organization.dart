class Organization {
  String? name;
  String? description;
  String? country;
  String? location;
  String? telephone;
  String? email;
  String? website;
  List? votes;

  Organization();

  Map<String, dynamic> toJson() =>
      {'name': name,
        'description': description,
        'country': country,
        'location': location,
        'telephone': telephone,
        'email': email,
        'website': website,
        'votes': votes
      };

  Organization.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        description = snapshot.data()['description'],
        country = snapshot.data()['country'],
        location = snapshot.data()['location'],
        telephone = snapshot.data()['telephone'],
        email = snapshot.data()['email'],
        website = snapshot.data()['website'],
        votes = snapshot.data()['votes'];
}