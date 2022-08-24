import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  @override
  _todoState createState() => _todoState();
}

class _todoState extends State<todo> {
  var output = "";
  List first = ["First data", "2nd data", "Third data", "Next data"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toto App'),
      ),
      body: ListView.builder(
          itemCount: first.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Colors.lightBlueAccent,
                margin: EdgeInsets.only(top: 12),
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.white,
                    radius: 10,),
                 // tileColor: Colors.blueGrey,
                  title: Text("${first[index]}",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                  trailing: Container(
                    width: 90,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Edit item"),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                first.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                            },
                                            child: Text("Add"))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit,color: Colors.yellowAccent,)),
                        SizedBox(width: 30,),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                first.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete,color: Colors.black,)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            first.add(output);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Text("ADD"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
