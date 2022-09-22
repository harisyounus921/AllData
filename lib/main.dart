import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu/Applications/Micard/MiCard.dart';
import 'package:menu/Helper/scrollOfSetProvider.dart';
import 'package:menu/Pages/Splash/SplashScreen.dart';
import 'package:menu/Provider/ScrollOfSetProvider.dart';
import 'package:menu/Provider/ThemeProvider.dart';
import 'package:menu/Pages/Menu/menu.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_)=>ScrollOfSetProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themechange=Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themechange.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.indigo,
              primaryColor: Colors.indigo
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            primaryColor: Colors.grey,
            iconTheme: IconThemeData(
              color: Colors.blue,
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
