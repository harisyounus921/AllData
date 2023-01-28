import 'package:menu/Applications/BMI/bmiInput.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
      return "Consume less “bad” fat and more “good” fat.Consume less processed and sugary foods.Eat more servings of vegetables and fruits.Focus on eating low glycemic index foods.";
    } else if (_bmi > 18.5) {
      return "Don't drink water before meals. This can fill your stomach and make it harder to get in enough calories.Drink milk.Try weight gainer shakes.Use bigger plates.Add cream to your coffee.Get quality sleep";
    } else {
      return "Eat more frequently. When you're underweight, you may feel full faster.Choose nutrient-rich foods.Try smoothies and shakes.Have an occasional treat.";
    }
  }
}
