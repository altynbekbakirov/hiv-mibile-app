import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';

class ChevronButton extends StatefulWidget {
  const ChevronButton(
      {Key key,
      this.text,
      this.fillColor,
      this.fontSize,
      this.height,
      this.onTap})
      : super(key: key);

  final String text;
  final Color fillColor;
  final double fontSize;
  final double height;
  final Function onTap;

  @override
  _ChevronButtonState createState() => _ChevronButtonState();
}

class _ChevronButtonState extends State<ChevronButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDetails) {
        setState(() {
          isTapped = true;
        });
      },
      onTapUp: (tapDetails) {
        widget.onTap();
        setState(() {
          isTapped = false;
        });
      },
      onTapCancel: (){
        setState(() {
          isTapped = false;
        });
      },
      child: Container(
        height: widget.height ?? 56.0,
        child: ListTile(
          title: Text(
            widget.text,
            style: TextStyle(
                fontSize: widget.fontSize,
                color: isTapped ? kColorWhite : Colors.black,
                fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: isTapped ? kColorWhite : kModerateBlue,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isTapped ? kModerateBlue : kColorWhite),
      ),
    );
  }
}
