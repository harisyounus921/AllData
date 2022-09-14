import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu/Login/LoginScreen.dart';
import 'package:menu/MiCard.dart';
import 'package:menu/Provider/ThemeProvider.dart';
import 'package:menu/Setting/Setting.dart';
import 'package:menu/Splash/SplashScreen.dart';
import 'package:menu/menu.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ThemeChangerProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themechange=Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themechange.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.indigo,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            primaryColor: Colors.yellow,
            iconTheme: IconThemeData(
              color: Colors.pink,
            ),
          ),
          home: Scaffold(
            body: Splashscreen(),
          ),
        );
      },)
    );
  }
}
