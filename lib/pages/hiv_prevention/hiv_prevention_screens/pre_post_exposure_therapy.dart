import 'package:HIVApp/utils/constants.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'carousel_page.dart';

/// Страница "Доконтактная и постконтактная профилактика ВИЧ-инфекции"
class PrePostExposureTherapyScreen extends StatefulWidget {
  @override
  _PrePostExposureTherapyScreenState createState() => _PrePostExposureTherapyScreenState();
}

class _PrePostExposureTherapyScreenState extends State<PrePostExposureTherapyScreen> {
  double fontSize = 18;
  bool showSlider = false;
  double height = 0;
  int _current = 0;

  Widget _appBarWithSizeSlider(BuildContext context) {
    return AppBar(
      leading: Container(),
      titleSpacing: 0.0,
      centerTitle: false,
      title: SliderTheme(
        data: SliderTheme.of(context).copyWith(trackHeight: 15),
        child: Slider(
          value: fontSize,
          min: 18,
          max: 24,
          divisions: 3,
          label: fontSize.round().toString(),
          onChanged: (value) {
            setState(() {
              fontSize = value;
            });
          },
        ),
      ),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle chapterStyle = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 10,
        fontWeight: FontWeight.w700);

    TextStyle contentItalic = TextStyle(
        color: Colors.black, fontSize: fontSize, fontStyle: FontStyle.italic);

    TextStyle contentNormal =
    TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w700);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w700);

    TextStyle linkedStyle = TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontSize: fontSize);

    List list = [
      [
        "assets/images/exposure1.png",
        "hiv_prevention3_car1_text1".tr()
      ],
      [
        "assets/images/exposure5.png",
        "hiv_prevention3_car1_text2".tr()
      ],
      [
        "assets/images/exposure3.png",
        "hiv_prevention3_car1_text3".tr()
      ],
      [
        "assets/images/exposure4.png",
        "hiv_prevention3_car1_text4".tr()
      ],
      [
        "assets/images/exposure2.png",
        "hiv_prevention3_car1_text5".tr()
      ],
    ];

    Widget _carouselSlider(List list) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ExpandablePageView(
              children: [
                CarouselPage(
                  list: list[0],
                  height: fontSize.toInt() == 24 ? 320 : fontSize.toInt() == 22 ? 300 : fontSize.toInt() == 20 ? 280 : 250,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[1],
                  height: fontSize.toInt() == 24 ? 320 : fontSize.toInt() == 22 ? 300 : fontSize.toInt() == 20 ? 280 : 250,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[2],
                  height: fontSize.toInt() == 24 ? 290 : fontSize.toInt() == 22 ? 270 : fontSize.toInt() == 20 ? 250 : 230,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[3],
                  height: fontSize.toInt() == 24 ? 280 : fontSize.toInt() == 22 ? 260 : fontSize.toInt() == 20 ? 240 : 220,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[4],
                  height: fontSize.toInt() == 24 ? 300 : fontSize.toInt() == 22 ? 270 : fontSize.toInt() == 20 ? 250 : 230,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
              ],
              onPageChanged: (value) {
                setState(() {
                  _current = value;
                });
              },
            )
          ],
        ),
      );
    }

    Widget _prePostExposureContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:"hiv_prevention3text1".tr(),
                style: chapterStyle),
          ),
        ),
        SizedBox(height: 20),
        Image.asset("assets/images/ДКП.png"),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"hiv_prevention3text2".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text:"hiv_prevention3text3".tr(),
                  style: contentNormal),
              TextSpan(
                  text:"hiv_prevention3text4".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text:"hiv_prevention3text5".tr(),
                  style: contentNormal),
              TextSpan(
                  text:"hiv_prevention3text6".tr(),
                  style: normalBold),
              TextSpan(
                  text:"hiv_prevention3text7".tr(),
                  style: contentNormal),
              TextSpan(
                  text:"hiv_prevention3text8".tr(),
                  style: contentNormal),
              TextSpan(
                  text:"hiv_prevention3text9".tr(),
                  style: normalBold),
              TextSpan(
                  text:"hiv_prevention3text10".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        Container(
          color: kLightGrayishBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text:"hiv_prevention3text11".tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize + 2,
                          color: Colors.black)),
                ]),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: list.length - 1 == _current
                    ? Container()
                    : Container(
                  child: Row(children: [
                    Text("hiv_prevention3text12".tr()),
                    Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.only(bottom: 16, right: 10),
                        child: Icon(Icons.arrow_forward,
                            color: Colors.grey)),
                  ]),
                ),
              ),
            ],
          ),
        ),
        _carouselSlider(list),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(list, (index, card) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.only(bottom: 16, right: 10),
              decoration: BoxDecoration(
                  color: _current == index
                      ? Colors.grey
                      : Color.fromRGBO(200, 200, 200, 1),
                  borderRadius: BorderRadius.circular(25)),
            );
          }),
        ),
        Image.asset("assets/images/truvada.png"),
        ListTile(
          title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "hiv_prevention3text13".tr(),
                      style: normalBold),
                  TextSpan(
                      text:"hiv_prevention3text14".tr(),
                      style: contentNormal),
                ],
              )),
        ),
        SizedBox(height: 20),
        Container(
          color: kLightGrayishBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:"hiv_prevention3text15".tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize + 2,
                          color: Colors.black)),
                  TextSpan(
                      text:"hiv_prevention3text16".tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize + 2,
                          color: Colors.black)),
                ]),
              ),
            ),
          ),
        ),
        Container(
          color: kSoftRed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "hiv_prevention3text17".tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize + 2,
                          color: kColorWhite)),
                ]),
              ),
            ),
          ),
        ),
      ]);
    }

    Widget _methadoneTherapy() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _prePostExposureContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("prevention".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            }),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                showSlider = !showSlider;
              });
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text("Aa",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
      body: _methadoneTherapy(),
    );
  }
}