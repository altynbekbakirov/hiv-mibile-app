import 'dart:async';
import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/components/custom_appbar.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/pages/add/add_page.dart';
import 'package:HIVApp/pages/consultation/consultation_page.dart';
import 'package:HIVApp/pages/hiv_info_page/hiv_info_page.dart';
import 'package:HIVApp/pages/hiv_prevention/hiv_prevention_page.dart';
import 'package:HIVApp/pages/home/widgets/bottom_nav_bar.dart';
import 'package:HIVApp/pages/home/widgets/home_widget.dart';
import 'package:HIVApp/pages/my_state/my_health.dart';
import 'package:HIVApp/pages/my_state/my_state.dart';
import 'package:HIVApp/pages/notification/all_notifications.dart';
import 'package:HIVApp/pages/presence_of_hiv/hiv_presence.dart';
import 'package:HIVApp/pages/settings/settings_page.dart';
import 'package:HIVApp/pages/test/hiv_test_page.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeNew extends StatefulWidget {
  int index;

  HomeNew({this.index});

  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  int _selectedIndex = 0;
  String appBarName = '';

  DateTime currentBackPressTime;
  bool logged = false;

  @override
  void initState() {
    if (widget.index != null) {
      _selectedIndex = widget.index;
      _selectPage(widget.index);
    }
    isLoggedIn();
    super.initState();
  }

  isLoggedIn() async {
    await DBProvider.db.getUserId().then((value) {
      if (value != null)
        setState(() {
          logged = true;
        });
    });
  }

  Widget _selectPage(int index) {
    switch (index) {
      case 0:
        return HomeWidget(
            callback: (val) => {
                  setState(() {
                    _selectedIndex = val;
                  })
                });
      case 1:
        break;
      case 2:
        return AddPage();
      case 3:

      case 4:
        return AllNotifications();
      case 5:
        return HivInformationPage();
      case 6:
        return HivTestPage();
      case 7:
        return HivPreventionPage();
      case 8:
        return PresenceOfHivPage();
      case 9:
        return ConsultationPage();
      case 10:
        return MyHealth(
            callback: (val) => {
                  setState(() {
                    _selectedIndex = val;
                  })
                });
      case 11:
        return MyStatePage();
    }
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'click_once_to_exit'.tr());
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    String _selectedAppBarName() {
      switch (_selectedIndex) {
        case 0:
          return "AIDS_Center";
        case 1:
          return "TODO Add new";
        case 2:
          return "notification";
        case 3:
          return "settings";
        case 4:
          return "all_notifications";
        case 5:
          return "what_is_HIV";
        case 6:
          return "hiv_test";
        case 7:
          return "hiv_prevention";
        case 8:
          return "do_you_have_hiv";
        case 9:
          return "consultation";
        case 10:
          return "my_condition";
      }
      return "Default";
    }

    Widget _appBar() {
      return AppBar(
        title: Text(_selectedAppBarName().tr().toUpperCase(),
            style: TextStyle(color: Colors.black)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: Container(),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            child: IconButton(
                icon: Icon(Icons.more_vert, size: 18, color: Colors.black)),
          ),
        ],
      );
    }

    // CustomAppBar(
    //   _selectedAppBarName().tr().toUpperCase(),
    //   leading: InkWell(
    //       child: Icon(Icons.arrow_back_ios,
    //           size: 18, color: Colors.black),
    //       onTap: () {
    //         Navigator.popAndPushNamed(context, Routes.home);
    //       }),
    //   color: Colors.white,
    //   onTap: () {
    //     setState(() {
    //       _selectedIndex = 3;
    //     });
    //   },
    // ),
    return Scaffold(
      appBar: _selectedIndex == 0
          ? _appBar()
          : PreferredSize(
              preferredSize: const Size.fromHeight(56.5),
              child: InkWell(
                  child: AppBar(
                    leading: InkWell(
                        onTap: () => Navigator.popAndPushNamed(context, Routes.home),
                        child: Icon(Icons.arrow_back_ios,
                            size: 18, color: Colors.black)),
                    titleSpacing: 0.0,
                    centerTitle: false,
                    title: Text(
                      _selectedAppBarName().tr().toUpperCase(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  }),
            ),
      backgroundColor: kLightGrayishBlue,
      body: WillPopScope(
        child: Container(
          child: _selectPage(_selectedIndex),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/h_p_background.png"),
                  fit: BoxFit.cover)),
        ),
        onWillPop: onWillPop,
      ),

      /// Навигационный панель
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        callback: (val) => {
          setState(() {
            _selectedIndex = val;
          })
        },
      ),
    );
  }
}
