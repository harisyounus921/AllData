import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu/Pages/Splash/SplashScreen.dart';
import 'package:menu/Provider/ScrollOfSetProvider.dart';
import 'package:provider/provider.dart';
import 'Provider/ThemeProvider.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarColor:  Colors.transparent,
    ),
  );
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
            useMaterial3: true,
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
