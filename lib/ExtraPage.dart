import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
      // upperBound: 100.0,
    );

    animation = ColorTween(begin: Color(0xFF3E2A74), end: Color(0xFF5F4ECF))
        .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool showSpinner=false;
  String email;
  String paswords;
  final emailcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body:  ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: "hero",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/logoo.jpg'),
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
                    email=value.trim();
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
                  paswords=value.trim();
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
            ElevatedButton(
              onPressed: (){},
              child: Text("Login"),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
