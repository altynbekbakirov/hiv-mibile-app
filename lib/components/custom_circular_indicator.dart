import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/constants.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double radius;
  final double percent;
  final double lineWidth;
  final double line1Width;
  final String footer;

  const CustomCircularIndicator(
      {Key key,
      @required this.radius,
      @required this.percent,
      this.lineWidth,
      this.line1Width,
      this.footer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: radius,
          height: radius + (lineWidth ?? 5),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: radius,
                  height: radius,
                  // margin: EdgeInsets.only(
                  //     top: lineWidth != null ? lineWidth / 2 : 2.5,
                  //     right: lineWidth != null ? lineWidth : 5),
                  margin: EdgeInsets.all(
                      (lineWidth - (line1Width != null ? line1Width : 2)) / 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.grey[300],
                        width: line1Width != null ? lineWidth / 2 : 2),
                  ),
                ),
              ),
              CircularPercentIndicator(
                radius: radius,
                animation: true,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.transparent,
                progressColor: kColorBlue,
                lineWidth: lineWidth ?? 5,
                percent: percent,
                center: Center(
                  child: Text(
                    '${(percent * 100).toInt()}%',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Visibility(
          visible: footer != null ? true : false,
          child: Text(
            footer ?? '',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
