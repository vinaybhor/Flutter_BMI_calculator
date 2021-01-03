import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String btnName;
  final Function onTap;
  BottomButton({this.btnName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(btnName,

            style: kLargeButtonStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 110.0),
        width: double.infinity,
        height: kBottom_containerHt,
      ),
    );
  }
}