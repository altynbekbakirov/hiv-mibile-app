import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/model/user.dart';
import 'package:hiv/pages/login/login_page.dart';
import 'package:hiv/pages/settings/about_app_page.dart';
import 'package:hiv/utils/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';

class GeneralWidget extends StatefulWidget {
  const GeneralWidget({Key key}) : super(key: key);

  @override
  _GeneralWidgetState createState() => _GeneralWidgetState();
}

Future<bool> _checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

class _GeneralWidgetState extends State<GeneralWidget> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> logout() async {
    Provider.of<User>(context, listen: false).logout();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (ctx) => Center(
          child: AlertDialog(
            title: Text(''),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('back'.tr()),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
              FlatButton(
                child: Text('continue'.tr()),
                onPressed: () {
                  Navigator.of(ctx).popAndPushNamed(Routes.login);
                },
              )
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: kLightGrayishBlue,
          padding: EdgeInsets.all(15),
          child: Text(
            'general'.tr(),
            style: TextStyle(
              color: kDarkGrayishBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ListTile(
          leading: Text(
            'about_app'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutApp(),
              )),
        ),
        ListTile(
          leading: Text(
            'language'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () => Navigator.of(context).pushNamed(Routes.changeLanguage),
        ),
        /*ListTile(
          leading: Text(
            'instructions_to_app'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),*/
        // ListTile(
        //   leading: Text(
        //     'feedback'.tr(),
        //     style: TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        //   onTap: () {},
        // ),
        FlatButton(
          onPressed: () {
            if (Prefs.USER_ID != null)
              _checkInternetConnection().then((value) {
                if (value) {
                  logout().then((value) {
                    Prefs.setString(Prefs.TOKEN, null);
                    Prefs.setString(Prefs.USERNAME, null);
                    Navigator.pushAndRemoveUntil<void>(
                        context, MaterialPageRoute(builder: (context) => LoginPage()), ModalRoute.withName('/'));
                  });
                } else {
                  _showErrorDialog('connect_to_internet_to_logout'.tr());
                }
              });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Prefs.getString(Prefs.USERNAME) != null && Prefs.getString(Prefs.TOKEN) != null
                    ? "logout".tr()
                    : 'SignIn'.tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: kDesaturatedBlue),
              ),
              FaIcon(Icons.exit_to_app, color: kDesaturatedBlue),
            ],
          ),
        ),
      ],
    );
  }
}
