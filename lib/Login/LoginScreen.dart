import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:menu/Login/GoogleSignInApi.dart';
import 'package:menu/menu.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:GestureDetector(
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
            print('login Pass');
            // BuildContext context;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>menus(user: currentuser,)));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => menus()));
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
    );
  }
}
