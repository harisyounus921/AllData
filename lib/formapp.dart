import 'package:flutter/material.dart';
import 'package:menu/home.dart';
import 'package:menu/listviewbuilder.dart';

class Formapp extends StatefulWidget {
  @override
  _FormappState createState() => _FormappState();
}

class _FormappState extends State<Formapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Text("Hello I Am HARIS YOUNUS"),
            SizedBox(
              height: 50,
            ),
            Text("Enter Your Name"),
            Container(
              width: 200,
              child: TextField(),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => haris()));
                },
                child: Text("Enter")),
            SizedBox(
              height: 100,
            ),
            Text("This is Lahore"),
            SizedBox(
              height: 30,
            ),
            Text("Enter your City"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: TextField(),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text("Enter")),
            SizedBox(
              height: 50,
            ),
            Text("Haris younus4"),
            SizedBox(
              height: 100,
            ),
            Text("Haris younus5"),
            SizedBox(
              height: 100,
            ),
          ]),
        ),
      ),
    );
  }
}
