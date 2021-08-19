import 'package:HIVApp/components/number_bullet.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HivActionsScreen extends StatefulWidget {
  @override
  _HivActionsScreenState createState() => _HivActionsScreenState();
}

class _HivActionsScreenState extends State<HivActionsScreen> {
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
        fontWeight: FontWeight.w600);

    TextStyle contentItalic = TextStyle(
        color: Colors.black, fontSize: fontSize, fontStyle: FontStyle.italic);

    TextStyle contentNormal =
        TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w600);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w600);

    Widget _hivActionsContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Что делать, если у Вас выявили ВИЧ\n\n",
                  style: chapterStyle),
              TextSpan(
                text:
                    "Сегодня ВИЧ-инфекция, это хроническое инфекционное заболевание, "
                    "при получении лечения которого человек может сохранить здоровье и "
                    "прожить долгую жизнь, как и человек без ВИЧ.",
                style: normalBold,
              ),
            ]),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: NumberBullet(text: "1"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          "Следует успокоиться и получить больше информации о ВИЧ-инфекции, которую Вы найдете в этом "
                              "приложении в разделе «Школа пациента». Вы можете получить эту же информацию у врача или "
                              "сотрудников НПО.",
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
              child: NumberBullet(text: "2"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "Врач может подсказать Вам адреса НПО или групп поддержки людей, которые живут с ВИЧ (их называют ЛЖВ). "
                              "Они могут дать Вам информацию о ВИЧ и оказать помощь на этапе принятия статуса и начала лечения.",
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
              child: NumberBullet(text: "3"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "Вам нужно сообщить о своем статусе своим половым партнерам и принять меры, чтобы не передать им ВИЧ.",
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
              child: NumberBullet(text: "4"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "Нужно определить людей, которым Вы доверяете, чтобы поделиться с ними информацией и получить поддержку.",
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
              child: NumberBullet(text: "5"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "Вы можете еще не чувствовать какие-то проявления ВИЧ-инфекции, но ВИЧ находится в организме и "
                              "медленно уничтожает клетки иммунной (защитной) системы. Поэтому нужно как можно скорее начать"
                              " защищаться себя от ВИЧ.",
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
              child: NumberBullet(text: "6"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "Встаньте на учет в Центре СПИД или другой медицинской организации (ЦСМ, ГСВ); "
                              "пройдите необходимое обследование и начните лечение ВИЧ-инфекции. "
                              "Чем раньше Вы начнете лечение, тем меньший вред ВИЧ окажет на Ваше здоровье.",
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
              child: NumberBullet(text: "7"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "При раннем начале и правильно проводимом лечении (строгое соблюдение дозы препарата, непрерывности"
                              " лечения) антиретровирусными препаратами у ВИЧ-позитивных людей иммунная система не разрушается,"
                              " поэтому СПИД не развивается, не присоединятся также и оппортунистические инфекции.",
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
              child: NumberBullet(text: "8"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "Получите информацию какие меры профилактики для собственной защиты и защиты близких нужно использовать.",
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
              child: NumberBullet(text: "9"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                          "При необходимости Вы можете включиться в профилактические программы для того, чтобы защитить "
                              "себя от инфекций, которые передаются половым или инъекционным путем. Это особенно важно, "
                              "если Вы потребляете наркотики, имеете случайные половые контакты или вступаете в контакты "
                              "с людьми одного с Вами пола.",
                          style: contentNormal),
                    ]),
                  )),
            ),
          ],
        ),
      ]);
    }

    Widget _hivActions() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivActionsContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("actions_when_you_have_hiv".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
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
      body: _hivActions(),
    );
  }
}
