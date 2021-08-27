import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/components/number_bullet.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterOne extends StatefulWidget {
  const ChapterOne({Key key, this.chapterOneCallback}) : super(key: key);

  final Function(double) chapterOneCallback;

  @override
  _ChapterOneState createState() => _ChapterOneState();
}

class _ChapterOneState extends State<ChapterOne>
    with AutomaticKeepAliveClientMixin {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  int showDialogs;

  //region Pages
  /// Страниа 1
  Widget _page1(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'ЧТО ДЕЛАТЬ, ЕСЛИ У ВАС ВЫЯВИЛИ ВИЧ\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize + 6,
                        color: Colors.black)),
                TextSpan(
                  text:
                      'Сегодня ВИЧ-инфекция, это хроническое инфекционное заболевание. '
                      'Современное лечение, которое назначит врач, Вы получаете бесплатно. '
                      'Лечение не дает вирусу размножаться в организме; оно сохранит Ваше здоровье и '
                      'обеспечит долгую счастливую жизнь, как и у человека без ВИЧ.\n',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ], style: TextStyle(fontSize: fontSize)),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "Следует успокоиться и получить больше информации о ВИЧ-инфекции, которую Вы найдете "
                            "в этом приложении. Вы можете почитать или прослушать запись книги "
                            "«Позитивная жизнь». Вы также получите нужную информацию у врача.",
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 2
  Widget _page2(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "В этом приложении Вы найдете адреса НПО или групп поддержки людей, которые живут с "
                            "ВИЧ (их называют люди, живущие с ВИЧ – сокращенно ЛЖВ). Они могут дать Вам "
                            "информацию о ВИЧ и оказать помощь на этапе принятия статуса и начала лечения. "
                            "О группах поддержки Вы сможете также узнать у Вашего врача.",
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "Вам нужно будет сообщить о своем статусе своим половым партнерам и принять меры, чтобы не передать им ВИЧ.",
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "Нужно определить людей, которым Вы доверяете, чтобы поделиться с ними информацией и получить поддержку.",
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 3
  Widget _page3(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "Вы можете еще не чувствовать проявлений ВИЧ-инфекции, но ВИЧ находится в организме и "
                            "медленно уничтожает клетки иммунной (защитной) системы. Поэтому нужно как можно "
                            "скорее начать лечение, чтобы защитить себя от ВИЧ. ",
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Встаньте на учет в Центре СПИД или другой медицинской организации (ЦСМ, ГСВ); "
                                "пройдите необходимое обследование и начните лечение ВИЧ-инфекции. ",
                            style: style,
                          ),
                          TextSpan(
                            text:
                                "Чем раньше Вы начнете лечение, тем меньший вред ВИЧ окажет Вашему здоровью. ",
                            style: TextStyle(
                                fontSize: fontSize,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "При раннем начале и правильно проводимом лечении (строгое соблюдение дозы препарата, "
                            "непрерывности лечения) у ВИЧ-позитивных людей иммунная система не разрушается, "
                            "поэтому СПИД не развивается. ",
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 4
  Widget _page4(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "Получите информацию какие меры профилактики для собственной защиты и защиты близких нужно использовать.",
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        text:
                            "При необходимости Вы можете включиться в профилактические программы для того, "
                            "чтобы защитить себя от инфекций, которые передаются половым или инъекционным путем. "
                            "Это особенно важно, если Вы потребляете наркотики, имеете случайные половые контакты"
                            " или вступаете в контакты с людьми одного с Вами пола. ",
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 5 Что такое ВИЧ и СПИД
  Widget _page5(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'ЧТО ТАКОЕ ВИЧ и СПИД?\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize + 6,
                        color: Colors.black)),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/hiv_.png"),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'ВИЧ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                      color: Colors.black),
                ),
                TextSpan(
                  text: ' – это вирус иммунодефицита человека:\n',
                  style: style,
                ),
              ], style: TextStyle(fontSize: fontSize)),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "В",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize)),
                          TextSpan(
                            text:
                                "ирус – это мельчайший возбудитель инфекционных заболеваний;",
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "И",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize)),
                          TextSpan(
                            text:
                                "ммунодефицит – означает, что вирус разрушает иммунную систему и создает условия «дефицита» "
                                "(слабости, недостатка) в борьбе организма против инфекционных заболеваний;",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 6 Что такое ВИЧ и СПИД
  Widget _page6(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Ч",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize)),
                          TextSpan(
                            text:
                                "еловека – означает то, что данный вирус поражает только человека.",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text:
                      'ВИЧ относится к семейству «ретровирусов», поэтому противовирусные лекарства, '
                      'назначаемые для лечения ВИЧ-инфекции, называются ',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black),
                ),
                TextSpan(
                  text: 'антиретровирусными препаратами, '
                      'а лечение называется антиретровирусная терапия (АРТ). \n',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: fontSize,
                  ),
                ),
              ], style: TextStyle(fontSize: fontSize)),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "ВИЧ (вирус) ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize)),
                          TextSpan(
                            text:
                                "вызывает у людей заболевание, которое называют ВИЧ-инфекция. ",
                          ),
                          TextSpan(
                              text: "ВИЧ-инфекция.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize)),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "ВИЧ-инфекция – ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize)),
                          TextSpan(
                            text:
                                "может протекать долго, но вирус постоянно разрушает иммунную"
                                " систему и поэтому проявления болезни меняются – от отсутствия каких-либо "
                                "проявлений до тяжелого иммунодефицита. Эти этапы называют ",
                          ),
                          TextSpan(
                              text: "стадии ВИЧ-инфекции.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize)),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 7 Что такое ВИЧ и СПИД
  Widget _page7(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'ВИЧ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: ' поражает',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: ' лимфоциты ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text:
                                ' – клетки иммунной системы. Лимфоциты играют важную роль '
                                'в защите организма человека от разных заболеваний. Если не проводится лечение, '
                                'то ВИЧ разрушает так много таких клеток, что они не уже не могут защищать организм '
                                'и развивается ',
                            style: style,
                          ),
                          TextSpan(
                            text: 'СПИД.',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'СПИД ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        TextSpan(
                          text: '– С',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'индром ',
                          style: style,
                        ),
                        TextSpan(
                          text: 'П',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'риобретённого',
                          style: style,
                        ),
                        TextSpan(
                          text: ' И',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'ммунодефицита',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                        TextSpan(
                          text: '– это конечная стадия '
                              'ВИЧ-инфекции, которая наступает при тяжелом поражении иммунитета. '
                              'СПИД сопровождается развитием тяжелых инфекционных или онкологических заболеваний. '
                              'Если ВИЧ поражает головной мозг – наступает слабоумие. ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                      ], style: TextStyle(fontSize: fontSize)),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Людей, которые инфицированы ВИЧ, называют ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              'ЛЖВ – люди, которые живут с ВИЧ, или ВИЧ-позитивные люди.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ], style: TextStyle(fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 8 Что такое ВИЧ и СПИД
  Widget _page8(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'При раннем начале и правильно проводимом лечении ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        ' (строгое соблюдение дозы препарата, непрерывности лечения) антиретровирусными '
                        'препаратами у ВИЧ-позитивных людей иммунная система не разрушается, поэтому СПИД '
                        'не развивается.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\n\nТаким образом, Вы знаете, что:',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nВИЧ - ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'это вирус',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nВИЧ-инфекция ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: '- это заболевание, а',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nСПИД ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        '– это только часть ВИЧ-инфекции (мы говорим – стадия).\n',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'СПИД никогда не наступит, если человек получает ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'лечение.',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                      text: '\n\nЧТО ТАКОЕ ИММУНИТЕТ?\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize + 6,
                          color: Colors.black)),
                  TextSpan(
                    text: 'Иммунитет ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        'отвечает за защиту организма от всего чужого – как от чужеродных агентов '
                        '(микробов, вирусов), так и от собственных измененных клеток организма. '
                        'Это позволяет сохранить целостность организма.  ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 9 ЧТО ТАКОЕ ИММУНИТЕТ?
  Widget _page9(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Иммунитет обеспечивают органы и клетки, которые образуют ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'иммунную систему ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'организма. Ее еще называют ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'защитной системой. ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Основным органом иммунной системы является ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'тимус ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'или ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'вилочковая железа. ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        'Основные клетки иммунной защиты находятся в крови и костном мозге, в других органах, '
                        'например, в печени.\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        'Различают несколько видов иммунных клеток, одними из них являются ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Т-лимфоциты ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        'помощники (хелперы), которые организуют слаженную работу всей '
                        'иммунной системы. Их называют ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: ''
                        'СД4 ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'клетками.\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        'Человека окружает множество микроорганизмов (вирусы, бактерии, грибки), '
                        'которые при попадании в организм могут стать причиной инфекционных заболеваний '
                        '(грипп, менингит, туберкулез, дизентерия и т. п.). ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 10 ЧТО ТАКОЕ ИММУНИТЕТ?
  Widget _page10(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Иммунная система в большинстве случаев уничтожает микроорганизмы, попадающие в '
                        'человеческий организм, защищая его от болезней. Однако, ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        'ВИЧ – вирус иммунодефицита человека – разрушает основные клетки иммунитета '
                        '(СД4 клетки). В результате наступает иммунодефицит и организм становится '
                        'беззащитным перед другими инфекциями.',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ],
                style: style,
              ),
            ),
            Image.asset("assets/images/human_organs.png"),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 11 ЧТО ТАКОЕ ИММУНИТЕТ?
  Widget _page11(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/leukocytes.png"),
            Container(
              margin: EdgeInsets.only(top: 20),
              color: kGrayishBlue,
              child: Text(
                'Состояние иммунной системы инфицированного ВИЧ человека определяется подсчетом '
                'CД4 клеток. Их количество в крови составляет в норме от 500 до 1500 клеток в 1 микролитре. '
                'Когда у человека, живущего с ВИЧ, выявляется одна или несколько оппортунистических инфекций '
                'и уровень СД4 клеток снижается ниже 200 в 1 микролитре крови, то говорят о наступлении '
                'стадии СПИДа.',
                style: TextStyle(
                  fontSize: fontSize,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 12 Как ВИЧ передается
  Widget _page12(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/sd4.png"),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '\n\nКак вирус попадает в организм человека\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize + 6,
                          color: Colors.black)),
                  TextSpan(
                    text:
                        'Спасибо, что остаетесь на связи с нами.  В этом разделе содержится важная'
                        ' информация, которая поможет определить собственные риски заражения ВИЧ и как '
                        'этого можно избежать.\n',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: 'ВИЧ - ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text:
                        'это вирус иммунодефицита человека. Это означает, что им болеет только человек и вирус '
                        'передается от человека к человеку.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\n\nСуществует только 3 пути передачи ВИЧ:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Половой путь",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Инъекционный",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 13 Как вирус попадает в организм человека
  Widget _page13(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "От ВИЧ-позитивной матери ребенку во время беременности, родов и при кормлении грудью.",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/family.png"),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Половой путь: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                " ВИЧ передается при всех видах сексуальных контактов. Особенно опасны анальные "
                                "половые контакты; частая смена половых партнеров; случайные половые контакты;"
                                " насильственный и групповой секс. Увеличивают риск инфицирования ВИЧ инфекций,"
                                " которые передаются половым путем (сифилис, гонорея и др.). ",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// Страниа 14 Как вирус попадает в организм человека
  Widget _page14(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Снижает риск инфицирования ВИЧ: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text:
                        ' Воздержание от половых контактов; верность одному неинфицированному партнеру; '
                        'использование презервативов и специальных смазок на водной основе (лубрикантов).',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/injection.png"),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Инъекционый путь передачи ВИЧ возможен: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                " при совместном употреблении наркотиков путем инъекций; получении медицинских услуг "
                                "у случайных лиц (переливание крови; хирургические операции; инъекции; лечение у "
                                "табибов, сопровождающееся повреждением кожи – насечки; кровопускание; обрезание);"
                                " при проведении татуировок, пирсинга, иглоукалывания нестерильным инструментом. ",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  /// Страниа 15 Как вирус попадает в организм человека
  Widget _page15(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Снижает риск ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text:
                        'отказ от употребления наркотиков, использование индивидуального шприца и посуды '
                        'для приготовления наркотиков; получение медицинских услуг только в медицинских '
                        'учреждениях; использование стерильного инструментария при проведении татуировок, '
                        'пирсинга и других процедур вне организаций здравоохранения. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/pregnant.png"),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "От ВИЧ-позитивной матери – ребенку. ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                ". Своевременное выявление ВИЧ-инфекции и лечение ВИЧ-инфекции снижает риск передачи ВИЧ ребенку. ",
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  /// Страниа 16 Как вирус попадает в организм человека
  Widget _page16(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Предлагаем Вам получить консультацию по оценке и снижению риска у консультантов НПО или в медицинском центре. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nВы можете сами определить риски инфицирования. Для этого ответьте на следующие несколько '
                        'вопросов. Если хотя бы по одному вопросу Вы ответили «да», то Вам нужно пройти '
                        'консультирование и тестирование на ВИЧ, а также предпринять меры по собственной '
                        'безопасности:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Были ли у Вас сексуальные отношения?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Всегда ли Вы использовали презерватив при сексуальных контактах?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Было ли у Вас более одного полового партнера?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Были ли у Вас или Вашего полового партнера язвы на половых органах, "
                                "необычные выделения из половых органов, боли внизу живота, либо проходили "
                                "ли Вы лечение инфекций, которые передаются половым путем (сифилис, гонорея, "
                                "трихомониаз)?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страниа 17 Как вирус попадает в организм человека
  Widget _page17(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Принимали ли вы когда-либо наркотики путем инъекций, хотя бы раз?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Принимали ли Вы наркотики совместно с Вашим партнером /партнерами?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Болели ли Вы гепатитом?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\n\nСТАДИИ И ПРОЯВЛЕНИЯ ВИЧ-ИНФЕКЦИИ\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize + 6,
                    ),
                  ),
                  TextSpan(
                    text:
                        'В зависимости от выраженности иммунодефицита, ВИЧ-инфекцию разделяют на стадии, '
                        'ориентируясь на число лимфоцитов CД4, а также на проявления инфекции, которая '
                        'начинается с отсутствия проявлений и развивается до тяжелого иммунодефицита '
                        '(стадия СПИДа). ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
  /// Страниа 18 Как вирус попадает в организм человека
  Widget _page18(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Различают 4 стадии ВИЧ-инфекции, при этом 3 и 4 стадии характеризуются существенным '
                        'снижением иммунитета. Их еще называют ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'продвинутыми стадиями ВИЧ-инфекции. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '3-я стадия наступает при количестве СД4 клеток от 200 до 350 клеток. Когда количество '
                        'СД4 клеток снижается менее 200 говорят о 4 стадии или СПИДе. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nПрактически невозможно определить, когда произошло заражение, за исключением случаев, '
                        'когда был единичный сексуальный контакт либо единичное совместное потребление '
                        'наркотиков с ЛЖВ.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nОсобенностью ВИЧ-инфекции является длительное скрытое течение - ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Первая стадия ВИЧ-инфекции',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' может длиться годами. По внешнему виду невозможно определить '
                        'наличие у человека ВИЧ. Человек с ВИЧ может выглядеть и чувствовать себя здоровым, '
                        'но в тоже время передавать ВИЧ другим. Кроме того, ВИЧ с момента попадания в организм, '
                        'постоянно разрушает клетки иммунной системы. Поскольку ВИЧ в организме можно определить '
                        'только лабораторными методами, человек обращается за медицинской '
                        'помощью в продвинутой стадии ВИЧ-инфекции иногда уже с тяжелым поражением иммунной системы.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страниа 19 СТАДИИ И ПРОЯВЛЕНИЯ ВИЧ-ИНФЕКЦИИ
  Widget _page19(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'На ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Второй стадии ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        'может наблюдаться потеря веса (до 10%), частые заболевания и другие проявления ВИЧ-инфекции; '
                        'наблюдается повышение температуры тела, утомляемость, повышенная потливость',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/schema.png'),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Дальнейшее развитие ВИЧ-инфекции связано с тяжелым поражением иммунитета ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '(3 и 4 стадии). ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Проявления и течение на этих стадиях обусловлено действием оппортунистических инфекций '
                        '(ОИ) – которые обычно не встречаются у людей без ВИЧ; а также частыми инфекционными '
                        'заболеваниями, опухолями, может развиться слабоумие. Наиболее частыми ОИ является '
                        'туберкулез и пневмоцистная пневмония. При 4 стадии наступает кахексия (полное истощение) '
                        'и без лечения наступает смерть. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 20 СТАДИИ И ПРОЯВЛЕНИЯ ВИЧ-ИНФЕКЦИИ
  Widget _page20(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Раннее начало лечения может остановить и даже вернуть на более ранние стадии '
                        'заболевания. Однако часто люди поступают на стадии СПИДа иногда при полном '
                        'отсутствии иммунитета, когда лечение уже не может помочь. Это могут быть люди, '
                        'которые не знают о своем статусе, но есть и те, кто, зная свой статус, отказываются '
                        'от лечения.\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        'В настоящее время люди, живущие с ВИЧ, не должны умирать от СПИДа и '
                        'оппортунистических инфекций. Для этого нужно как можно раньше начинать лечение'
                        ' ВИЧ-инфекции. Лечение предоставляется государством бесплатно.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 21 ЧТО ПРОИСХОДИТ, КОГДА ВИЧ ПОПАДАЕТ В ОРГАНИЗМ ЧЕЛОВЕКА?
  Widget _page21(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '\nЧТО ПРОИСХОДИТ, КОГДА ВИЧ ПОПАДАЕТ В ОРГАНИЗМ ЧЕЛОВЕКА?\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize + 6,
                    ),
                  ),
                  TextSpan(
                    text: 'ВИЧ-инфекция ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '– это хроническое инфекционное заболевание, вызываемое вирусом иммунодефицита'
                        ' человека (ВИЧ), протекающее с поражением иммунной системы. При отсутствии лечения '
                        'ВИЧ-инфекция приводит к появлению инфекционных заболеваний, опухолей и к развитию '
                        'синдрома приобретённого иммунного дефицита (СПИД). ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nКогда ВИЧ попадает в организм человека, он атакует клетки иммунной системы, '
                        'а именно, Т-лимфоциты помощники (CД4 клетки). В результате пораженная клетка '
                        'начинает сама производить вирусы. В результате клетка не может защищать организм '
                        'и погибает. До 10 миллиардов новых вирусных частиц вырабатываются в день и миллионы '
                        'CД4 клеток разрушаются ежедневно. Новые вирусы выходят из клетки и поражают другие '
                        'СД-4 клетки. Уменьшение числа CД4 клеток приводит к снижению иммунитета, который '
                        'уже не может защищать организм от возбудителей инфекционных и других заболеваний, '
                        'которые редко наблюдаются у лиц с сильной иммунной системой. Их называют '
                        'СПИД-индикаторными заболеваниями или ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'оппортунистическими инфекциями. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 22 ЧТО ПРОИСХОДИТ, КОГДА ВИЧ ПОПАДАЕТ В ОРГАНИЗМ ЧЕЛОВЕКА?
  Widget _page22(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/размножение.png"),
            Text('Механизм размножения ВИЧ'),
            SizedBox(height: 20),
            Container(
              color: kGrayishBlue,
              child: Text(
                'Состояние иммунной системы инфицированного ВИЧ человека определяется подсчетом '
                'CД4 клеток. Их количество в крови составляет в норме от 500 до 1500 клеток в '
                '1 микролитре. Когда у человека, живущего с ВИЧ, выявляется одна или несколько '
                'оппортунистических инфекций и уровень СД4 клеток снижается ниже 200 в 1 микролитре '
                'крови, то говорят о наступлении стадии СПИДа.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: fontSize,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/развитие_заболевания.png'),
            SizedBox(height: 10),
            Image.asset('assets/images/развитие_заболевания2.png'),
            SizedBox(height: 10),
            Image.asset('assets/images/развитие_заболевания3.png'),
            SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 23 Как ВИЧ-не передается
  Widget _page23(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\n\nКак ВИЧ-не передается\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize + 6,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Для каждого из нас важно знать, как ВИЧ не передается, чтобы перестать бояться '
                        'того, что не опасно, а снижать риск там, где опасно; уметь обезопасить себя '
                        'и окружающих. Помните, что ВИЧ передается только тремя путями (посмотрите этот раздел).',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '\n\nВИЧ не передается\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            Image.asset("assets/images/hello.png"),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'При объятии, рукопожатии, поцелуе При кашле и чихании',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: fontSize,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страниа 24 Как ВИЧ-не передается
  Widget _page24(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'При объятии, рукопожатии, поцелуе При кашле и чихании',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: fontSize,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/cooking.png'),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'При приготовлении и принятии пищи; при пользовании общей посудой, столовыми приборами, '
                        'полотенцами и постельным бельем. При общении пользовании книгами, бытовыми приборами',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: fontSize,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 10),
            // Image.asset('assets/images/using_bathroom.png'),
            // SizedBox(height: 10),
            // Image.asset('assets/images/развитие_заболевания2.png'),
            // SizedBox(height: 10),
            // Image.asset('assets/images/развитие_заболевания3.png'),
            // SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 25 Как ВИЧ-не передается
  Widget _page25(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset('assets/images/using_bathroom.png'),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'При пользовании туалетом, душем, ванной; при плавании в бассейне, при занятиях спортом',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: fontSize,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 26 Как ВИЧ-не передается
  Widget _page26(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset('assets/images/mosquito.png'),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'При укусах насекомых (комаров, москитов, пчел). При общении и укусах животных',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: fontSize,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nЧеловек, живущий с ВИЧ не опасен в быту. Вы можете общаться, '
                        'проживать в одной комнате, учиться в одном классе, одной группе; '
                        'сидеть за одним столом; ходить в клубы, в кафе, на дискотеки, вместе отдыхать. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 27 Что делать, если мне сообщили о положительном ВИЧ-статусе?
  Widget _page27(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Нужно подумать о том, что могло привести к заражению ВИЧ, и сделать свой "
                                "собственный выбор – продолжить жизнь, как она есть, или изменить ее к лучшему. ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Нужно подумать и принять ответственное решение в отношении своей семейной жизни."
                                " Наличие ВИЧ-инфекции не означает прекращение сексуальной жизни, не ограничивает"
                                " возможности создания семьи и рождения здоровых детей. Важно помнить о риске "
                                "заражения полового партнера и вашего новорожденного ребенка. Вам поможет обсуждение"
                                " ВИЧ-статуса с половым партнером. Раннее начало АРТ, неопределяемая вирусная "
                                "нагрузка, использование средств защиты (презерватив) позволят предотвратить "
                                "передачу ВИЧ половому партнеру, а также планировать беременность и рождение "
                                "здоровых детей.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 28 Что делать, если мне сообщили о положительном ВИЧ-статусе?
  Widget _page28(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Раскрытие близкому человеку/половому партнеру своего ВИЧ-статуса поможет "
                                "Вам справиться со стрессом и получить поддержку от близких Вам лиц.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Благодаря Антиретровирусной терапии (АРТ) люди с ВИЧ могут прожить долгую "
                                "и плодотворную жизнь, и для этого нужно:",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "принимать АРТ постоянно, соблюдая рекомендации лечащего врача;",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "при наличии других заболеваний, таких как туберкулез, потребление алкоголя или наркотиков, "
                                "обратиться к специалистам для получения соответствующего лечения, наряду с АРТ; ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "при необходимости, пройти вакцинацию для предупреждения таких инфекций, "
                                "как грипп, КОВИД, вирусный гепатит (по назначению врача);",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "отказаться от курения либо существенно ограничить количество сигарет;",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 29 Что делать, если мне сообщили о положительном ВИЧ-статусе?
  Widget _page29(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "при потреблении наркотиков начать поддерживающую терапию метадоном. ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "хорошее питание, употребление безопасной питьевой воды;",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "правильно организовать свой распорядок дня, чередовать работу, отдых и физическую активность.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
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
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Помнить, что любая инфекция для человека с ВИЧ значительно опаснее, "
                                "чем для человека без ВИЧ, поэтому следует строго следовать мерам профилактики "
                                "инфекционных заболеваний, поскольку не только Вы можете инфицировать своих "
                                "партнеров, но и  сами получить дополнительную инфекцию.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страниа 30 Что делать, если мне сообщили о положительном ВИЧ-статусе?
  Widget _page30(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: NumberBullet(text: '6')),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Следует помнить, что ЛЖВ может повторно заразиться другой разновидностью ВИЧ, "
                                "что создает большую угрозу его здоровью.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: NumberBullet(text: '7')),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Люди, с которыми Вы имели половые контакты или использовали общие шприцы, "
                                "также могут быть инфицированы ВИЧ и не знать об этом. Им нужно предложить"
                                " пройти тестирование на ВИЧ, чтобы своевременно начать лечение, сохранить"
                                " здоровье и жизнь. ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  //endregion

  @override
  void initState() {
    super.initState();
    showDialogs = Prefs.getInt("show_dialogs");
    show();
  }

  String drNadezhda = 'Здравствуйте!\nя – доктор Надежда';
  String drAzamat = 'Здравствуйте!\nя – доктор Азамат';
  String firstDialog =
      "Сегодня мы поговорим с Вами о ВИЧ и СПИДе. Мы расскажем о том, что такое ВИЧ и СПИД, как ВИЧ передается, почему важно тестирование на ВИЧ и что нужно делать, когда тест на ВИЧ оказывается\n положительным.";
  String lastDialog =
      "Первые случаи ВИЧ-инфекции в Кыргызстане среди иностранцев были выявлены в 1987 году, "
      "а среди граждан Кыргызской Республики первый случай был выявлен в 1996 году. "
      "На 1 января 2017 года в Кыргызстане выявлено 7117 людей с ВИЧ. По оценкам, в "
      "стране проживает 8307 ЛЖВ, то есть многие люди с ВИЧеще не прошли тестирование на ВИЧ и не знают "
      "о своем статусе.";

  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => showDialogs == null
          ? Doctor.showDialogFunc(
              context: context,
              text: drNadezhda,
              doctor: Doctors.Nadezhda,
              fontSize: 20,
            )
          : Container(),
    ).then((value) async {
      showDialogs == null
          ? await Doctor.showDialogFunc(
              context: context,
              text: drAzamat,
              doctor: Doctors.Azamat,
              fontSize: 20,
            )
          : Container();

      await Doctor.showDialogFunc(
        context: context,
        text: firstDialog,
        doctor: Doctors.Nadezhda,
        fontSize: 20,
      );
      Prefs.setInt('show_dialogs', 1);
    });
  }

  Widget _appBar() {
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

  double currentPage = 0;

  int hivStagesPage = 29;

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          if (value == hivStagesPage) {
            await Doctor.showDialogFunc(
              context: context,
              text: lastDialog,
              doctor: Doctors.Azamat,
              fontSize: 16,
            );
          }
          setState(() {
            this.currentPage = value.toDouble();
          });
          widget.chapterOneCallback((value + 1) * 100 / pages.length);
        },
        children: pages,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    TextStyle normal = TextStyle(
        fontWeight: FontWeight.w400, color: Colors.black, fontSize: fontSize);
    //region Pages
    var pages = [
      _page1(context, normal),
      _page2(context, normal),
      _page3(context, normal),
      _page4(context, normal),
      _page5(context, normal),
      _page6(context, normal),
      _page7(context, normal),
      _page8(context, normal),
      _page9(context, normal),
      _page10(context, normal),
      _page11(context, normal),
      _page12(context, normal),
      _page13(context, normal),
      _page14(context, normal),
      _page15(context, normal),
      _page16(context, normal),
      _page17(context, normal),
      _page18(context, normal),
      _page19(context, normal),
      _page20(context, normal),
      _page21(context, normal),
      _page22(context, normal),
      _page23(context, normal),
      _page24(context, normal),
      _page25(context, normal),
      _page26(context, normal),
      _page27(context, normal),
      _page28(context, normal),
      _page29(context, normal),
      _page30(context, normal),
    ];
    //endregion
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          InkWell(
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
        title: Text('hiv_aids'.tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: Container(
        child: Stack(
          children: [
            _chapters(context, pages),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.transparent,
                  ),
                ),
                GestureDetector(
                  onTap: () => pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            BottomSlider(
              currentPage: currentPage + 1,
              maxPage: pages.length,
              currentPageCallback: (value) {
                pageController.jumpToPage(value.toInt());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
