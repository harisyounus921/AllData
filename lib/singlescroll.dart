import 'package:flutter/material.dart';

class scroll extends StatefulWidget {
  @override
  _scrollState createState() => _scrollState();
}

class _scrollState extends State<scroll> {
  List first = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          SizedBox(height: 10),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: List.generate(first.length, (index) {
              return Container(
                color: Colors.yellow,
                child: Center(child: Text("${first[index]}")),
              );
            }),
          )
        ]),
      ),
    );
  }
}
