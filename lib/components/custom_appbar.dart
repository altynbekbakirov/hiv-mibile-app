import 'package:HIVApp/pages/settings/settings_page.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

/// Универсальный APPBAR
class CustomAppBar extends StatelessWidget {

  final String appBarName;
  final Color color;
  final double fontSize;
  final Function onTap;
  final Widget leading;

  const CustomAppBar(this.appBarName, {this.color = kLightGrayishBlue, this.fontSize = 16.0, this.onTap, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? Container(),
      title: Text(
        appBarName,
        style: TextStyle(color: Colors.black, fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: color,
      centerTitle: false,
      titleSpacing: 0.0,
      elevation: 0,
      actions: <Widget>[
        InkWell(
          onTap: onTap,
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SettingsPage()
              ));
            },
            icon: Icon(Icons.more_vert, color: Colors.black),
          ),
        ),
      ],
      bottom: PreferredSize(
        child: Container(
          color: kLightGrayishBlue,
          height: 1.0,
        ),
        preferredSize: Size.fromHeight(1.0),
      ),
    );
  }
}
