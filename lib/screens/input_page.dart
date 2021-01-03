import 'file:///C:/Users/vinay.bhor/AndroidStudioProjects/bmi-calculator-flutter/lib/components/icon_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_iconbutton.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int Height=180;
  int weight=60;
  int age=20;
  Color maleCardclr=kInactiveColor;
  Color femaleCardclr=kInactiveColor;
  void updateColor(Gender input){
    //if male card pressed, set clr=active and female inactive
    //if female pressed opposite
    if(Gender.male==input){
      if(maleCardclr==kInactiveColor){
        maleCardclr==kActiveColor;
        femaleCardclr==kInactiveColor;
      }else{
        maleCardclr==kInactiveColor;
      }
    }else{
      if(femaleCardclr==kInactiveColor){
        femaleCardclr==kActiveColor;
        maleCardclr==kInactiveColor;
      }else{
        femaleCardclr==kInactiveColor;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Row(

            children: [
              Expanded(
                child:ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      myIcon: FontAwesomeIcons.mars,
                      myText: "Male",
                    ),
                    clr: selectedGender == Gender.male ? kInactiveColor : kActiveColor
                ),
                  ),
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    clr: selectedGender == Gender.female ? kInactiveColor : kActiveColor,
                    cardChild: IconContent(
                      myIcon: FontAwesomeIcons.venus,
                      myText: "Female",
                    ),
                  )),
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                      clr:kActiveColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Height',
                                style: kTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.ideographic,
                                children: [
                                  Text(Height.toString(),
                                    style: kNumberTextstyle,
                                  ),
                                  Text('cm',
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.white,
                                  thumbColor: Color(0xFFEB1555),
                                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                                  overlayColor: Color(0x29EB1555),
                                ),
                                child: Slider(value: Height.toDouble(),
                                    min:120.0,
                                    max:220.0,
                                    onChanged: (double newValue){
                                      setState(() {
                                        Height = newValue.round();
                                      });
                                    },
                                    activeColor: kBottomContainerColor,
                                  inactiveColor: kColor,
                                ),
                              )
                            ],
                          ),
                  )
              ),
            ],
          )),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ReusableCard(
                    clr:kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                           ,
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressed: (){
                              setState(() {
                              weight++;
                              });
                              },
                            )
,
                          ]
                        ),
                      ],
                    ),

                  )
              ),
              Expanded(child: ReusableCard(
                  clr:kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          pressed: (){
                            setState(() {
                              age--;
                            });
                          },
                      ),
                      SizedBox(width: 10.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          pressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                    ]
                    ),
                  ],
                ),
              )),
            ],
          )),
          Expanded(child: BottomButton(
            btnName: 'CALCULATE',
            onTap: () {
              CalcultorBrain calc = CalcultorBrain(height: Height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiresult: calc.calculateBMI(),
                result: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },
          )),
        ],
      ),
    );
  }
}








