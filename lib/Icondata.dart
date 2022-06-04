import 'package:flutter/material.dart';
import 'constants.dart';

class TopCardContents extends StatelessWidget {
  final Icon icon;
  final String text;
  TopCardContents(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: ktextstyle,
        )
      ],
    );
  }
}
