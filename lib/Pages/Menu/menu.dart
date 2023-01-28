import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:menu/Pages/Menu/Body&Slider.dart';
import 'package:menu/Pages/Menu/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:menu/Applications/Micard/MiCard.dart';
import 'package:menu/Applications/Quizer/Quizzler.dart';
import 'package:menu/Applications/BMI/bmi.dart';
import 'package:menu/Applications/Calculator/calculator.dart';
import 'package:menu/Applications/Drawer/drawers.dart';
import 'package:menu/Applications/SingleScroolView/singlescroll.dart';
import 'package:menu/Applications/TicketApp/TicketApp.dart';
import 'package:menu/Applications/TodoList/todo.dart';
import 'package:menu/Applications/Whatsapp/whatsapppic.dart';
import 'package:menu/Applications/DataEntry/formapp.dart';
import 'package:menu/Applications/EcomeresApp/listviewbuilder.dart';
import 'package:menu/Applications/StackBox/stackuse.dart';
import 'package:menu/Applications/IncrementDecrement/xtra.dart';
import 'package:menu/Applications/BottomNavBar/bottom.dart';
import 'package:flutter/material.dart';
import 'package:menu/Applications/API_Sample/api.dart';

import '../../Applications/TicketApp/TicketInputData.dart';
import '../../Provider/ScrollOfSetProvider.dart';

class menus extends StatefulWidget {
  @override
  _menusState createState() => _menusState();
}

class _menusState extends State<menus> {


  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController=ScrollController();
    _scrollController?.addListener(() {
      Provider.of<ScrollOfSetProvider>(context,listen: false).setOffset(_scrollController.offset);
    });
  }
  var pics = [
    "assets/ticket1.png",
    "assets/ecomapp1.png",
    "assets/todo1.png",
    "assets/bmis.png",
    "assets/calculator.png",
  ];
  var word = [
    "Ticket Selector",
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
    "assets/ticket.png",
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
    TicketInputData(),
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
    incrementDecrement(),
    BottomNavigation(),
    drawers(),
    Stackuse(),
  ];


  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollOfSetProvider>(
        builder: (context,ScrollOfSetProvider,child){
          return Scaffold(
            //extendBodyBehindAppBar: true,
            drawer: CustomDrawer(),
            appBar: AppBar(
                centerTitle: true,
                title: Text("All In One"),
                backgroundColor: Colors.deepPurple,//indigo.withOpacity((ScrollOfSetProvider.scrollofset/350).clamp(0,1).toDouble()),
              /*  automaticallyImplyLeading: false,
            actions: [
              IconButton(icon: Icon(Icons.account_circle),
                  color: Colors.blue,
                  iconSize: 30, onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen(user:widget.user)));}),

        PopupMenuButton(itemBuilder: (context)=>[
                PopupMenuItem(child: Text("Light Theme"), onTap: (){themechange.setTheme(ThemeMode.light);},),
                PopupMenuItem(child: Text("Dark Theme"), onTap: (){themechange.setTheme(ThemeMode.dark);},),
              ],),
             ],*/
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.only(left: 8.0,right: 8,top: 8),
                    child: PageView.builder(
                        itemCount: pics.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(pics[index]),
                                )
                            ),
                          );
                        }),
                  ),
                  Container(
                    child: FittedBox(child: Padding(
                        padding: const EdgeInsets.only(left: 3,right: 3),
                        child: RichText(
                          text: TextSpan(style: TextStyle(fontSize: 20,color: Colors.black,backgroundColor: Colors.deepPurple),
                            children: const <TextSpan>[
                              TextSpan(text: 'Swap'),
                              TextSpan(text: ' Left ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: 'to Open the'),
                              TextSpan(text: ' Applications', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      ),
                  ),
                  Container(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                      child: Container(
                        child: SlidableAutoCloseBehavior(
                          closeWhenOpened: true,
                          child: ListView.builder(
                            //physics: NeverScrollableScrollPhysics(),
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
                                                  backgroundColor:Colors.blue ,));
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
                  ),
                ],
              ),
            )
          );
        }
    );
  }
}


class CustomSeeMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 25,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height:  MediaQuery.of(context).size.height / 100,
                width:  MediaQuery.of(context).size.height / 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
