import 'package:flutter/material.dart';

/// Страницы карусели
class CarouselPage extends StatelessWidget {
  final List list;
  final double height;
  final double fontSize;
  final TextStyle textStyle;

  const CarouselPage({this.list, this.height, this.fontSize, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
        child: Column(
          children: [
            Image.asset(list[0], fit: BoxFit.fill),
            Text('${list[1]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize + 2,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            list.length > 2
                ? Text(
              '${list[2]}',
              textAlign: TextAlign.center,
              style: textStyle,
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}