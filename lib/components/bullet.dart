import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';

/// Маркер (Точка) для маркированного списка
class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: new BoxDecoration(
        color: kModerateBlue,
        shape: BoxShape.circle,
      ),
    );
  }
}