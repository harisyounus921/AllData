import 'package:menu/bmiInput.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class calculatorBrain {
  calculatorBrain({@required this.height, @required this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "over WEIGHT";
    } else if (_bmi > 18.5) {
      return "good";
    } else {
      return "under weight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Consume less “bad” fat and more “good” fat.Consume less processed and sugary foods.Eat more servings of vegetables and fruits. ...Eat plenty of dietary fiber.Focus on eating low–glycemic index foods.";
    } else if (_bmi > 18.5) {
      return "Don't drink water before meals. This can fill your stomach and make it harder to get in enough calories.Eat more often. ...Drink milk. ...Try weight gainer shakes. ...Use bigger plates. ...Add cream to your coffee. ...Take creatine. ...Get quality sleep";
    } else {
      return "Eat more frequently. When you're underweight, you may feel full faster. ...Choose nutrient-rich foods. ...Try smoothies and shakes. ...Watch when you drink. ...Make every bite count. ...Top it off. ...Have an occasional treat.";
    }
  }
}
