// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:bmi/constants.dart';
import 'package:bmi/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResults;
  final String resultText;
  final String interpretation;
  final TextStyle bmiResultStyle;

  const ResultsPage({
    Key? key,
    required this.bmiResults,
    required this.resultText,
    required this.interpretation,
    required this.bmiResultStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                kResultTitle,
                style: kButtonTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Color(0xFF1B1C2B),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          resultText,
                          style: bmiResultStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          bmiResults,
                          style: kCalculatedBMIText,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            interpretation,
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            buttonOnClick: () {
              Navigator.pop(context);
            },
            buttonText: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
