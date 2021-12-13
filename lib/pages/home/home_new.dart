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
import 'package:HIVApp/pages/school/patient_school.dart';
import 'package:HIVApp/pages/settings/settings_page.dart';
import 'package:HIVApp/pages/test/hiv_test_page.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeNew extends StatefulWidget {
  int index;

  HomeNew({this.index});

  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  String appBarName = '';

  DateTime currentBackPressTime;
  bool logged = false;
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 5);
    if (widget.index != null) {
      _selectedIndex = widget.index;
      _selectPage(widget.index);
    }
    isLoggedIn();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  String mainActive = "assets/images/icons/Main/Active.png";
  String schoolActive = "assets/images/icons/School/Active.png";
  String addActive = "assets/images/icons/Add/Active.png";
  String diaryActive = "assets/images/icons/Diary/Active.png";
  String notificationActive = "assets/images/icons/Notification/Active/No.png";

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
            // callback: (val) => {
            //       setState(() {
            //         _selectedIndex = val;
            //       })
            //     }
            );
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
      // return MyHealth(
      //     callback: (val) => {
      //           setState(() {
      //             _selectedIndex = val;
      //           })
      //         });
      case 11:
        return MyStatePage();
    }
  }

  Future<bool> _onWillPop() async {
    print("on will pop");
    if (_tabController.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(Duration(milliseconds: 200), () {
      print("LLLLLLdfd");
      setState(() {
        _tabController.index = 0;
      });
    });
    print("dasdfasd");

    return _tabController.index == 0;
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

  String _selectedAppBarName() {
    switch (_tabController.index) {
      case 0:
        return "AIDS_Center";
      case 1:
        return "patient_school";
      case 2:
        return "notification";
      case 3:
        return "what_is_HIV";
      case 4:
        return "all_notifications";
    }
    return "Default";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_selectedAppBarName().tr().toUpperCase(),
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: IconButton(
                  icon: Icon(Icons.more_vert, size: 18, color: Colors.black),
                ),
              ),
            ],
          ),
          backgroundColor: kLightGrayishBlue,
          bottomNavigationBar: menu(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/h_p_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(child: HomeWidget()),
                Container(child: PatientSchoolPage(showAppBar: false)),
                Container(child: AddPage()),
                Container(child: HivInformationPage(showAppBar: false)),
                Container(child: AllNotifications()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.white,
        isScrollable: false,
        onTap: (index) => setState(() {}),
        tabs: [
          Tab(
            child: Image.asset(
              _tabController.index == 0
                  ? mainActive
                  : 'assets/images/icons/Main/Regular.png',
              height: 32,
              width: 32,
            ),
          ),
          Tab(
            child: Image.asset(
              _tabController.index == 1
                  ? schoolActive
                  : 'assets/images/icons/School/Regular.png',
              height: 32,
              width: 32,
            ),
          ),
          Tab(
            child: Image.asset(
              _tabController.index == 2
                  ? addActive
                  : 'assets/images/icons/Add/Regular.png',
              height: 32,
              width: 32,
            ),
          ),
          Tab(
              child: Image.asset(
            _tabController.index == 3
                ? diaryActive
                : 'assets/images/icons/Diary/Regular.png',
            height: 32,
            width: 32,
          )),
          Tab(
            child: Image.asset(
              _tabController.index == 4
                  ? notificationActive
                  : 'assets/images/icons/Notification/Regular/No.png',
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
    );
  }
}
