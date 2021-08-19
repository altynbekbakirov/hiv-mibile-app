import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

/// Страница "Тестирование на ВИЧ"
class HIVTestingScreen extends StatefulWidget {
  @override
  _HIVTestingScreenState createState() => _HIVTestingScreenState();
}

class _HIVTestingScreenState extends State<HIVTestingScreen> {
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
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w700);

    TextStyle linkedStyle = TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontSize: fontSize);

    Widget _hivTestingContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Тестирование на ВИЧ\n\n", style: chapterStyle),
              TextSpan(
                text:
                    "Тестирование на ВИЧ – это простая процедура, которую важно проходить каждому человеку. "
                    "Многие никогда не проходили тест на ВИЧ из-за незнания. Некоторые думает, что это их не касается,"
                    "или боятся тестирования. Почему важно знать свой ВИЧ статус, Вы узнаете на этой страничке.  \n",
                style: contentItalic,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Для чего нужно пройти тест на ВИЧ?\n\n",
                  style: normalBoldForChapter),
            ]),
          ),
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
                      text:
                          "Если человек знает, что он инфицирован ВИЧ, он может своевременно начать лечение, "
                          "которое сохраняет здоровье и позволяет людям, живущим с ВИЧ, дожить до глубокой старости."
                          "Лечение ВИЧ-инфекции проводится бесплатно и его можно получить во всех городах и селах Кыргызской Республики",
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
                      text:
                          "Если человек знает, что он инфицирован ВИЧ, он будет предпринимать меры предосторожности, "
                          "чтобы не передать ВИЧ своему половому партнеру и/или своему будущему ребенку.",
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
                      text: "Если человек знает, что он ",
                      style: contentNormal),
                  TextSpan(text: "не инфицирован ВИЧ, ", style: normalBold),
                  TextSpan(
                      text:
                          "он успокоится, но всегда будет использовать меры защиты от ВИЧ.",
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Как проводится тест на ВИЧ?\n\n",
                  style: normalBoldForChapter),
            ]),
          ),
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
                      text:
                          "Определить наличие в организме ВИЧ можно только при помощи лабораторного обследования, "
                          "которое называется тестированием на ВИЧ или тест на ВИЧ.",
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
                      text: "Тестирование на ВИЧ проводится добровольно, "
                          "то есть никто не вправе заставить человека пройти тест на ВИЧ без его согласия.",
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
                      text: "Обращение за тестированием и его результаты ",
                      style: contentNormal),
                  TextSpan(
                      text: "являются медицинской тайной ", style: normalBold),
                  TextSpan(
                      text:
                          "и не могут разглашаться другим лицам без согласия ЛЖВ. Это называется ",
                      style: contentNormal),
                  TextSpan(text: "конфиденциальность. ", style: normalBold),
                  TextSpan(
                      text:
                          "Они могут использоваться только медицинскими работниками, которые проводят наблюдение за ЛЖВ.. ",
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
                      text: "Тестирование на ВИЧ можно пройти в ",
                      style: contentNormal),
                  TextSpan(text: "Центрах СПИД ", style: linkedStyle),
                  TextSpan(text: "и ", style: contentNormal),
                  TextSpan(
                      text: "любой медицинской организации. ",
                      style: linkedStyle),
                  TextSpan(
                      text: "Тестирование на ВИЧ можно пройти в некоторых НПО.",
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
                  title: Column(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Самотестирование на ВИЧ ", style: normalBold),
                      TextSpan(
                          text:
                              "– \nВы можете сделать тест на ВИЧ самостоятельно. Детальную информацию об этом "
                              "Вы можете найти на сайте Республиканского центра СПИД по ссылке: "
                              "",
                          style: contentNormal),
                      TextSpan(
                        text: "www.aidscenter.kg. ",
                        style: linkedStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {launch("http://aidscenter.kg/")},
                      ),
                      TextSpan(
                          text:
                              "Эти тесты Вы можете получить бесплатно с понедельника по пятницу по адресу: г. Бишкек, "
                              "улица Логвиненко 8, 7-8-9 кабинет. Телефон для справок: 0774 42-08-66.",
                          style: contentNormal),
                    ]),
                  ),
                ],
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
                      text:
                          "Для тестирования на ВИЧ, обычно берут кровь из вены; но может использоваться кровь из пальца. "
                          "В НПО тестирование проходят по слюне.",
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
                      text:
                          "Проведение анализа занимает от 30 минут до суток, в зависимости от используемого метода.",
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
                      text:
                          "Если первый тест указывает на наличие в организме ВИЧ (то есть результат теста на ВИЧ положительный), "
                          "то его перепроверяют не менее 3 раз, чтобы не ошибиться. Человеку сообщают только полностью подтвержденный результат. "
                          "Иногда тест на ВИЧ дает неопределенный (сомнительный) результат – тогда Вам предложат пройти тест повторно через 14 дней. "
                          "Это может быть связано с недавним заражением ВИЧ либо с другими причинами.",
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
                      text:
                          "Каждое тестирование на ВИЧ сопровождается беседой с врачом /социальным работником, "
                          "которая называется консультированием. При консультировании определяют возможные риски заражения, "
                          "дают рекомендации по безопасному поведению, предоставляют адреса профилактических программ, "
                          "а также рассказывают о процедуре тестирования.",
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        SizedBox(height: 10),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                      "Следует помнить, что результаты тестов, проведенных на базе НПО или при самотестировании на ВИЧ "
                      "являются предварительными и требуют обязательного подтверждения в медицинских организациях."
                      "Человек, у которого впервые обнаружена ВИЧ-инфекция, может получить поддержку от своих близких или представителей НПО.",
                  style: TextStyle(color: kModerateBlue, fontSize: fontSize)),
            ]),
          ),
        ),
      ]);
    }

    Widget _hivTesting() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivTestingContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hiv_testing".tr(),
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
      body: _hivTesting(),
    );
  }
}
