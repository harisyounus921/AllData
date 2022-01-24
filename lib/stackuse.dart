import 'package:flutter/material.dart';

class Stackuse extends StatefulWidget {
  @override
  _StackuseState createState() => _StackuseState();
}

class _StackuseState extends State<Stackuse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Container(color : Colors.red, height: 100, width :100),

          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 100,
              color: Colors.blue,
              height: 100,
            ),
          ),

          Positioned(
            top: 20,
            left: 20,
            child: Container(
              color: Colors.yellow,
              height: 100,
              width: 100,
            ),
          ),

          Positioned(
            top: 30,
            left: 30,
            child: Container(
              width: 100,
              color: Colors.green,
              height: 100,
            ),
          ),

          Positioned(
            top: 40,
            left: 40,
            child: Container(
              color: Colors.purple,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
