import 'package:flutter/material.dart';

class drawers extends StatefulWidget {
  @override
  _drawersState createState() => _drawersState();
}

class _drawersState extends State<drawers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ecom App UI",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(child: Text("abc")),
          GestureDetector(
            onTap: () {},
            child: ListTile(title: Text("def")),
          ),
          ListTile(title: Text("hello"))
        ],
      )),
    );
  }
}
