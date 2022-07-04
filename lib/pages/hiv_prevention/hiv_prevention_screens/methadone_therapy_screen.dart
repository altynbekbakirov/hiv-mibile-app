import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'carousel_page.dart';

/// Страница "Поддерживающая терапия метадоном"
class MethadoneTherapyScreen extends StatefulWidget {
  @override
  _MethadoneTherapyScreenState createState() => _MethadoneTherapyScreenState();
}

class _MethadoneTherapyScreenState extends State<MethadoneTherapyScreen> {
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

    TextStyle contentNormal =
        TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w700);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w700);

    List list = [
      [
        "assets/images/methadon1.png",
        "hiv_prevention2_car1_text1".tr()      ],
      [
        "assets/images/methadone2.png",
        "hiv_prevention2_car1_text2".tr()      ],
      [
        "assets/images/methadone3.png",
        "hiv_prevention2_car1_text3".tr()      ],
      [
        "assets/images/methadone4.png",
        "hiv_prevention2_car1_text4".tr()      ],
      [
        "assets/images/methadone5.png",
        "hiv_prevention2_car1_text5".tr()      ],
      [
        "assets/images/methadone6.png",
        "hiv_prevention2_car1_text6".tr()      ],
      [
        "assets/images/methadon7.png",
        "hiv_prevention2_car1_text7".tr()
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
                  height: fontSize.toInt() == 24 ? 280 : fontSize.toInt() == 22 ? 260 : fontSize.toInt() == 20 ? 240 : 220,
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
                  height: fontSize.toInt() == 24 ? 320 : fontSize.toInt() == 22 ? 280 : fontSize.toInt() == 20 ? 260 : 240,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[3],
                  height: fontSize.toInt() == 24 ? 300 : fontSize.toInt() == 22 ? 280 : fontSize.toInt() == 20 ? 260 : 240,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[4],
                  height: fontSize.toInt() == 24 ? 300 : fontSize.toInt() == 22 ? 280 : fontSize.toInt() == 20 ? 260 : 240,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[5],
                  height: fontSize.toInt() == 24 ? 360 : fontSize.toInt() == 22 ? 330 : fontSize.toInt() == 20 ? 310 : 290,
                  fontSize: fontSize,
                  textStyle: contentNormal,
                ),
                CarouselPage(
                  list: list[6],
                  height: fontSize.toInt() == 24 ? 360 : fontSize.toInt() == 22 ? 330 : fontSize.toInt() == 20 ? 310 : 290,
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

    Widget _methadoneTherapyContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "hiv_prevention2text1".tr(),
                style: chapterStyle),
          ),
        ),
        Prefs.getString(Prefs.LANGUAGE) == "ru"
            ?
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                      "У человека, который потребляет наркотики, и особенно опиоиды (героин, опий, морфин и другое) возникает ",
                  style: contentNormal),
              TextSpan(
                  text: "психологическая зависимость – ", style: normalBold),
              TextSpan(
                  text:
                      "то есть желание потреблять наркотики, чтобы получить удовольствие. Однако очень быстро возникает ",
                  style: contentNormal),
              TextSpan(text: "физическая зависимость, ", style: normalBold),
              TextSpan(
                  text:
                      "когда человек испытывает тяжелые страдания при отказе от наркотиков это называется ",
                  style: contentNormal),
              TextSpan(text: "абстиненция ", style: normalBold),
              TextSpan(text: "или ", style: contentNormal),
              TextSpan(text: "ломка. ", style: normalBold),
              TextSpan(
                  text:
                      "Поэтому человеку трудно отказаться от наркотиков даже из-за проблем со здоровьем, отсутствием денег "
                      "или наркотика. Есть несколько способов преодолеть ломку: сделать это самому, при помощи друзей"
                      " или медицинских работников. Одним из безопасных и эффективных способов является участие в программе ",
                  style: contentNormal),
              TextSpan(
                  text: "поддерживающей терапии метадоном (ПТМ). ",
                  style: normalBold),
              TextSpan(
                  text:
                      "Она действует в Кыргызстане почти 20 лет и включает более 20 пунктов выдачи метадона. "
                      "Некоторые клиенты программы участвуют в ней с самого начала. Они живы, здоровы, имеют семьи и "
                      "работают.\n\n",
                  style: contentNormal),
              TextSpan(text: "Метадон ", style: normalBold),
              TextSpan(
                  text:
                      "назначается врачом для детоксикации (детокса) или лечения зависимости от опиодных "
                      "наркотиков. Метадон имеет важное значение в предупреждении инфицирования ВИЧ и другими инфекциями, "
                      "передаваемыми через кровь (вирусные гепатиты).",
                  style: contentNormal),
            ]),
          ),
        ):
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                  "Баңгизаттарды, өзгөчө опиоиддерди (героин, апийим, морфин жана башкалар) колдонгон адамда",
                  style: contentNormal),
              TextSpan(
                  text: " психологиялык көз карандылык ", style: normalBold),
              TextSpan(
                  text:
                  " пайда болот, башкача айтканда, ырахат алуу үчүн баңгизатын колдонуу каалоосу бар. Бирок, баңгизатынан ",
                  style: contentNormal),
              TextSpan(text: " физикалык көз карандылык, ", style: normalBold),
              TextSpan(
                  text:
                  "абдан тез пайда болот, адам баңгизатынан баш тартканда катуу азап чегет, бул ",
                  style: contentNormal),
              TextSpan(text: "абстиненция ", style: normalBold),
              TextSpan(text: "деп аталат. ", style: contentNormal),

              TextSpan(
                  text:"Ошондуктан, ден соолугу начарласа да, акчасы болбосо да, көз каранды адамдын баңгизатынан баш тартууга эрки жетпеши мүмкүн. "
                      "Көз карандуулуктан кутулуунун бир нече жолу бар: муну адам өзү же досторунун, же медициналык кызматкерлердин жардамы менен "
                  "жасай алат. Коопсуз жана натыйжалуу ыкмалардын бири –",
                  style: contentNormal),
              TextSpan(
                  text: "метадон менен колдоо программасына (MКП) катышуу. ",
                  style: normalBold),
              TextSpan(
                  text:"Бул программа Кыргызстанда дээрлик 20 жылдан бери иштеп келе жатат жана метадон берген 20дан ашык пункт бар. "
                      "Программанын кээ бир кардарлары ага башынан бери эле катышып келатышат. Алардын көзү тирүү, ден соолугу дурус, үй-бүлөлөрү бар жана "
                      "иштеп жатышат.\n\n",
                  style: contentNormal),
              TextSpan(text: "Метадонду ", style: normalBold),
              TextSpan(
                  text:
                  "дарыгер детоксикация (детокс) же опиоиддик баңгизаттарынан көз карандылыкты дарылоо үчүн дайындайт "
                      "Метадон ВИЧ жана кан аркылуу жуккан башка инфекциялардын (вирустук гепатиттин) "
                  "алдын алууда маанилүү ролду ойнойт. ",
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
                      text: "hiv_prevention2text2".tr(),
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
                    Text("hiv_prevention2text3".tr()),
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
        ListTile(
          title: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text: "hiv_prevention2text4".tr(),
                  style: normalBoldForChapter),
            ],
          )),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"hiv_prevention2text5".tr(),
                          style: contentNormal),
                    ]),
                  )),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"hiv_prevention2text6".tr(),
                          style: contentNormal),
                    ]),
                  )),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"hiv_prevention2text7".tr(),
                          style: contentNormal),
                    ]),
                  )),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"hiv_prevention2text8".tr(),
                          style: contentNormal),
                    ]),
                  )),
            ),
          ],
        ),
        ListTile(
          title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text:"hiv_prevention2text9".tr(),
                      style: contentNormal),
                ],
              )),
        ),
      ]);
    }

    Widget _methadoneTherapy() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _methadoneTherapyContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("supportive_therapy".tr(),
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
