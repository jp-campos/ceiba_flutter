import 'package:flutter/material.dart';
import 'package:prueba_ceiba_flutter/theme/colors.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: accentColor, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}

class BtnText extends StatelessWidget {
  const BtnText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: primaryColor,
      ),
    );
  }
}
