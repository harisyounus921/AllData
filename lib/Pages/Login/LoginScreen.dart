import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:menu/Pages/Login/GoogleSignInApi.dart';
import 'package:menu/Pages/Menu/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static var id;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
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
                        color: Colors.white70,),
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
                        color: Colors.white70,),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(80),
                            child: Image.asset('assets/splash.png',fit: BoxFit.fill),
                          ),
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
                      ElevatedButton.icon(
                        icon: FaIcon(FontAwesomeIcons.message,color: Colors.red,),
                        label: Text('  Login with email'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity,50),
                        ),
                        onPressed: (){},
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
                      ElevatedButton.icon(
                        icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
                        label: Text('  Singn Up with Google'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity,50),
                        ),
                        onPressed: ()async{
                          final currentuser=await GoogleSignInApi.login();
                          if(currentuser==null){
                            print('login failed');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignIn Fail")));
                          }else{
                            SharedPreferences sp=await SharedPreferences.getInstance();
                            sp.setBool('islogin',true);
                            sp.setString('image', currentuser.photoUrl);
                            sp.setString('name', currentuser.displayName);
                            sp.setString('email', currentuser.email);
                            print('login Pass');
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>menus()));
                          }
                        },
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
                        color: Colors.white70,),
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
                        color: Colors.white70,),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>lodClipper)=>true;
}
