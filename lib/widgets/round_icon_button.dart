// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData childWidget;
  final VoidCallback onPressed;

  const RoundIconButton(
      {Key? key, required this.childWidget, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      elevation: 6.0,
      child: Icon(childWidget),
    );
  }
}
