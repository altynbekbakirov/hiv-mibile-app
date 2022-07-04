import 'dart:async';

import 'package:HIVApp/utils/constants.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'carousel_page.dart';

/// Страница "Как защитить себя от ВИЧ"
class SelfProtectInfoScreen extends StatefulWidget {
  @override
  _SelfProtectInfoScreenState createState() => _SelfProtectInfoScreenState();
}

class _SelfProtectInfoScreenState extends State<SelfProtectInfoScreen> {
  double fontSize = 18;
  bool showSlider = false;
  int selectedImageIndex = 0;
  double height = 0;
  double heightSecond = 0;
  double heightThird = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;
  int _currentSecond = 0;
  int _currentThird = 0;

  @override
  initState() {
    super.initState();
  }

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

  List listOne = [
    [
      "assets/images/prevent1.png",
      "hiv_prevention_car1_text1".tr()
    ],
    [
      "assets/images/prevent5.png",
      "hiv_prevention_car1_text2".tr()
    ],
    [
      "assets/images/prevent6.png",
      "hiv_prevention_car1_text3".tr()
    ],
    [
      "assets/images/prevent7.png",
      "hiv_prevention_car1_text4".tr()
    ]
  ];

  List listTwo = [
    ["assets/images/prevent2.png", "hiv_prevention_car2_text1".tr()],
    [
      "assets/images/prevent.png",
      "hiv_prevention_car2_text2".tr()
    ],
    [
      "assets/images/prevent8.png",
      "hiv_prevention_car2_text3".tr()
    ],
    [
      "assets/images/prevent9.png",
      "hiv_prevention_car2_text4".tr()
    ],
  ];

  List listThree = [
    [
      "assets/images/prevent3.png",
      "hiv_prevention_car3_text1".tr()
    ],
    [
      "assets/images/prevent10.png",
      "hiv_prevention_car3_text2".tr(),
    ],
    [
      "assets/images/prevent11.png",
      "hiv_prevention_car3_text3".tr()
    ],
    [
      "assets/images/prevent12.png",
      "hiv_prevention_car3_text4".tr()
    ],
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle chapterStyle = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 10,
        fontWeight: FontWeight.w600);

    TextStyle contentNormal =
        TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w600);

    TextStyle linkedStyle = TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontSize: fontSize);

    /// Первый карусель
    Widget _carouselSliderFirst(List list) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ExpandablePageView(
              children: [
                CarouselPage(
                    list: list[0],
                    height: fontSize.toInt() == 24
                        ? 260
                        : fontSize.toInt() == 20
                            ? 230
                            : fontSize.toInt() == 18
                                ? 220
                                : 250,
                    fontSize: fontSize,
                    textStyle: contentNormal),
                CarouselPage(
                  list: list[1],
                  height: fontSize.toInt() == 24
                      ? 505
                      : fontSize.toInt() == 20
                          ? 450
                          : fontSize.toInt() == 18
                              ? 400
                              : 490,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[2],
                  height: fontSize.toInt() == 24
                      ? 300
                      : fontSize.toInt() == 20
                          ? 270
                          : fontSize.toInt() == 18
                              ? 240
                              : 290,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[3],
                  height: fontSize.toInt() == 24
                      ? 290
                      : fontSize.toInt() == 20
                          ? 250
                          : fontSize.toInt() == 18
                              ? 230
                              : 270,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
              ],
              onPageChanged: (value) {
                setState(() {
                  _current = value;
                });
              },
            ),
          ],
        ),
      );
    }

    /// Второй карусель
    Widget _carouselSliderSecond(List list) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ExpandablePageView(
              children: [
                CarouselPage(
                  list: list[0],
                  height: fontSize.toInt() == 24
                      ? 280
                      : fontSize.toInt() == 20
                          ? 220
                          : fontSize.toInt() == 22
                              ? 250
                              : 200,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[1],
                  height: fontSize.toInt() == 24
                      ? 505
                      : fontSize.toInt() == 20
                          ? 450
                          : fontSize.toInt() == 18
                              ? 400
                              : 490,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[2],
                  height: fontSize.toInt() == 24
                      ? 300
                      : fontSize.toInt() == 20
                          ? 260
                          : fontSize.toInt() == 18
                              ? 240
                              : 280,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[3],
                  height: fontSize.toInt() == 24
                      ? 370
                      : fontSize.toInt() == 20
                          ? 320
                          : fontSize.toInt() == 18
                              ? 280
                              : 350,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
              ],
              onPageChanged: (value) {
                setState(() {
                  _currentSecond = value;
                });
              },
            )
          ],
        ),
      );
    }

    /// Третий карусель
    Widget _carouselSliderThird(List list) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ExpandablePageView(
              children: [
                CarouselPage(
                  list: list[0],
                  height: fontSize.toInt() == 24
                      ? 320
                      : fontSize.toInt() == 20
                          ? 275
                          : fontSize.toInt() == 18
                              ? 250
                              : 300,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[1],
                  height: fontSize.toInt() == 24
                      ? 330
                      : fontSize.toInt() == 20
                          ? 290
                          : fontSize.toInt() == 18
                              ? 270
                              : 310,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[2],
                  height: fontSize.toInt() == 24
                      ? 330
                      : fontSize.toInt() == 20
                          ? 260
                          : fontSize.toInt() == 18
                              ? 240
                              : 280,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[3],
                  height: fontSize.toInt() == 24
                      ? 310
                      : fontSize.toInt() == 20
                          ? 270
                          : fontSize.toInt() == 18
                              ? 250
                              : 290,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
              ],
              onPageChanged: (value) {
                setState(() {
                  _currentThird = value;
                });
              },
            )
          ],
        ),
      );
    }

    Widget _selfProtectContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "hiv_prevention1text1".tr(), style: chapterStyle),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text:"hiv_prevention1text2".tr(),
                style: contentNormal,
              ),
            ]),
          ),
        ),
        Container(
          color: kLightGrayishBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text:"hiv_prevention1text3".tr(),
                      style: normalBold),
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
                child: listOne.length - 1 == _current
                    ? Container()
                    : Container(
                        child: Row(children: [
                          Text("hiv_prevention1text4".tr()),
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
        _carouselSliderFirst(listOne),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(listOne, (index, card) {
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
        Container(
          color: kLightGrayishBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "hiv_prevention1text5".tr(),
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
                child: listTwo.length - 1 == _currentSecond
                    ? Container()
                    : Container(
                  child: Row(
                      children: [
                    Text("hiv_prevention1text4".tr()),
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

        _carouselSliderSecond(listTwo),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(listOne, (index, card) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.only(bottom: 16, right: 10),
              decoration: BoxDecoration(
                  color: _currentSecond == index
                      ? Colors.grey
                      : Color.fromRGBO(200, 200, 200, 1),
                  borderRadius: BorderRadius.circular(25)),
            );
          }),
        ),
        Container(
          color: kLightGrayishBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text:"hiv_prevention1text6".tr(),
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
                child: listThree.length - 1 == _currentThird
                    ? Container()
                    : Container(
                  child: Row(children: [
                    Text("hiv_prevention1text4".tr()),
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
        _carouselSliderThird(listThree),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(listOne, (index, card) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.only(bottom: 16, right: 10),
              decoration: BoxDecoration(
                  color: _currentThird == index
                      ? Colors.grey
                      : Color.fromRGBO(200, 200, 200, 1),
                  borderRadius: BorderRadius.circular(25)),
            );;
          }),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text:"hiv_prevention1text7".tr(),
                    style: TextStyle(
                        fontSize: fontSize + 4,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text:"hiv_prevention1text8".tr(),
                    style:
                        TextStyle(fontSize: fontSize + 4, color: Colors.black)),
                TextSpan(
                    text:"hiv_prevention1text9".tr(),
                    style: TextStyle(
                        fontSize: fontSize + 4,
                        color: Colors.black,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
        Container(
            height: 180,
            color: kBrightRed,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                text: TextSpan(
                    text:"hiv_prevention1text10".tr(),
                    style: TextStyle(
                        fontSize: fontSize + 4, fontWeight: FontWeight.w600)),
              ),
            ))
      ]);
    }

    Widget _selfProtect() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _selfProtectContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("how_to_protect".tr(),
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
      body: _selfProtect(),
    );
  }
}
