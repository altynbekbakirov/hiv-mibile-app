import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class NextButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double textSize;
  final Color fillColor;

  const NextButton({Key key, this.onPressed, this.text, this.textSize, this.fillColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: CustomButton(
        fillColor: fillColor ?? kDesaturatedBlue,
        borderRadius: 8.0,
        onPressed: onPressed,
        text: text,
        textSize: textSize,
      ),
    );
  }
}
