import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';
import 'my_custom_button.dart';

class WeightAndAge extends StatelessWidget {
  WeightAndAge(
      {this.minusPressed,
      this.plusPressed,
      this.cardCaption,
      this.startingValue});
  final Function minusPressed;
  final Function plusPressed;
  final String cardCaption;
  final int startingValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cardCaption,
          style: kTxtStyle,
        ),
        Text(
          startingValue.toString(),
          style: kNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomButton(
              pressed: minusPressed,
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 10,
            ),
            MyCustomButton(
              icon: FontAwesomeIcons.plus,
              pressed: plusPressed,
            )
          ],
        ),
      ],
    );
  }
}
