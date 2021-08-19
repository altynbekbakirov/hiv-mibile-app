import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatefulWidget {
  const SquareButton({Key key, this.image, this.text, this.onTap}) : super(key: key);

  final String image;
  final String text;
  final onTap;

  @override
  _SquareButtonState createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  get image => widget.image;
  get onTap => widget.onTap;
  get text => widget.text;

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = false;
        });
        onTap();
      },
      onTapDown: (hasTapped) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.3,
        width: MediaQuery.of(context).size.width * 0.42,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 40,
                width: 40,
                child:
                Image.asset(image, color: isTapped ? kColorWhite : null)),
            SizedBox(height: 10),
            Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: isTapped ? kColorWhite : kModerateBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600))
          ],
        ),
        decoration: BoxDecoration(
            color: isTapped ? kModerateBlue : kColorWhite,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}