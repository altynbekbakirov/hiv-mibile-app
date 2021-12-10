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
      "Воздержание: Отказ от сексуальных контактов"
    ],
    [
      "assets/images/prevent5.png",
      "Верность одному неинфицированному \nВИЧ половому партнеру\n",
      "Это означает отказ от случайных половых контактов, химсекса, и иных форм опасного "
          "сексуального поведения. Насильственный секс усиливает риск инфицирования ВИЧ"
    ],
    [
      "assets/images/prevent6.png",
      "Всегда использовать презерватив и смазки на водной основе (лубриканты) при половых контактах"
    ],
    [
      "assets/images/prevent7.png",
      "Выявление и лечение ИППП совместно с половым партнером"
    ]
  ];

  List listTwo = [
    ["assets/images/prevent2.png", "Отказ от употребления наркотиков"],
    [
      "assets/images/prevent.png",
      "Если Вы употребляете наркотики, то снижайте риск: \n",
      "\nпользуйтесь только своим чистым шприцем; не набирайте наркотик из общей посуды; от инъекционного потребления – "
          "переходите на неинъекционные пути потребления (курение, прием через рот) или примите участие в программе "
          "поддерживающей терапии метадоном. "
    ],
    [
      "assets/images/prevent8.png",
      "Не проводите медицинские манипуляции у случайных людей вне медицинского учреждения"
    ],
    [
      "assets/images/prevent9.png",
      "При проведении процедур, связанных с повреждением кожи ",
      "(иглоукалывание; татуировки, пирсинг), следите, чтобы использовалось стерильное оборудование"
    ],
  ];

  List listThree = [
    [
      "assets/images/prevent3.png",
      "Пройдите вместе с половым партнером тест на ВИЧ при планировании или на ранней стадии беременности"
    ],
    [
      "assets/images/prevent10.png",
      "Если у Вас ВИЧ, строго соблюдайте назначения по лечению ВИЧ-инфекции (АРТ), которое предупредит передачу ВИЧ ребенку",
    ],
    [
      "assets/images/prevent11.png",
      "Проведите обследование на ВИЧ новорожденного ребенка и его лечение против ВИЧ сразу после родов"
    ],
    [
      "assets/images/prevent12.png",
      "Наблюдайтесь у врача и следуйте рекомендациям о родах и кормлении ребенка"
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
                      ? 450
                      : fontSize.toInt() == 20
                          ? 360
                          : fontSize.toInt() == 18
                              ? 330
                              : 400,
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
                text: "Как предотвратить заражение ВИЧ", style: chapterStyle),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text:
                    "Предупредить заражение ВИЧ легче, чем лечить. Соблюдение мер профилактики защитит Вас от заражения "
                    "вирусными гепатитами или инфекциями, которые передаются половым путем (ИППП). Инфицирование ИППП "
                    "увеличивает риск заражения ВИЧ половым путем. \n\nПоскольку ВИЧ передается только тремя путями – можно"
                    " защитить себя от заражения используя следующие правила.\n",
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
                      text:
                          "Профилактика полового пути \nпередачи ВИЧ строится на стратегии четыре В:",
                      style: normalBold),
                ]),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(),
              ),
              Expanded(
                child: listOne.length - 1 == _current
                    ? Container()
                    : Container(
                        child: Row(children: [
                          Text("ЛИСТАЙ"),
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
                      text: "Профилактика инъекционного пути передачи ВИЧ",
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
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(),
              ),
              Expanded(
                child: listTwo.length - 1 == _currentSecond
                    ? Container()
                    : Container(
                  child: Row(children: [
                    Text("ЛИСТАЙ"),
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
                      text:
                          "Профилактика передачи ВИЧ от ВИЧ-позитивной матери ребенку",
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
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(),
              ),
              Expanded(
                child: listThree.length - 1 == _currentThird
                    ? Container()
                    : Container(
                  child: Row(children: [
                    Text("ЛИСТАЙ"),
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
                    text:
                        "Даже, если человек живет с ВИЧ, ему нужно соблюдать меры профилактики",
                    style: TextStyle(
                        fontSize: fontSize + 4,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text:
                        " для предупреждения передачи ВИЧ другим людям. Это защитит самого человека с ВИЧ от заражения "
                        "вирусными гепатитами, ИППП, а также от повторного заражения другим измененным вирусом "
                        "иммунодефицита человека. ",
                    style:
                        TextStyle(fontSize: fontSize + 4, color: Colors.black)),
                TextSpan(
                    text:
                        "Повторное заражение, а также заражение другими инфекциями ухудшит его состояние здоровья.",
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
                    text:
                        "Для предупреждения ВИЧ-инфекции можно также проводить профилактическое лечение до контакта – "
                        "называется доконтактная профилактика (ДКП), а также после опасного \nконтакта  –  постконтактая "
                        "профилактика (ПКП).",
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
