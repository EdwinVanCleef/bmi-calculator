// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:bmi/calculator_brain.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:bmi/widgets/bottom_button.dart';
import 'package:bmi/widgets/card_gender_content.dart';
import 'package:bmi/widgets/reusable_card.dart';
import 'package:bmi/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female, unidentified }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  Gender selectedGender = Gender.unidentified;
  int height = 160;
  int weight = 60;
  int age = 18;

  TextStyle identifyTextStyle(String results) {
    if (results == 'OVERWEIGHT' || results == 'UNDERWEIGHT') {
      return kResultOverweightTextStyle;
    } else if (results == 'OBESE CLASS 1') {
      return kResultObese1TextStyle;
    } else if (results == 'OBESE CLASS 2') {
      return kResultObese2TextStyle;
    } else if (results == 'OBESE CLASS 3') {
      return kResultObese3TextStyle;
    } else {
      return kResultNormalTextStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    CardGenderContent(FontAwesomeIcons.mars, 'MALE'),
                    () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    CardGenderContent(FontAwesomeIcons.venus, 'FEMALE'),
                    () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        kMeasurement,
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kSliderThumbColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: kOverlayColor,
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              childWidget: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childWidget: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (weight <= 500) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              childWidget: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              childWidget: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age <= 100) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonOnClick: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResults: calculatorBrain.getCalculatedBMI(),
                    resultText: calculatorBrain.getResults(false),
                    interpretation: calculatorBrain.getResults(true),
                    bmiResultStyle:
                        identifyTextStyle(calculatorBrain.getResults(false)),
                  ),
                ),
              );
            },
            buttonText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
