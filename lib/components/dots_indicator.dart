import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

/// Индикатор точек, для отображения позиции
class DotIndicator extends StatelessWidget {

  final double position;
  final int dotsCount;

  const DotIndicator({Key key, this.position, this.dotsCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      axis: Axis.horizontal,
      decorator: DotsDecorator(
        activeColor: kDarkGrayishBlue,
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
