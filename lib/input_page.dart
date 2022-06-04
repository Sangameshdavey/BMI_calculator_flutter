import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusablecard.dart';
import 'Icondata.dart';
import 'Results.dart';
import 'constants.dart';
import 'BottomButton.dart';
import 'BMI_calculation.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Color malecardcolor = kinactivecolor;
  Color femalecardcolor = kinactivecolor;
  int weight = 60;
  void updateColour(Gender selectedgender) {
    if (selectedgender == Gender.Male) {
      if (malecardcolor == kinactivecolor) {
        malecardcolor = kmaincolor;
        femalecardcolor = kinactivecolor;
      } else {
        malecardcolor = kinactivecolor;
      }
    } else if (selectedgender == Gender.Female) {
      if (femalecardcolor == kinactivecolor) {
        femalecardcolor = kmaincolor;
        malecardcolor = kinactivecolor;
      } else {
        femalecardcolor = kinactivecolor;
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseable_card(
                    cardchild: TopCardContents(
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        "Male"),
                    onpress: () {
                      setState(() {
                        updateColour(Gender.Male);
                      });
                    },
                    colour: malecardcolor,
                  ),
                ),
                Expanded(
                  child: Reuseable_card(
                    colour: femalecardcolor,
                    cardchild: TopCardContents(
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        "Female"),
                    onpress: () {
                      setState(() {
                        updateColour(Gender.Female);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseable_card(
              colour: kmaincolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: ktextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kbigTextStyle,
                      ),
                      Text(
                        'cm',
                        style: ktextstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 16),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseable_card(
                    colour: kmaincolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: ktextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kbigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.add,
                                func: () {
                                  setState(() {
                                    if (weight == 150) {
                                      weight = 50;
                                    }
                                    weight = weight + 1;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: Icons.remove,
                                func: () {
                                  setState(() {
                                    if (weight == 4) {
                                      weight = 60;
                                    }
                                    weight--;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseable_card(
                    colour: kmaincolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: ktextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kbigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.add,
                                func: () {
                                  setState(() {
                                    if (age == 100) {
                                      age = 50;
                                    }
                                    age = age + 1;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: Icons.remove,
                                func: () {
                                  setState(() {
                                    if (age == 4) {
                                      age = 20;
                                    }
                                    age--;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottom_calc_button(
            buttontitle: 'CALCULATE',
            ontap: () {
              Calculator_brain calc =
                  Calculator_brain(weight: weight, height: height);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiresult: calc.calculate(),
                      resultInterpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, required this.func});
  IconData? icon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: func,
      child: Icon(icon),
      elevation: 0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4f5e),
    );
  }
}

class bottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
