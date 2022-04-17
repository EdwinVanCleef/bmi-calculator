// ignore_for_file: prefer_const_constructors

import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonOnClick;

  const BottomButton(
      {Key? key, required this.buttonText, required this.buttonOnClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonOnClick,
      child: Container(
        padding: EdgeInsets.only(
          top: 15.0,
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: kButtonTextStyle,
        ),
        color: kBottomColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
