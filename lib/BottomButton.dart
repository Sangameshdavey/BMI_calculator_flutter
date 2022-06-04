import 'package:flutter/material.dart';
import 'constants.dart';

class Bottom_calc_button extends StatelessWidget {
  String buttontitle;
  final VoidCallback ontap;
  Bottom_calc_button({required this.buttontitle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          child: Center(
            child: Text(
              buttontitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          color: kbottomcontainercolor,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10.0),
          height: kbottomcontainerheight,
          padding: EdgeInsets.only(bottom: 20)),
    );
  }
}
