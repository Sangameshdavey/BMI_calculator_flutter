import 'package:flutter/material.dart';

class Reuseable_card extends StatelessWidget {
  //done using extract flutter widget

  Reuseable_card(
      {this.colour = const Color(0xff1D1F33), this.cardchild, this.onpress});
  final Color colour;
  final Widget? cardchild;
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
