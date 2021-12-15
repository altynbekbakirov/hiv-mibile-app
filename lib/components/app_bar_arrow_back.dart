import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ArrowBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArrowBackAppBar({Key key, this.text, this.action}) : super(key: key);
  final String text;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black)),
      titleSpacing: 0.0,
      centerTitle: false,
      title: Text(text.tr(), style: TextStyle(color: Colors.black)),
      actions: [
        action ?? Container()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
