import 'package:HIVApp/Enums/chapter_type.dart';
import 'package:HIVApp/components/card_with_list_tile.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/model/text_provider.dart';
import 'package:HIVApp/pages/school/chapters/certificate_page.dart';
import 'package:HIVApp/pages/school/chapters/chapter_seven.dart';
import 'package:provider/provider.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

import 'chapters/chapter_eight.dart';
import 'chapters/chapter_five.dart';
import 'chapters/chapter_four.dart';
import 'chapters/chapter_one.dart';
import 'chapters/chapter_six.dart';
import 'chapters/chapter_three.dart';
import 'chapters/chapter_two.dart';
import 'doctors_component.dart';

/// Контент выбора "Текст" на странице Школа пациентов
class SchoolPatientContent extends StatefulWidget {
  const SchoolPatientContent({Key key}) : super(key: key);

  @override
  _SchoolPatientContentState createState() => _SchoolPatientContentState();
}

class _SchoolPatientContentState extends State<SchoolPatientContent> {
  double chapterOnePercent;
  double chapterTwoPercent;
  double chapterThreePercent;
  double chapterFourPercent;
  double chapterFivePercent;
  double chapterSixPercent;
  double chapterSevenPercent;
  double chapterEightPercent;

  @override
  void initState() {
    super.initState();
    setPlHivTest();
  }

  setPlHivTest() {
    if(Prefs.getDouble("PL_HIV_TEST") == null){
      Prefs.setDouble("PL_HIV_TEST", 0);
    }
  }

  Route selectChapter(Chapter chapter) {
    Route route;
    switch (chapter) {
      case Chapter.one:
        route = MaterialPageRoute(
            builder: (context) => ChapterOne(
                  chapterOneCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
      case Chapter.two:
        route = MaterialPageRoute(
            builder: (context) => ChapterTwo(
                  chapterTwoCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
      case Chapter.three:
        route = MaterialPageRoute(
            builder: (context) => ChapterThree(
                  chapterThreeCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
      case Chapter.four:
        route = MaterialPageRoute(
            builder: (context) => ChapterFour(
                  chapterFourCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
      case Chapter.five:
        route = MaterialPageRoute(
            builder: (context) => ChapterFive(
                  chapterFiveCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
      case Chapter.six:
        route = MaterialPageRoute(
            builder: (context) => ChapterSix(
                  chapterSixCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
      case Chapter.seven:
        route = MaterialPageRoute(
            builder: (context) => ChapterSeven(
                  chapterSevenCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
      case Chapter.eight:
        route = MaterialPageRoute(
            builder: (context) => ChapterEight(
                  chapterEightCallback: (value) =>
                      setChapterIndex(chapter, value),
                ));
        break;
    }
    return route;
  }

  void setChapterIndex(Chapter chapter, double value) {
    setState(() {
      Provider.of<PageCategory>(context, listen: false)
          .setPercent(value, chapter);
    });
  }

  void initChapters(BuildContext context) {
    chapterOnePercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.one.index);
    chapterTwoPercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.two.index);
    chapterThreePercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.three.index);
    chapterFourPercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.four.index);
    chapterFivePercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.five.index);
    chapterSixPercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.six.index);
    chapterSevenPercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.seven.index);
    chapterEightPercent =
        Provider.of<PageCategory>(context).getPercent(Chapter.eight.index);
  }

  @override
  Widget build(BuildContext context) {
    var selectedPage = Provider.of<PageCategory>(context).selectedPage;
    initChapters(context);

    var allPercent = chapterOnePercent +
        chapterTwoPercent +
        chapterThreePercent +
        chapterFourPercent +
        chapterFivePercent +
        chapterSixPercent +
        chapterSevenPercent +
        chapterEightPercent;

    var totalReadPercent = allPercent != null ? allPercent ~/ 8 : 0;
    var plhivtest = Prefs.getDouble("PL_HIV_TEST");

    return Container(
      color: kLightGrayishBlue,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: kColorWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      radius: 104.0,
                      lineWidth: 12.0,
                      percent: allPercent / 8 / 100,
                      backgroundColor: kLightGrayishBlue,
                      center: Text(
                        "$totalReadPercent%",
                        style: TextStyle(
                            color: kModerateBlue,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      progressColor: kLimeGreen,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: totalReadPercent == 100
                              ? kLimeGreen
                              : kDesaturatedBlue,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                        child: InkWell(
                            child: Text(
                              totalReadPercent == 100 && Prefs.getDouble("PL_HIV_TEST") >= 80
                                  ? "my_certificate".tr().toUpperCase()
                                  : "continue_to_read".tr().toUpperCase(),
                              style: TextStyle(
                                color: kColorWhite,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () {
                              Route route;
                              if (totalReadPercent == 100 && Prefs.getDouble("PL_HIV_TEST") >= 80) {
                                route = MaterialPageRoute(
                                    builder: (context) => CertificatePage());
                              } else {
                                Chapter chapter;
                                switch (selectedPage) {
                                  case 1:
                                    chapter = Chapter.one;
                                    break;
                                  case 2:
                                    chapter = Chapter.two;
                                    break;
                                  case 3:
                                    chapter = Chapter.three;
                                    break;
                                  case 4:
                                    chapter = Chapter.four;
                                    break;
                                  case 5:
                                    chapter = Chapter.five;
                                    break;
                                  case 6:
                                    chapter = Chapter.six;
                                    break;
                                  case 7:
                                    chapter = Chapter.seven;
                                    break;
                                  case 8:
                                    chapter = Chapter.eight;
                                    break;
                                }
                                route = selectChapter(chapter);
                              }
                              Navigator.push(context, route);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                CardListTile(
                    tileName: 'Модуль 1'.tr(),
                    trailing: chapterOnePercent != null
                        ? chapterOnePercent.toInt()
                        : 0,
                    onTap: () {
                      Route route = selectChapter(Chapter.one);
                      Navigator.push(context, route);
                    }),
                CardListTile(
                    tileName: 'Модуль 2'.tr(),
                    trailing: chapterTwoPercent != null
                        ? chapterTwoPercent.toInt()
                        : 0,
                    onTap: () {
                      if (chapterOnePercent != null &&
                          chapterOnePercent == 100) {
                        Route route = selectChapter(Chapter.two);
                        Navigator.push(context, route);
                      }
                    }),
                CardListTile(
                    tileName: 'Модуль 3'.tr(),
                    trailing: chapterThreePercent != null
                        ? chapterThreePercent.toInt()
                        : 0,
                    onTap: () {
                      if (chapterTwoPercent != null &&
                          chapterTwoPercent == 100) {
                        Route route = selectChapter(Chapter.three);
                        Navigator.push(context, route);
                      }
                    }),
                CardListTile(
                    tileName: 'Модуль 4'.tr(),
                    trailing: chapterFourPercent != null
                        ? chapterFourPercent.toInt()
                        : 0,
                    onTap: () {
                      if (chapterThreePercent != null &&
                          chapterThreePercent == 100) {
                        Route route = selectChapter(Chapter.four);
                        Navigator.push(context, route);
                      }
                    }),
                CardListTile(
                    tileName: 'Модуль 5'.tr(),
                    trailing: chapterFivePercent != null
                        ? chapterFivePercent.toInt()
                        : 0,
                    onTap: () {
                      if (chapterFourPercent != null &&
                          chapterFourPercent == 100) {
                        Route route = selectChapter(Chapter.five);
                        Navigator.push(context, route);
                      }
                    }),
                CardListTile(
                    tileName: 'Модуль 6'.tr(),
                    trailing: chapterSixPercent != null
                        ? chapterSixPercent.toInt()
                        : 0,
                    onTap: () {
                      if (chapterFivePercent != null &&
                          chapterFivePercent == 100) {
                        Route route = selectChapter(Chapter.six);
                        Navigator.push(context, route);
                      }
                    }),
                CardListTile(
                    tileName: 'Модуль 7'.tr(),
                    trailing: chapterSevenPercent != null
                        ? chapterSevenPercent.toInt()
                        : 0,
                    onTap: () {
                      if (chapterSixPercent != null &&
                          chapterSixPercent == 100) {
                        Route route = selectChapter(Chapter.seven);
                        Navigator.push(context, route);
                      }
                    }),
                CardListTile(
                    tileName: 'Модуль 8'.tr(),
                    trailing: chapterEightPercent != null
                        ? chapterEightPercent.toInt()
                        : 0,
                    onTap: () {
                      if (chapterSevenPercent != null &&
                          chapterSevenPercent == 100) {
                        Route route = selectChapter(Chapter.eight);
                        Navigator.push(context, route).then((value) {
                          setPlHivTest();
                        });
                      }
                    }),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
