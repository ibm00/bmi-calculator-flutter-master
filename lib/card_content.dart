import 'package:flutter/material.dart';

import 'constant.dart';

class CardContent extends StatelessWidget {
  final IconData iconType;
  final String caption;
  CardContent({this.iconType, this.caption});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          iconType,
          size: 80,
        ),
        Text(
          caption,
          style: kTxtStyle,
        )
      ],
    );
  }
}
