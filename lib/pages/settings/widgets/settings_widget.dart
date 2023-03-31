import 'package:hiv/data/configs.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/model/user.dart';
import 'package:hiv/pages/forgot/forgot_password_page.dart';
import 'package:hiv/pages/settings/widgets/change_password.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../routes/routes.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  var url = Configs.ip + "/hiv_instruction.pdf";
  var us = Prefs.getString(Prefs.USERNAME);
  var to = Prefs.getString(Prefs.TOKEN);

  DbUser user;

  Future getUser() async {
    await DBProvider.db.getUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: Text(
            'instructions_to_app'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
          onTap: _launchURL,
        ),
        Prefs.getString(Prefs.USERNAME) != null &&
                Prefs.getString(Prefs.TOKEN) != null
            ? ListTile(
                leading: Text(
                  'password_change'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordPage(true),
                  ),
                ),
              )
            : Container(),
        Prefs.getString(Prefs.USERNAME) != null &&
                Prefs.getString(Prefs.TOKEN) != null
            ? ListTile(
                leading: Text(
                  'password_reset'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                ),
              )
            : Container(),
        if (user != null && user.pin_code == null)
          ListTile(
            leading: Text(
              'set_pin_code'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
            onTap: () => Navigator.of(context).popAndPushNamed(Routes.pin_code),
          ),
      ],
    );
  }
}
