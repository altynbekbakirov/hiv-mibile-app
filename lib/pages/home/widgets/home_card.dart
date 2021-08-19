import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

/// Карты для меню
class HomeMenuCard extends StatefulWidget {
  final String imagePath;
  final String cardName;
  final double fontSize;
  final double width;
  final double height;
  final double imageHeight;
  final double imageWidth;
  final Function onTap;

  const HomeMenuCard(
      {Key key,
      this.imagePath,
      this.cardName,
      this.fontSize,
      this.width,
      this.height,
      this.imageHeight,
      this.imageWidth,
      this.onTap})
      : super(key: key);

  @override
  _HomeMenuCardState createState() => _HomeMenuCardState();
}

class _HomeMenuCardState extends State<HomeMenuCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();

        setState(() {
          isTapped = false;
        });
      },
      onTapDown: (isDown) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      splashColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        // width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: widget.imageWidth,
              height: widget.imageHeight,
              color: isTapped ? Colors.white : null,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.cardName,
              style: TextStyle(
                  color: isTapped ? Colors.white : kModerateBlue,
                  fontSize: widget.fontSize ?? 12,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isTapped ? kModerateBlue : Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8.0,
                  offset: Offset(0, 1))
            ]),
      ),
    );
  }
}
