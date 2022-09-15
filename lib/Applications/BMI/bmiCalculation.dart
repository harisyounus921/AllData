import 'package:menu/Applications/BMI/bmiInput.dart';
import 'package:flutter/material.dart';

class resultpage extends StatelessWidget {
  resultpage(
      {@required this.bmiresult,
      @required this.interpretation,
      @required this.resulttext});
  final String bmiresult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Center(
                child: Text(
                  "YOUR RESULT",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reuseableCard(
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext.toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiresult,
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomButton(
              buttontitle: "RE-CALCULATE",
              ontab: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
