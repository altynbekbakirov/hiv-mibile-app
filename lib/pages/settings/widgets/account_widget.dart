import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {

  const AccountWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: Text(
            'logout'.tr(),
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.exit_to_app,
            color: Colors.blue,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
