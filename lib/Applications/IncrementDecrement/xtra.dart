import 'package:flutter/material.dart';

class incrementDecrement extends StatefulWidget {
  @override
  _incrementDecrementState createState() => _incrementDecrementState();
}

class _incrementDecrementState extends State<incrementDecrement> {
  var text = 1;

  one() {
    setState(() {
      text++;
    });
  }

  two() {
    setState(() {
      text--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("text : $text"),
          SizedBox(height: 20),
          ElevatedButton(onPressed: one, child: Text("press text increment")),
          SizedBox(height: 20),
          ElevatedButton(onPressed: two, child: Text("press text decrement"))
        ]),
      ),
    );
  }
}
