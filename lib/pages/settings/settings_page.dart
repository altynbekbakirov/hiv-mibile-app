import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../data/pref_manager.dart';
import 'package:hiv/model/user_registrations.dart';
import 'package:provider/provider.dart';
import 'widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin<SettingsPage> {
  var _isDark = Prefs.getBool(Prefs.DARKTHEME, def: false);
  Color _color;

  @override
  void initState() {
    Provider.of<UserRegistration>(context, listen: false).getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: ArrowBackAppBar(
          text: 'settings'.tr().toUpperCase(),
        ),
        backgroundColor: kLightGrayishBlue,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SettingsWidget(),
                GeneralWidget(),
                // AccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}