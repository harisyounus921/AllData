import 'package:menu/call.dart';
import 'package:menu/status.dart';
import 'package:menu/whatsapp.dart';
import 'package:flutter/material.dart';

class flud extends StatefulWidget {
  @override
  _fludState createState() => _fludState();
}

class _fludState extends State<flud> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // title:Center(child: Text("Whatsapp")),
            bottom: TabBar(
                unselectedLabelColor: Colors.green[50],
                labelColor: Colors.purple[50],
                indicatorColor: Colors.green[200],
                tabs: [
                  Tab(
                    child: Text("Chat"),
                  ),
                  Tab(
                    child: Text("Status"),
                  ),
                  Tab(
                    child: Text("Call"),
                  )
                ]),
          ),
          body: TabBarView(children: [Whatsapp(), status(), call()]),
        ));
  }
}
