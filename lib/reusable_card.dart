import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color coulor;
  final Widget cardChild;
  final Function pressed;
  ReusableCard({@required this.coulor, this.cardChild, this.pressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: coulor,
        ),
      ),
    );
  }
}
