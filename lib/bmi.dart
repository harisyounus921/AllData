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
      return "over WEIGHT ,.........................";
    } else if (_bmi > 18.5) {
      return "good................................";
    } else {
      return "under weight...........................";
    }
  }
}
