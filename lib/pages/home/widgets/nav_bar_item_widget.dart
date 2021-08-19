import 'package:flutter/material.dart';

class NavBarItemWidget extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final String text;
  final Color color;

  const NavBarItemWidget({
    Key key,
    @required this.onTap,
    @required this.iconData,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              iconData,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
