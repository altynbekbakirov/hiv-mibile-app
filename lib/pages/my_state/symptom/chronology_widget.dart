import 'package:HIVApp/date_time/date_time_formatter.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/user_symptom.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:easy_localization/easy_localization.dart';

class SymptomChronolgy extends StatefulWidget {
  @override
  _SymptomChronolgyState createState() => _SymptomChronolgyState();
}

class _SymptomChronolgyState extends State<SymptomChronolgy>
    with TickerProviderStateMixin {
  List<UserSymptom> _list = new List<UserSymptom>();
  DateTime initialDate = DateTime.now();
  String asset_path = "assets/images/symptoms/";

  getList() async {
    await DBProvider.db.getAllUserSymptoms().then((value) {
      if (value.length > 0)
        setState(() {
          _list.addAll(value);
          initialDate = _list.first.date_time;
        });
    });
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool compareTwoDates(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              child: GroupedListView<UserSymptom, String>(
                shrinkWrap: true,
                elements: _list,
                groupBy: (element) => dateFormatter(element.date_time),
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 38,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(color: kVeryDarkGrayishBlue,
                                fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kModerateBlue, width: 1)),
                      ),
                    ],
                  ),
                ),
                itemBuilder: (context, UserSymptom element) {
                  return Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: ListTile(
                        tileColor: kLightGrayishBlue,
                        leading: Image.asset(asset_path + element.file_name,
                            height: 40),
                        title: Text(
                          element.title.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        trailing: SmoothStarRating(
                          allowHalfRating: false,
                          starCount: 5,
                          rating: element.rating,
                          size: 18.0,
                          isReadOnly: true,
                          color: kDarkGrayishBlue,
                          borderColor: kColorPrimaryDark,
                          spacing: 0.0,
                        ),
                      ),
                    ),
                  );
                },
                itemComparator: (item1, item2) =>
                    item1.date_time.compareTo(item2.date_time),
                order: GroupedListOrder.DESC,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
