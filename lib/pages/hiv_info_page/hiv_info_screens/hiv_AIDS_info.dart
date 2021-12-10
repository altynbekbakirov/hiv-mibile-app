import 'package:HIVApp/components/bullet.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HivAIDSInfoScreen extends StatefulWidget {
  @override
  _HivAIDSInfoScreenState createState() => _HivAIDSInfoScreenState();
}

class _HivAIDSInfoScreenState extends State<HivAIDSInfoScreen> {
  double fontSize = 18;
  bool showSlider = false;

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
        color: Colors.black, fontSize: fontSize + 6, fontWeight: FontWeight.w700);

    Widget _hivAIDSContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "ЧТО ТАКОЕ ВИЧ и СПИД?\n\n", style: chapterStyle),
              TextSpan(
                text: "Дорогой друг, подруга. Нам легко понимать друг друга, "
                    "когда мы говорим на одном языке. Поэтому мы начинаем с повторения "
                    "основных названий, с которыми Вы будете встречаться в каждой теме "
                    "этого приложения. Вы хорошо знаете эти слова – но предлагаем проверить "
                    "себя - правильно ли Вы их понимаете.\n",
                style: contentItalic,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "ВИЧ",
                style: normalBold,
              ),
              TextSpan(
                children: [
                  TextSpan(text: " – это "),
                  TextSpan(text: "В", style: normalBold),
                  TextSpan(text: "ирус ", style: contentNormal),
                  TextSpan(text: "И", style: normalBold),
                  TextSpan(text: "ммунодефицита ", style: contentNormal),
                  TextSpan(text: "Ч", style: normalBold),
                  TextSpan(text: "еловека:\n", style: contentNormal),
                ],
                style: contentNormal,
              ),
            ]),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MyBullet(),
            )),
            Expanded(
              flex: 3,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "В", style: normalBold),
                  TextSpan(
                      text:
                          "ирус – это мельчайший возбудитель инфекционных заболеваний;",
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
              flex: 3,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "И", style: normalBold),
                  TextSpan(
                      text:
                          'ммунодефицит – означает, что вирус разрушает иммунную систему и '
                          'создает условия «дефицита» (слабости, недостатка) в борьбе '
                          'организма против инфекционных заболеваний;',
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
              flex: 3,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Ч',
                    style: normalBold,
                  ),
                  TextSpan(
                      text:
                          'еловека – означает то, что данный вирус поражает только человека.',
                      style: contentNormal)
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
              flex: 3,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'ВИЧ ',
                        style: normalBold,
                      ),
                      TextSpan(
                          text:
                          'вызывает у людей ',
                          style: contentNormal),
                      TextSpan(
                        text: 'заболевание, ',
                        style: normalBold,
                      ),
                      TextSpan(
                          text:
                          'которое называют ',
                          style: contentNormal),
                      TextSpan(
                        text: 'ВИЧ-инфекция; ',
                        style: normalBold,
                      ),
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
              flex: 3,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'СПИД - ',
                        style: normalBold,
                      ),
                      TextSpan(
                          text:
                          'С',
                          style: normalBold),
                      TextSpan(
                        text: 'индром ',
                        style: contentNormal,
                      ),
                      TextSpan(
                          text:
                          'П',
                          style: normalBold),
                      TextSpan(
                        text: 'риобретённого ',
                        style: contentNormal,
                      ),
                      TextSpan(
                        text: 'И',
                        style: normalBold,
                      ),
                      TextSpan(
                        text: 'ммуно',
                        style: contentNormal,
                      ),
                      TextSpan(
                        text: 'д',
                        style: normalBold,
                      ),
                      TextSpan(
                        text: 'ефицита – это конечная стадия ВИЧ-инфекции,'
                        " которая наступает при тяжелом поражении иммунитета. СПИД сопровождается развитием "
                            "тяжелых инфекционных или онкологических заболеваний. Если ВИЧ поражает головной мозг "
                            "– наступает слабоумие. ",
                        style: contentNormal,
                      ),
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
              flex: 3,
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Людей, которые инфицированы ВИЧ, называют ',
                        style: contentNormal
                      ),
                      TextSpan(
                        text: 'ЛЖВ – люди, которые живут с ВИЧ, или ВИЧ-позитивные люди.',
                        style: normalBold
                      )
                    ]
                  ),
                )
              ),
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
              flex: 3,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: "ВИЧ поражает лимфоциты – клетки иммунной системы. Лимфоциты играют важную роль в защите "
                                  "организма человека от разных заболеваний. Если не проводится лечение, то ВИЧ разрушает "
                                  "так много таких клеток, что они не уже не могут защищать организм. Поэтому у человека с "
                                  "ослабленным иммунитетом, развиваются инфекционные или онкологические заболевания. ",
                              style: contentNormal
                          ),
                        ]
                    ),
                  )
              ),
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
              flex: 3,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'При раннем начале и правильно проводимом лечении ',
                              style: normalBold
                          ),
                          TextSpan(
                              text: "(строгое соблюдение дозы препарата, непрерывности "
                                  "лечения) у ВИЧ-позитивных людей иммунная система не разрушается, поэтому сопутствующие заболевания "
                                  "и СПИД не развиваются. Такой человек чувствует себя здоровым и может жить также долго, как и человек без ВИЧ.\n",
                              style: contentNormal
                          ),
                        ]
                    ),
                  )
              ),
            ),
          ],
        ),
      ]);
    }

    Widget _hivAIDS() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivAIDSContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("what_is_hiv_and_AIDS".tr(), style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
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
      body: _hivAIDS(),
    );
  }
}
