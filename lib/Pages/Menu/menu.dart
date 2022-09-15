import 'package:google_sign_in/google_sign_in.dart';
import 'package:menu/Applications/Micard/MiCard.dart';
import 'package:menu/Pages/Login/GoogleSignInApi.dart';
import 'package:menu/Pages/Setting/Setting.dart';
import 'package:menu/Pages/Splash/SplashScreen.dart';
import 'package:menu/Provider/ThemeProvider.dart';
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
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class menus extends StatefulWidget {
  final GoogleSignInAccount user;
  menus({this.user});
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
    final themechange=Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage:  AssetImage('assets/splash.jpg',),
              radius: 23,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('All in One'))
          ],
        ),
        automaticallyImplyLeading: false,
       // centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.account_circle),
              color: Colors.white,iconSize: 30, onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen(user:widget.user)));}),
          PopupMenuButton(itemBuilder: (context)=>[
            PopupMenuItem(
              child: Text("Light Theme"),
              onTap: (){
                themechange.setTheme(ThemeMode.light);
              },
            ),
            PopupMenuItem(child: Text("Dark Theme"),
              onTap: (){
                themechange.setTheme(ThemeMode.dark);
              },
            ),
            PopupMenuItem(child: Text("System Theme"),
              onTap: (){
                themechange.setTheme(ThemeMode.system);
              },
            ),
            PopupMenuItem(child: Text("signout"),
              onTap: ()async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setBool('islogin',false);
                await GoogleSignInApi.logout();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Splashscreen()));;
              },
            ),
          ],
    ),
        ],
      ),
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