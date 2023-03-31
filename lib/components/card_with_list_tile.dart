import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';

class CardListTile extends StatefulWidget {

  final String tileName;
  final int trailing;
  final Function onTap;

  CardListTile({this.tileName, this.trailing, this.onTap});

  @override
  _CardListTileState createState() => _CardListTileState();
}

class _CardListTileState extends State<CardListTile> {
  Color tileBackground = kColorWhite;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      color: widget.trailing == 0 ? kColorWhite : widget.trailing == 100 ? kLimeGreen : kDesaturatedBlue,
      child: InkWell(
        splashColor: kModerateBlue,
        highlightColor: kModerateBlue,
        hoverColor: kModerateBlue,
        borderRadius: BorderRadius.circular(8.0),
        onTap: (){
          widget.onTap();
          setState(() {
            isClicked = false;
          });
        },
        onTapDown: (hasTapped){
          setState(() {
            isClicked = true;
          });
        },
        onTapCancel: (){
          setState(() {
            isClicked = false;
          });
        },
        child: ListTile(
          title: Text(
            widget.tileName,
            style: TextStyle(
                fontSize: 18,
                color: widget.trailing != 0 || isClicked ? kColorWhite : Colors.black,
                fontWeight: FontWeight.w500),
          ),
          trailing: Text("${widget.trailing.toString()}%"),
          autofocus: false,
        ),
      ),
    );
  }
}
