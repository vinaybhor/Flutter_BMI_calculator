import 'package:flutter/material.dart';
import '../constants.dart';
class IconContent extends StatelessWidget {

  final String myText;
  final IconData myIcon;
  IconContent({this.myText,this.myIcon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcon,
          size: 80.0,
        ),
        SizedBox(height: 15.0,
        ),
        Text(
          myText,
          style: kTextStyle,
        )
      ],
    );
  }
}