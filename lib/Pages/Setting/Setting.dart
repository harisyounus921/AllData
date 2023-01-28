import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:menu/Pages/Login/GoogleSignInApi.dart';
import 'package:menu/Pages/Splash/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SettingScreen extends StatefulWidget {
  final GoogleSignInAccount user;
  SettingScreen({this.user});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double PicRadius=80;
  String image;
  String name;
  String email;
  bool data=true;
@override
  void initState(){
    // TODO: implement initState
    super.initState();
    sp();
  callme();
  }
  callme() async {
    await Future.delayed(Duration(seconds: 2)).then((value) => {
      setState(() {
        data = false;
      })
    });
  }
  sp()async{
    SharedPreferences sp=await SharedPreferences.getInstance() ;
    image=sp.getString("image");
    name=sp.getString("name");
    email=sp.getString("email");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage:  AssetImage('assets/splash.jpg',),
              radius: 23,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Personal Information'))
          ],
        ),
        actions: [
    IconButton(icon: Icon(Icons.logout),
    color: Colors.white,
      iconSize: 30,
      onPressed: ()async{
        //SharedPreferences.setMockInitialValues({});
        SharedPreferences sp=await SharedPreferences.getInstance();
        sp.setBool('islogin',false);
        await GoogleSignInApi.logout();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Splashscreen()));
      },),
        ],
        automaticallyImplyLeading: false,
      ),
      body:data? Center(
        child: new CircularPercentIndicator(
          radius: 100.0,
          lineWidth: 5.0,
          percent: 1.0,
          center: new Text("100%",style: TextStyle(color: Colors.white, fontSize: 30,)),
          progressColor: Colors.white,
        ),
      ):
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                PicRadius=150;
              });
            },
            child:CircleAvatar(radius: PicRadius,
              backgroundImage:
              NetworkImage(image.toString()),
              //NetworkImage(widget.user.photoUrl),
              ),
          ),
          SizedBox(height: 10,
          ),
          Center(
            child:
           // Text("Name :"+widget.user.displayName,style: TextStyle(color: Colors.white, fontSize: 30,),),
            Text("Name :"+name.toString(),style: TextStyle(color: Colors.white, fontSize: 30,),),
          ),
          SizedBox(height: 10,
          ),
          Center(
            child:
            //Text("Email :"+widget.user.email,style: TextStyle(color: Colors.white, fontSize: 15,),),
            Text("Email :"+email.toString(),style: TextStyle(color: Colors.white, fontSize: 15,),),
          ),
        ],
      ),
          );
        }
}


