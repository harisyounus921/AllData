import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Provider/ThemeProvider.dart';
import '../Login/GoogleSignInApi.dart';
import '../Splash/SplashScreen.dart';
class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  String image;
  String name;
  String email;
  bool data=true;

  void initState(){
    // TODO: implement initState
    super.initState();
    sp();
    callme();
  }
  callme() async {
    await Future.delayed(Duration(microseconds: 200)).then((value) => {
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
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: data?Text("Name : Loading......"):Text("Name :"+name.toString(),style: TextStyle(color: Colors.white, fontSize: 20,),),
            accountEmail: data?Text("Name : Loading@gmail.com"):Text(email.toString(),style: TextStyle(color: Colors.white, fontSize: 12,),
            ),
            currentAccountPicture://ImageBuilderWidget(image:image.toString()),
            CircleAvatar(
              radius: 100.0,
              backgroundImage: data?AssetImage("assets/man.png"):NetworkImage(image.toString()),
              // backgroundImage: AssetImage('assets/vision.jpg'),
            ),
          ),
          Spacer(),
          Consumer<ThemeChangerProvider>(
            builder: (context,ThemeChangerProvider,child) {
              return ListTile(
                  onTap: () {
                    ThemeChangerProvider.setTheme(ThemeMode.light);
                  },
                  title:Text("Light Theme"),
                  leading: Icon(Icons.light_mode)
              );
            },
          ),
          Consumer<ThemeChangerProvider>(
            builder: (context,ThemeChangerProvider,child) {
              return ListTile(
                onTap: () {
                  ThemeChangerProvider.setTheme(ThemeMode.dark);
                },
                leading: Icon(Icons.dark_mode),
                title:Text("Dark Theme"),
              );
            },
          ),
          Spacer(),
          ListTile(
            onTap: ()async{
              //SharedPreferences.setMockInitialValues({});
              SharedPreferences sp=await SharedPreferences.getInstance();
              sp.setBool('islogin',false);
              await GoogleSignInApi.logout();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Splashscreen()));
            },
            leading:IconButton(
              icon: Icon(Icons.logout),
              color: Colors.white,
              iconSize: 30,
            ),
            title: Text("Signout"),
          ),
        ],
      ),
    );
  }
}

class ImageBuilderWidget extends StatelessWidget {

  final String image ;
  final double height, width ;
  const ImageBuilderWidget({this.image ,  this.height = 200 , this.width = 200 });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all()
        ),
        child: ClipRRect(
          child: Image(
            fit: BoxFit.cover,
            height: height,
            width: width,
            repeat: ImageRepeat.repeatY,
            image:  NetworkImage(image),
            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
              return Container(
                  height: height,
                  width: width,
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ));
            },
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child ;
              return SizedBox(
                height: height,
                width: width,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
