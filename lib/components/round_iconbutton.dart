import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function pressed;
  RoundIconButton({@required this.icon,@required this.pressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
      elevation: 6.0,
      child: Icon(icon),
    );
  }
}