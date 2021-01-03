import 'file:///C:/Users/vinay.bhor/AndroidStudioProjects/bmi-calculator-flutter/lib/components/bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String bmiresult;
  final String result;
  final String interpretation;

  ResultsPage({@required this.bmiresult,@required this.result,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                      style: kTitleTextStyle,
                ),
              ),
          ),
          Expanded(
              flex:5,
              child: ReusableCard(
                    clr: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          result,
                          style: KResultsTextStyle,),
                        Text(
                        bmiresult,
                         style: kBMITextStyle,
                        ),
                        Text(
                          interpretation,
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
              ),
          Align(
            alignment: FractionalOffset.bottomCenter,

            child: BottomButton(
              btnName: 'RE-CALCULATE BMI',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
