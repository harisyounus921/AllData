import 'package:menu/MiCard.dart';
import 'package:menu/Quizzler.dart';
import 'package:menu/bmi.dart';
import 'package:menu/calculator.dart';
import 'package:menu/drawers.dart';
import 'package:menu/singlescroll.dart';
import 'package:menu/todo.dart';
import 'package:menu/whatsapppic.dart';
import 'package:menu/formapp.dart';
import 'package:menu/listviewbuilder.dart';
import 'package:menu/stackuse.dart';
import 'package:menu/xtra.dart';
import 'package:menu/bottom.dart';
import 'package:flutter/material.dart';
import 'package:menu/api.dart';

class menus extends StatefulWidget {
  @override
  _menusState createState() => _menusState();
}

class _menusState extends State<menus> {
  var word = [
    "BMI CALCULATOR",
    "MiCard",
    "Ecom App UI",
    "Todo App",
    "Calculator",
    "Quizzler",
    "WhatsApp",
    "API Use",
    "Data Entry App",
    "Increment Decrement",
    "Bottom Nav Bar",
    "Drawer View",
    "Scroll View",
    "Stack Use(BOX)",
  ];
  var pic = [
    "assets/bmi.png",
    "assets/MiCard.png",
    "assets/ecomapp.png",
    "assets/todo.png",
    "assets/calculator.png",
    "assets/quizzer.png",
    "assets/whatsapp.png",
    "assets/api.png",
    "assets/form.png",
    "assets/increment.png",
    "assets/navbar.png",
    "assets/drawer.png",
    "assets/scroll.png",
    "assets/box.png",
  ];
  List list = [
    BMICalculator(),
    MiCard(),
    haris(),
    todo(),
    calculator(),
    Quizzler(),
    flud(),
    api(),
    Formapp(),
    xtra(),
    BottomNavigation(),
    drawers(),
    scroll(),
    Stackuse(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: word.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(pic[index]),
                  radius: 30,
                ),
                title: Text(word[index]),
                subtitle: Text(word[index]),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => list[index]));},
                        child: Text("OPEN IT"))
                  ],
                ),
              );
            }));
  }
}
