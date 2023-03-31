import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';

/// Нумерация для списка
class NumberBullet extends StatelessWidget {
  final String text;

  const NumberBullet({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 10),
      child: Container(
        child: Text("$text.", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: kModerateBlue)),
      ),
    );
  }
}