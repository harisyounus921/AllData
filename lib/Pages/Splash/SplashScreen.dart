import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu/Pages/Menu/menu.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../Login/LoginScreen.dart';

class Splashscreen extends StatefulWidget {
  static var id;

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
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image(
            //height: double.infinity,fit: BoxFit.fitHeight,
            image: AssetImage("assets/splash.png"),
          fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}



