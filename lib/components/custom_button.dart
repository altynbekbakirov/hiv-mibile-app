import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double elevation;
  final double borderRadius;
  final EdgeInsets padding;
  final double textSize;
  final fontWeight;
  final Color fillColor;
  final Color textColor;

  const CustomButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.textSize,
    this.fontWeight,
    this.fillColor, this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: kModerateBlue,
      onPressed: onPressed,
      elevation: elevation ?? 0,
      fillColor: fillColor ?? kModerateBlue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4)),
      child: Padding(
        padding: padding ??
            const EdgeInsets.only(top: 9, bottom: 10, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: Theme.of(context).textTheme.button.copyWith(
                color: textColor ?? Colors.white,
                fontSize:
                    textSize ?? Theme.of(context).textTheme.button.fontSize,
                fontWeight: fontWeight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
