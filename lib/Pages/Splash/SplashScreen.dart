import 'package:flutter/material.dart';
import 'package:menu/Pages/Menu/menu.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../Login/LoginScreen.dart';
//import 'package:flutter/cupertino.dart';
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new LoginScreen(),
      //title: new Text('Welcome To ALL IN 1',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white, ),),
      //image: new Image.asset("assets/splash.jpg"),
      imageBackground: AssetImage("assets/splash.jpg"),
      //backgroundColor: Colors.black,
      //styleTextUnderTheLoader: new TextStyle(),
      //photoSize: 200.0,
      loaderColor: Colors.white70,
    );
  }
}


class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
  }
  void login()async{
    //SharedPreferences.setMockInitialValues({});
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin= sp.getBool("islogin")??false;
    if(islogin){
      Timer(Duration(seconds: 2), (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>menus()));
      });
    }else{
      Timer(Duration(seconds: 2), (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image(
            //height: double.infinity,fit: BoxFit.fitHeight,
            image: AssetImage("assets/splash.jpg"),),
        ),
      ),
    );
  }
}



