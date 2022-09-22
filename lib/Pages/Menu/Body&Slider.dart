import 'package:flutter/cupertino.dart';
import 'package:menu/Applications/Micard/MiCard.dart';
import 'package:menu/Applications/Quizer/Quizzler.dart';
import 'package:menu/Applications/BMI/bmi.dart';
import 'package:menu/Applications/Calculator/calculator.dart';
import 'package:menu/Applications/Drawer/drawers.dart';
import 'package:menu/Applications/SingleScroolView/singlescroll.dart';
import 'package:menu/Applications/TodoList/todo.dart';
import 'package:menu/Applications/Whatsapp/whatsapppic.dart';
import 'package:menu/Applications/DataEntry/formapp.dart';
import 'package:menu/Applications/EcomeresApp/listviewbuilder.dart';
import 'package:menu/Applications/StackBox/stackuse.dart';
import 'package:menu/Applications/IncrementDecrement/xtra.dart';
import 'package:menu/Applications/BottomNavBar/bottom.dart';
import 'package:flutter/material.dart';
import 'package:menu/Applications/API_Sample/api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BodyPart extends StatelessWidget {

  var word = [
    "BMI CALCULATOR",
    "MiCard",
    "Ecom App UI",
    "Todo App",
    "Calculator",
    "Scroll View",
    "Quizzler",
    "WhatsApp",
    "API Use",
    "Data Entry App",
    "Increment Decrement",
    "Bottom Nav Bar",
    "Drawer View",
    "Stack Use(BOX)",
  ];
  var pic = [
    "assets/bmi.png",
    "assets/MiCard.png",
    "assets/ecomapp.png",
    "assets/todo.png",
    "assets/calculator.png",
    "assets/scroll.png",
    "assets/quizzer.png",
    "assets/whatsapp.png",
    "assets/api.png",
    "assets/form.png",
    "assets/increment.png",
    "assets/navbar.png",
    "assets/drawer.png",
    "assets/box.png",
  ];
  List list = [
    BMICalculator(),
    MiCard(),
    haris(),
    todo(),
    calculator(),
    scroll(),
    Quizzler(),
    flud(),
    api(),
    Formapp(),
    xtra(),
    BottomNavigation(),
    drawers(),
    Stackuse(),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height/1.6,
          width: MediaQuery.of(context).size.width,
          child:Container(
            child: SlidableAutoCloseBehavior(
              closeWhenOpened: true,
              child: ListView.builder(
                  itemCount: pic.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: Key(word[index]),
                      startActionPane: ActionPane(
                        motion: StretchMotion(),
                        //dismissible: DismissiblePane(onDismissed: (){},),
                        children: [
                          SlidableAction(
                              backgroundColor: Colors.deepPurple,
                              icon: Icons.share,
                              label: 'Share',
                              onPressed: (context){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Sorry this functionality is under development'),
                                      backgroundColor:Colors.deepPurple ,));}),
                          SlidableAction(
                              backgroundColor: Colors.blue,
                              icon: Icons.archive,
                              label: 'Archive',
                              onPressed: (context){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Sorry this functionality is under development'),
                                      backgroundColor:Colors.deepPurple ,));
                              }
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.green,
                            icon: Icons.star_half_sharp,
                            label: 'Open',
                            onPressed: (context){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => list[index]));},),
                        ],
                      ),
                      child:ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(pic[index]),
                          radius: 30,
                        ),
                        title: Text(word[index]),
                        subtitle: Text(word[index]),
                        trailing: Icon(Icons.star),
                      ),
                    );
                  }),
            ),
          ),
        ),
      );
  }
}


class CustomSlider extends StatelessWidget {
  var pic = [
    "assets/bmi1.png",
    "assets/ecomapp1.png",
    "assets/todo1.png",
    "assets/calculator.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
      child: SizedBox(
        height: MediaQuery.of(context).size.height/5,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
            itemCount: pic.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(pic[index]),
                    )
                ),
              );
            }),
      ),
    );
  }
}
