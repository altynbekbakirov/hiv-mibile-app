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
        "ДКП назначается врачом с учетом состояния здоровья, отрицательного ВИЧ-статуса"
      ],
      [
        "assets/images/exposure5.png",
        "Назначение требует Вашей регистрации в центре СПИД и наблюдения",
      ],
      [
        "assets/images/exposure3.png",
        "Лекарства для ДКП выдаются бесплатно в центрах СПИД"
      ],
      [
        "assets/images/exposure4.png",
        "В Кыргызстане получить ДКП можно при поддержке НПО"
      ],
      [
        "assets/images/exposure2.png",
        "При получении ДКП человек регулярно наблюдается в центре СПИД"
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
                text: "Доконтактная и постконтактая профилактика ВИЧ-инфекции",
                style: chapterStyle),
          ),
        ),
        SizedBox(height: 20),
        Image.asset("assets/images/ДКП.png"),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                  "Доконтактная профилактика (ДКП)\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text:
                  "Это прием антиретровирусных препаратов для предотвращения инфицирования ВИЧ людям с отрицательным "
                      "ВИЧ-статусом. Доконтактная профилактика рекомендуется в случаях, если Вы имеете постоянного полового"
                      " партнера, инфицированного ВИЧ, который не принимает либо часто нарушает прием препаратов. "
                      "Доконтактная профилактика также рекомендуется людям, которые практикуют опасное поведение.",
                  style: contentNormal),
              TextSpan(
                  text:
                  "\n\nРекомендации по доконтактной профилактике: \n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text:
                  "Следует получить полную информацию о ДКП в Центре СПИД или в НПО. Существует два способа приема ДКП. \n\n",
                  style: contentNormal),
              TextSpan(
                  text:
                  "Ежедневный (постоянный) прием ДКП ",
                  style: normalBold),
              TextSpan(
                  text:
                  "нужно осуществлять очень аккуратно, ежедневно в установленное время весь период, когда существует риск. При таком приеме эффект достигается в течение 4-7 дней после начала ДКП.\n\n",
                  style: contentNormal),
              TextSpan(
                  text:
                  "Если у Вас бывают редкие опасные контакты, рекомендуется ",
                  style: contentNormal),
              TextSpan(
                  text:
                  "ситуативный прием ДКП",
                  style: normalBold),
              TextSpan(
                  text:
                  " – когда препараты принимают в течение 3 дней до и 3 дней после контакта. Такой прием рекомендуется при редких ситуациях опасного поведения.",
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
                      text: "Следует помнить:",
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
                child: list.length - 1 == _current
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
                      text: "Постконтактная профилактика (ПКП) ",
                      style: normalBold),
                  TextSpan(
                      text: "– это профилактический прием антиретровирусных препаратов для предотвращения заражения "
                          "ВИЧ-инфекцией после возможного контакта с вирусом (при половом контакте, совместном употреблении "
                          "наркотиков или в других случаях). После оценки риска, проведения тестирования на ВИЧ, назначается ПКП. "
                          "Она может быть назначена в Центре СПИД, на станции скорой медицинской помощи или в других "
                          "организациях здравоохранения.",
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
                      text: "ВАЖНО ПОМНИТЬ:\n",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize + 2,
                          color: Colors.black)),
                  TextSpan(
                      text: "\nНачинать ПКП нужно как можно скорее после опасного контакта, но не позднее 72 часов "
                          "(3 суток) после него. Препараты назначает врач. Их принимают в течение месяца ежедневно "
                          "строго по назначению врача. После этого человек находится под наблюдением в течение 6 месяцев "
                          "(проходит тест на ВИЧ через 1, 3 и 6 месяцев). Следует также помнить, что ДКП и ПКП не "
                          "защищают от беременности и ИППП. Поэтому нужно параллельно использовать средства защиты "
                          "(презервативы, лубриканты) и контрацептивы.",
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
                      text: "Более подробную информацию можно получить в центрах СПИД или в неправительственных организациях. "
                          "Контактная информация находится в этом приложении",
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