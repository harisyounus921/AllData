import 'package:menu/Applications/BottomNavBar/call.dart';
import 'package:menu/Applications/BottomNavBar/status.dart';
import 'package:menu/Applications/Whatsapp/whatsapp.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTab = 0;
  Widget currentScreen = call();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        // notchMargin: 50,
        color: Colors.red[900],
        child: Container(
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {setState(() {currentScreen = call();currentTab = 0;});},
                        child: Icon(Icons.home, color: currentTab == 0 ? Colors.white : Colors.black)),
                    MaterialButton(
                //  minWidth: 60,
                onPressed: () {
                  setState(() {
                    currentScreen = status();
                    currentTab = 1;
                  });
                },
                child: Icon(Icons.favorite,
                    color: currentTab == 1 ? Colors.white : Colors.black)),
            MaterialButton(
                // minWidth: 60,
                onPressed: () {
                  setState(() {
                    currentScreen = Whatsapp();
                    currentTab = 2;
                  });
                },
                child: Icon(Icons.search,
                    color: currentTab == 2 ? Colors.white : Colors.black)),
            MaterialButton(
                //  minWidth: 60,
                onPressed: () {
                  setState(() {
                    currentScreen = call();
                    currentTab = 3;
                  });
                },
                child: Icon(Icons.person,
                    color: currentTab == 3 ? Colors.white : Colors.black)),
          ]),
        ),
        //   ElevatedButton(onPressed: (){  Navigator.pop(context);  }, child: Icon(Icons.home)),
      ),
    );
  }
}
