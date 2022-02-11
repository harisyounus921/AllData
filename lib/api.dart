import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api extends StatefulWidget {
  @override
  _apiState createState() => _apiState();
}

class _apiState extends State<api> {
  dynamic getuser() async {
    var users = [];
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
    var jsonData = jsonDecode(response.body);

    for (var i in jsonData) {
      userData user = userData(i["name"], i["username"], i["company"]["name"]);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        body: FutureBuilder(
          future: getuser(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Container(
                  child: Text("nothing in api"),
                ),
              );
            } else
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(snapshot.data[i].name),
                    subtitle: Text(snapshot.data[i].company),
                  );
                },
              );
          },
        ),
      ),
    );
  }
}

class userData {
  var name;
  var company;
  var username;
  userData(this.name, this.username, this.company);
}
