import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'calendar_widget.dart';
import 'total_widget.dart';
import '../../../utils/constants.dart';

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  int _currentWidget = 0;
  List<bool> isSelected;

  Widget getWidget(int type) {
    if (type == 0) return MoodCalendarWidget();
    return MoodTotalWidget();
  }

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black)),
            titleSpacing: 0.0,
            elevation: 0.0,
            centerTitle: false,
            title: Text("mood".tr().toUpperCase(),
                style: TextStyle(color: Colors.black))),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: kLightGrayishBlue,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  height: 56,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _currentWidget = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 4),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: _currentWidget == 0
                                      ? kDesaturatedBlue
                                      : kColorWhite,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Center(
                                child: Text(
                                  "calendar".tr().toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: _currentWidget == 0
                                          ? kColorWhite
                                          : kVeryDarkGrayishBlue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _currentWidget = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4, right: 8),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: _currentWidget == 1
                                      ? kDesaturatedBlue
                                      : kColorWhite,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Center(
                                child: Text(
                                  "summary".tr().toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: _currentWidget == 1
                                          ? kColorWhite
                                          : kVeryDarkGrayishBlue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              getWidget(_currentWidget),
            ],
          ),
        ));
  }
}
