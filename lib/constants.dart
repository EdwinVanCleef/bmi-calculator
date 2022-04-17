import 'package:flutter/material.dart';

const kAppTitle = 'BMI CALCULATOR';
const kResultTitle = 'Your Result';
const kMeasurement = 'cm';

const kBottomContainerHeight = 80.0;

const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kBottomColor = Color(0xFFEB1559);
const kSliderThumbColor = Color(0xFFEB1555);
const kOverlayColor = Color(0x29EB1555);

const int kFlexValue = 3;
const double kIconSize = 80.0;
const double _resultTextSize = 30.0;

const TextStyle kTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF8D8E98),
);

const TextStyle kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w500,
);

const TextStyle kResultNormalTextStyle = TextStyle(
  color: Color(0xFF389F68),
  fontWeight: FontWeight.w700,
  fontSize: _resultTextSize,
);

const TextStyle kResultObese1TextStyle = TextStyle(
  color: Color(0xFFD38888),
  fontWeight: FontWeight.w700,
  fontSize: _resultTextSize,
);

const TextStyle kResultObese2TextStyle = TextStyle(
  color: Color(0xFFBC2020),
  fontWeight: FontWeight.w700,
  fontSize: _resultTextSize,
);

const TextStyle kResultObese3TextStyle = TextStyle(
  color: Color(0xFF8A0101),
  fontWeight: FontWeight.w700,
  fontSize: _resultTextSize,
);

const TextStyle kResultOverweightTextStyle = TextStyle(
  color: Color(0xFFFFE400),
  fontWeight: FontWeight.w700,
  fontSize: _resultTextSize,
);

const TextStyle kCalculatedBMIText = TextStyle(
  fontSize: 80.0,
  fontWeight: FontWeight.w800,
);
