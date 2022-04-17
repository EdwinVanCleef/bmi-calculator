// ignore_for_file: prefer_final_fields

import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  static const String _overweight = 'OVERWEIGHT';
  static const String _normal = 'NORMAL';
  static const String _underweight = 'UNDERWEIGHT';
  static const String _obeseC1 = 'OBESE CLASS 1';
  static const String _obeseC2 = 'OBESE CLASS 2';
  static const String _obeseC3 = 'OBESE CLASS 3';

  double _bmi = 0.0;
  double _minHealthyBMI = 18.5;
  double _maxHealthyBMI = 25.0;
  final Map<String, String> _results = {};

  CalculatorBrain(this.height, this.weight) {
    _calculateBMI();
    String interpretation = _getInterpretation(false);

    _results.addAll({
      _obeseC3: interpretation,
      _obeseC2: interpretation,
      _obeseC1: interpretation,
      _overweight: interpretation,
      _normal: _getInterpretation(true),
      _underweight: _getInterpretation(false)
    });
  }

  void _calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
  }

  String getCalculatedBMI() {
    return _bmi.toStringAsFixed(1);
  }

  double calculateWeightFromBMI() {
    double heightInches = height * 0.3937007874;
    double bmiDiff = _getBMIDiff();
    double bmiToCalculate = (bmiDiff == 0.0) ? _bmi : bmiDiff;
    double weight = bmiToCalculate / 703 * (heightInches * heightInches);
    return weight * 0.45359237;
  }

  double _getBMIDiff() {
    if (_bmi > _maxHealthyBMI) {
      return _bmi - _maxHealthyBMI;
    } else if (_bmi < _minHealthyBMI) {
      return _minHealthyBMI - _bmi;
    } else {
      return 0.0;
    }
  }

  String getResults(bool getInterpretation) {
    if (_bmi >= 40) {
      return (getInterpretation) ? _results[_obeseC3].toString() : _obeseC3;
    } else if (_bmi >= 35 && _bmi < 40) {
      return (getInterpretation) ? _results[_obeseC2].toString() : _obeseC2;
    } else if (_bmi >= 30 && _bmi < 35) {
      return (getInterpretation) ? _results[_obeseC1].toString() : _obeseC1;
    } else if (_bmi >= 25 && _bmi < 30) {
      return (getInterpretation)
          ? _results[_overweight].toString()
          : _overweight;
    } else if (_bmi > 18.5 && _bmi < 25) {
      return (getInterpretation) ? _results[_normal].toString() : _normal;
    } else {
      return (getInterpretation)
          ? _results[_underweight].toString()
          : _underweight;
    }
  }

  String _getInterpretation(bool isNormal) {
    double adjustedRange = calculateWeightFromBMI();
    String bmiRangeHealthy = 'Healthy BMI range: 18.5 - 25';
    String keyword = (adjustedRange > 25) ? 'Gain ' : 'Lose ';
    String bmiAdjustedRange = keyword +
        adjustedRange.toStringAsFixed(1) +
        ' kgs to reach a BMI of 25';

    return (isNormal)
        ? bmiRangeHealthy
        : bmiRangeHealthy + '\n' + bmiAdjustedRange;
  }
}
