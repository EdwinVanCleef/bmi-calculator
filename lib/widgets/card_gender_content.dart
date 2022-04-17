// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class CardGenderContent extends StatelessWidget {
  final IconData mainIcon;
  final String mainText;

  const CardGenderContent(this.mainIcon, this.mainText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: kFlexValue,
          child: Icon(
            mainIcon,
            size: kIconSize,
          ),
        ),
        Expanded(
          child: Text(
            mainText,
            style: kTextStyle,
          ),
        ),
      ],
    );
  }
}
