import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var result = "0";

  Widget button(var num) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + num;
          });
        },
        child: Text(num));
  }

  Widget clearr(var num) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = "";
          });
        },
        child: Text(num));
  }

  Widget equall(var num) {
    return ElevatedButton(
        onPressed: () {
           Parser p =Parser();
           Expression exp = p.parse(result);
          ContextModel cm = ContextModel();
          double evel = exp.evaluate(EvaluationType.REAL, cm);
          setState(() { result=evel.toString(); });
        },
        child: Text(num));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(result, style: TextStyle(
                      color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),),
                  clearr("CLEAR"),
                ],
              ),
              SizedBox(height: 28.0,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                button("1"), button("2"), button("3"), button("+"),]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                button("4"), button("5"), button("6"), button("-"),]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                button("7"), button("8"), button("9"), button("*"),]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                button("."), button("0"), equall("="), button("/"),])
            ]));
  }
}
