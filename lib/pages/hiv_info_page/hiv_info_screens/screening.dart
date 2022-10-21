import 'package:HIVApp/pages/test/test_page.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'screening_body/body_of_sex.dart';

class ScreeningScreen extends StatelessWidget {
  const ScreeningScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("screening_on_hiv".tr(),
              style: TextStyle(color: Colors.black, fontSize: 18)),
          centerTitle: false,
          titleSpacing: 0.0,
          leading: InkWell(
              child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        body: TestPage());
    // TestPage());
    // ScreeningBody());
  }
}

class ScreeningBody extends StatefulWidget {
  const ScreeningBody({Key key}) : super(key: key);

  @override
  _ScreeningBodyState createState() => _ScreeningBodyState();
}

class _ScreeningBodyState extends State<ScreeningBody> {
  TextStyle tabBarTextStyle =
      TextStyle(color: kGrayishBlue, fontSize: 12, fontWeight: FontWeight.w400);

  /// Скрининг APPBAR
  Widget _appBarScreening() {
    return PreferredSize(
        preferredSize: Size.fromHeight(kTextTabBarHeight),
        child: Container(
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: kLightGrayishBlue)),
            color: kColorWhite,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: kLightGrayishBlue,
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: kColorWhite,
                      ),
                      unselectedLabelColor: kGrayishBlue,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelStyle: tabBarTextStyle,
                      labelColor: kDarkModerateBlue,
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      tabs: [
                        Tab(
                          text: 'test_page6'.tr(),
                        ),
                        Tab(
                          text:'test_page7'.tr()
                        ),
                        Tab(
                          text: "test_page8".tr()
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: _appBarScreening(),
          body: TabBarView(
            children: <Widget>[
              SexBody(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          )),
    );
  }
}
