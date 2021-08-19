import 'package:flutter/material.dart';
import 'package:HIVApp/model/radio_model.dart';

class RadioItem extends StatelessWidget {

  final RadioModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    Color notSelectedColor = Color.fromRGBO(104, 110, 135, 1);
    Color desaturatedBlue = Color.fromRGBO(113, 133, 209, 1);

    return Container(
      height: 24.0,
      width: 87.0,
      child: Center(
        child: Text(_item.buttonText,
            style: TextStyle(color: _item.isSelected
                ? Colors.white
                : notSelectedColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.0)
        ),
      ),
      decoration: BoxDecoration(
        color: _item.isSelected
            ? desaturatedBlue
            : Colors.transparent,
        borderRadius: const BorderRadius.all(const Radius.circular(100.0)),
      ),
    );
  }
}