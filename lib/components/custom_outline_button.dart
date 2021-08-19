import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final double elevation;
  final double borderRadius;
  final EdgeInsets padding;
  final double textSize;
  final FontWeight fontWeight;
  final Color splashColor;
  final double borderWidth;

  const CustomOutlineButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.color,
    this.borderRadius,
    this.padding,
    this.textSize,
    this.fontWeight,
    this.elevation,
    this.splashColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: elevation ?? 59.0,
      child: OutlineButton(
        splashColor: splashColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
        ),
        borderSide: BorderSide(color: color ?? kColorPrimary, width: borderWidth ?? 1.0),
        child: Padding(
          padding: padding ??
              const EdgeInsets.only(top: 9, bottom: 10, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.button.copyWith(
                      color: color ?? kColorPrimary,
                      fontSize: textSize ??
                          Theme.of(context).textTheme.button.fontSize,
                      fontWeight: fontWeight,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
