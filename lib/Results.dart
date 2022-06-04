import 'package:bmi_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/Reusablecard.dart';
import 'package:bmi_app/BottomButton.dart';
import 'package:bmi_app/BMI_calculation.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiresult,
      required this.resultInterpretation,
      required this.resultText});

  final String bmiresult;
  final String resultText;
  final String resultInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
                flex: 5,
                child: Reuseable_card(
                  colour: kmaincolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultstyle,
                      ),
                      Text(
                        bmiresult,
                        style: kBMIstyle,
                      ),
                      Text(
                        resultInterpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                )),
            Bottom_calc_button(
                buttontitle: 'RE-CALCULATE',
                ontap: () {
                  Navigator.pop(context);
                })
          ],
        ));
  }
}
