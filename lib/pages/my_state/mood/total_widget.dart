import 'package:hiv/components/custom_button.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/user_mood.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class TimeType {
  String name;
  int type;

  TimeType({this.name, this.type});
}

class MoodTotalWidget extends StatefulWidget {
  @override
  _MoodTotalWidgetState createState() => _MoodTotalWidgetState();
}

class _MoodTotalWidgetState extends State<MoodTotalWidget> {
  List<UserMoodTotal> _list = new List<UserMoodTotal>();
  List<TimeType> _timeList = new List<TimeType>();
  TimeType timeType = new TimeType();
  DateTime initialDate = DateTime.now();
  String asset_path = "assets/images/moods/";

  getList() async {
    if (_list.isNotEmpty) _list.clear();
    await DBProvider.db
        .getAllUserMoodsGroupedByTitle(timeType.type)
        .then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
  }

  @override
  void initState() {
    timeType = new TimeType(name: 'last7Days'.tr(), type: 1);
    _timeList.add(timeType);
    timeType = new TimeType(name: 'last30Days'.tr(), type: 2);
    _timeList.add(timeType);
    timeType = new TimeType(name: 'last60Days'.tr(), type: 3);
    _timeList.add(timeType);
    timeType = new TimeType(name: 'last6Months'.tr(), type: 5);
    _timeList.add(timeType);
    timeType = new TimeType(name: 'lastYear'.tr(), type: 6);
    _timeList.add(timeType);
    getList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kLightGrayishBlue),
            width: 200,
            child: DropdownButton<TimeType>(
              isExpanded: true,
              value: timeType,
              style: Theme.of(context).textTheme.bodyText1,
              underline: Container(),
              icon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(FontAwesomeIcons.clock,
                    color: kModerateBlue, size: 22),
              ),
              onChanged: (TimeType newValue) {
                setState(() {
                  timeType = newValue;
                  getList();
                });
              },
              items:
                  _timeList.map<DropdownMenuItem<TimeType>>((TimeType value) {
                return DropdownMenuItem<TimeType>(
                  value: value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      value.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 0.58,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    tileColor: kLightGrayishBlue,
                    leading: Image.asset(asset_path + _list[index].file_name,
                        height: 38),
                    title: Text(
                      _list[index].title.tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      _list[index].count.toString() + ' ' + 'day'.tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
              itemCount: _list.length,
            ),
          ),
        ],
      ),
    );
  }
}
