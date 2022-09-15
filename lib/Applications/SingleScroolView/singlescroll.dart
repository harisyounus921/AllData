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
      appBar: AppBar(title: const Text('Single child Scroll view'),),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Center(child: Text("Simple Container",style: TextStyle(color:Colors.white
            ),)),
            height: 200,
            width: 200,
            color: Colors.cyan,
          ),
          SizedBox(height: 10),
          Container(
            child: Center(child: Text("Simple Container",style: TextStyle(color: Colors.white)),),
            height: 200,
            width: 200,
            color: Colors.lightBlueAccent,
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
                color: Colors.deepPurpleAccent,
                child: Center(child: Text("GridView NeverScrollable Scrollphysics ShrinkWrap  ${first[index]}",style:TextStyle(color: Colors.white),)),
              );
            }),
          )
        ]),
      ),
    );
  }
}
