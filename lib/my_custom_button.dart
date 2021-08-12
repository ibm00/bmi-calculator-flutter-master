import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  MyCustomButton({this.icon, this.pressed});
  final IconData icon;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      child: Icon(icon),
      fillColor: Color(0xff4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 47.0,
        height: 47.0,
      ),
    );
  }
}
