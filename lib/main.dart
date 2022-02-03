import 'package:flutter/material.dart';
import 'package:menu/todo.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: todo(),
      ),
    );
  }
}
