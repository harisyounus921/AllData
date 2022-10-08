import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menu/Pages/Login/GoogleSignInApi.dart';
import 'package:menu/Pages/Menu/menu.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/DBHelper.dart';

class LoginScreen extends StatefulWidget {
  static var id;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(
                  angle: pi/2,
                  child: ClipPath(
                    clipper: LeftClipClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.width/3 ,
                      width:MediaQuery.of(context).size.width/3 ,
                      color: Colors.black38,),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/3,),
                Transform.rotate(
                  angle: pi,
                  child: ClipPath(
                    clipper: LeftClipClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.width/3 ,
                      width:MediaQuery.of(context).size.width/3 ,
                      color: Colors.black38,),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height/1.5377,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: Hero(
                          tag: "loginToMenu",
                          child:Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(100),
                                child: Image.asset('assets/splash.jpg',fit: BoxFit.cover),
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextFormField(
                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)
                            ? null
                            : "Please Enter Correct Email";
                      },
                      //controller: TextEditingController(),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        // email=value.trim();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your Email.',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      // keyboardType: TextInputType.number,
                      validator: (val)
                      {
                        if (val.isEmpty)
                        {
                          return 'Please enter some text';
                        }
                        if (val.length < 3)
                        {
                          return 'Must be more than 2 charater';
                        }
                        return "thanks";
                      },
                      onChanged: (value) {
                        //paswords=value.trim();
                      },
                      decoration: InputDecoration(
                        // focusColor: Color(0xFFFBB03B),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your password.',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFE6E7E9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("Login")),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 20,
                      endIndent: 0,
                      color: Color(0xFFE6E7E9),
                    ),
                    SizedBox(height: 25,),
                    Center(child:GestureDetector(
                      onTap: ()async{
                        final currentuser=await GoogleSignInApi.login();
                        if(currentuser==null){
                          print('login failed');
                          //BuildContext context;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignIn Fail")));
                        }else{
                          //SharedPreferences.setMockInitialValues({});
                          SharedPreferences sp=await SharedPreferences.getInstance();
                          sp.setBool('islogin',true);
                          sp.setString('image', currentuser.photoUrl);
                          sp.setString('name', currentuser.displayName);
                          sp.setString('email', currentuser.email);
                          /*dbHelper.insert(googleInfo(email: currentuser.email.toString(), name: currentuser.displayName.toString(),
                  image: currentuser.photoUrl.toString()));*/
                          print('login Pass');
                          // BuildContext context;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>menus()));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff1aa260),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("SignIn with Google")),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ClipPath(
                    clipper: LeftClipClipper(),
                    child: Container(height:MediaQuery.of(context).size.width/3,
                      width:MediaQuery.of(context).size.width/3 ,
                      color: Colors.black38,),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/3,),
                Transform.rotate(
                  angle: pi+(pi/2),
                  child: ClipPath(
                    clipper: LeftClipClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.width/3 ,
                      width:MediaQuery.of(context).size.width/3 ,
                      color: Colors.black38,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class LeftClipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    //path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>lodClipper)=>true;
}
