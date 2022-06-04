import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      // theme: ThemeData(
      //     scaffoldBackgroundColor: Color(0xFF111428),
      //     textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      //     colorScheme: ColorScheme.fromSwatch()
      //         .copyWith(primary: const Color(0xFF0C0F24))
      //         .copyWith(
      //             secondary: Colors
      //                 .purple)),
      // copy from colorzilla,remove hash and add 0xFF
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0C0F24),
          appBarTheme: AppBarTheme(color: Color(0xFF0C0F24)),
          scaffoldBackgroundColor: Color(0xFF111428)),
      home: InputPage(),
    );
  }
}
