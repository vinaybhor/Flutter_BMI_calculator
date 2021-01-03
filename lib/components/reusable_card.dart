import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  /* const ReusableCard({
    Key key,
  }) : super(key: key);*/
  final Color clr;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.clr,this.cardChild,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadiusDirectional.circular(10.0),
        ),
      ),
    );
  }
}