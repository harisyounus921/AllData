import 'package:menu/bmi.dart';
import 'package:menu/bmiCalculation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activecolor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);

enum Gander {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gander selectedGender;
  int height = 150;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: reuseableCard(
                      ontab: () {
                        setState(() {
                          selectedGender = Gander.male;
                        });
                      },
                      colour: selectedGender == Gander.male
                          ? activecolor
                          : inactivecolor,
                      cardchild: iconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: reuseableCard(
                      ontab: () {
                        setState(() {
                          selectedGender = Gander.female;
                        });
                      },
                      colour: selectedGender == Gander.female
                          ? activecolor
                          : inactivecolor,
                      cardchild: iconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: reuseableCard(
                colour: Color(0xFF1D1E33),
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",
                        style: TextStyle(
                            fontSize: 18.0, color: Color(0xFF8D8E98))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98)),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: reuseableCard(
                    colour: Color(0xFF1D1E33),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98))),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            rounudButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            rounudButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reuseableCard(
                    colour: Color(0xFF1D1E33),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98))),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            rounudButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            rounudButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            bottomButton(
              buttontitle: "CALCULATOR",
              ontab: () {
                calculatorBrain calr =
                    calculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultpage(
                      bmiresult: calr.calculateBmi(),
                      resulttext: calr.getResult(),
                      interpretation: calr.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class bottomButton extends StatelessWidget {
  const bottomButton({@required this.buttontitle, @required this.ontab});

  final String buttontitle;
  final Function ontab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
          child: Center(
            child: Text(
              buttontitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          color: Color(0xFFEB1555),
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 40.0),
    );
  }
}

class iconContent extends StatelessWidget {
  iconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class reuseableCard extends StatelessWidget {
  reuseableCard({@required this.colour, this.cardchild, this.ontab});

  final Color colour;
  final Widget cardchild;
  final Function ontab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}

class rounudButton extends StatelessWidget {
  rounudButton({@required this.icon, @required this.onpress});

  final IconData icon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onpress,
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
