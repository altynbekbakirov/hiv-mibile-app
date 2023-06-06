import 'package:hiv/components/bottom_slider.dart';
import 'package:hiv/components/bullet.dart';
import 'package:hiv/components/number_bullet.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterOne extends StatefulWidget {
  const ChapterOne({Key key, this.chapterOneCallback}) : super(key: key);

  final Function(double) chapterOneCallback;

  @override
  _ChapterOneState createState() => _ChapterOneState();
}

class _ChapterOneState extends State<ChapterOne> with AutomaticKeepAliveClientMixin {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  int showDialogs;

  @override
  void initState() {
    super.initState();
    showDialogs = Prefs.getInt("show_dialogs");
    show();
  }

  String drNadezhda = 'drNadezhda_chapter_one';
  String drAzamat = 'drAzamat_chapter_one';
  String firstDialog = "first_dialog_c1";
  String lastDialog = "last_dialog_c2";

  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => showDialogs == null
          ? Doctor.showDialogFunc(
              context: context,
              text: drNadezhda.tr(),
              doctor: Doctors.Nadezhda,
              fontSize: 20,
            )
          : Container(),
    ).then((value) async {
      if (showDialogs == null) {
        await Doctor.showDialogFunc(
          context: context,
          text: drAzamat.tr(),
          doctor: Doctors.Azamat,
          fontSize: 20,
        );

        await Doctor.showDialogFunc(
          context: context,
          text: firstDialog.tr(),
          doctor: Doctors.Nadezhda,
          fontSize: 20,
        );

        await Doctor.showInstruction(context);
      }
      Prefs.setInt('show_dialogs', 1);
    });
  }

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
                    text: 'c1_text'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize + 6, color: Colors.black)),
                TextSpan(
                  text: 'c1_text2'.tr(),
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
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
                        text: "c1_text3".tr(),
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
                        text: "c1_text4".tr(),
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/3/4.gif"),
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
                        text: "c1_text5".tr(),
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/3.gif"),
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
                        text: "c1_text6".tr(),
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/2/6.gif'),
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
                        text: "c1_text7".tr(),
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Image.asset('assets/images/prophylaxis/2/4.gif'),
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
                            text: "c1_text8".tr(),
                            style: style,
                          ),
                          TextSpan(
                            text: "c1_text9".tr(),
                            style: TextStyle(fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/3/2.gif'),
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
                        text: "c1_text10".tr(),
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/3/1.gif'),
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
                        text: "c1_text11".tr(),
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/3/3.gif'),
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
                        text: "c1_text12".tr(),
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/2/5.gif'),
            SizedBox(height: 90),
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
                    text: 'c1_text13'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize + 6, color: Colors.black)),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'ВИЧ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize, color: Colors.black),
                ),
                TextSpan(
                  text: 'c1_text14'.tr(),
                  style: style,
                ),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/hiv_.png"),
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
                          TextSpan(text: "В", style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize)),
                          TextSpan(
                            text: "c1_text15".tr(),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 2.png"),
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
                          TextSpan(text: "И", style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize)),
                          TextSpan(
                            text: "c1_text16".tr(),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/zarazhenie.png"),
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
                          Prefs.getString(Prefs.LANGUAGE) == "ru"
                              ? TextSpan(text: "Ч", style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize))
                              : TextSpan(),
                          TextSpan(
                            text: "c1_text17".tr(),
                          ),
                        ],
                        style: style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/oportunisticheskie1.png"),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'c1_text18'.tr(),
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                ),
                Prefs.getString(Prefs.LANGUAGE) == "ru"
                    ? TextSpan(
                        text: 'антиретровирусными препаратами, '
                            'а лечение называется антиретровирусная терапия (АРТ). \n',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: fontSize,
                        ),
                      )
                    : TextSpan(text: 'антиретровирустук дарылар деп, '
                    'ал эми дарылоо антиретровирустук терапия (АРТ) деп аталат.',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: fontSize,
                  ),),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/lechenie2.png"),
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
                              text: "ВИЧ (вирус) ", style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize)),
                          TextSpan(
                            text: "c1_text19".tr(),
                          ),
                          TextSpan(
                              text: "ВИЧ-инфекция.", style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize)),
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
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize)),
                          TextSpan(
                            text: "c1_text20".tr(),
                          ),
                          Prefs.getString(Prefs.LANGUAGE) == "ru"
                              ? TextSpan(
                                  text: "стадии ВИЧ-инфекции.",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize))
                              : TextSpan(),
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
                Prefs.getString(Prefs.LANGUAGE) == "ru"
                    ? Expanded(
                        flex: 5,
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ВИЧ',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' поражает',
                                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' лимфоциты ',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' – клетки иммунной системы. Лимфоциты играют важную роль '
                                      'в защите организма человека от разных заболеваний. Если не проводится лечение, '
                                      'то ВИЧ разрушает так много таких клеток, что они не уже не могут защищать организм '
                                      'и развивается ',
                                  style: style,
                                ),
                                TextSpan(
                                  text: 'СПИД.',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                              ],
                              style: style,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        flex: 5,
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ВИЧ лимфоциттерди',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                                TextSpan(
                                  text:
                                      ' – иммундук системанын клеткаларын бузат. Лимфоциттер адамдын организмин ар кандай оорулардан коргоодо маанилүү ролду ойнойт. Эгерде адам дарыланбаса, анда ВИЧ ушундай клеткалардын көбүн талкалайт, алар организмди коргой албай жана ',
                                  style: style,
                                ),
                                TextSpan(
                                  text: 'СПИД ',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'өнүгө баштайт.',
                                  style: style,
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
                Prefs.getString(Prefs.LANGUAGE) == 'ru'
                    ? Expanded(
                        flex: 5,
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'СПИД ',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              TextSpan(
                                text: '– С',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'индром ',
                                style: style,
                              ),
                              TextSpan(
                                text: 'П',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'риобретённого',
                                style: style,
                              ),
                              TextSpan(
                                text: ' И',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'ммунодефицита',
                                style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                              ),
                              TextSpan(
                                text: '– это конечная стадия '
                                    'ВИЧ-инфекции, которая наступает при тяжелом поражении иммунитета. '
                                    'СПИД сопровождается развитием тяжелых инфекционных или онкологических заболеваний. '
                                    'Если ВИЧ поражает головной мозг – наступает слабоумие. ',
                                style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                              ),
                            ], style: TextStyle(fontSize: fontSize)),
                          ),
                        ),
                      )
                    : Expanded(
                        flex: 5,
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'СПИД ',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    ' – Алынган Иммундук Жетишсиздик Синдрому - бул ВИЧ-инфекциясынын соңку баскычы болуп саналат, '
                                    'ал иммунитет өтө катуу жабыркаган учурда пайда болот. '
                                    'СПИД оор жугуштуу же онкологиялык оорулардын өнүгүшү менен коштолот. '
                                    'ВИЧ мээни жабыркаткан учурда кем акылдык пайда болот.',
                                style: style,
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
                          text: 'c1_text21'.tr(),
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'c1_text22'.tr(),
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
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
                    text: 'c1_text23'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text24'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/lechenie4.png"),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'c1_text25'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nВИЧ - ',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text26'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nВИЧ-инфекция ',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text27'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nСПИД ',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text28'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  Prefs.getString(Prefs.LANGUAGE) == "ru"
                      ? TextSpan(
                          text: 'СПИД никогда не наступит, если человек получает ',
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                        )
                      : TextSpan(
                          text: 'Эгерде адам дарыланса, анда СПИД баскычына жетпейт',
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                  Prefs.getString(Prefs.LANGUAGE) == "ru"
                      ? TextSpan(
                          text: 'лечение.',
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                        )
                      : TextSpan(),
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
                      text: 'c1_text29'.tr(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize + 6, color: Colors.black)),
                  TextSpan(
                    text: 'Иммунитет ',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text30'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text31'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text32'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text33'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text34'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text35'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text36'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text37'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text38'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text39'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
                style: style,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'c1_text40'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text41'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text:'c1_text42'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text43'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'c1_text44'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
                style: style,
              ),
            ),
            Image.asset("assets/images/Имунная-система-2.png"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'c1_text45'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
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
                    text: "c1_10text1".tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: "c1_10text2".tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ],
                style: style,
              ),
            ),
            Image.asset("assets/images/human_organs.png"),
            SizedBox(height: 90),
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
            Container(
              margin: EdgeInsets.only(top: 20),
              color: kGrayishBlue,
              child: Text("c1_11text1".tr(),
                style: TextStyle(
                  fontSize: fontSize,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Image.asset("assets/images/lek.png"),
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "c1_12text1".tr(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize + 6, color: Colors.black)),
                  TextSpan(
                    text: "c1_12text2".tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "c1_12text3".tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "c1_12text4".tr(),
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: "c1_12text5".tr(),
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
                            text: "c1_12text6".tr(),
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
                            text: "c1_12text7".tr(),
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
                            "c1_12text8".tr(),
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

  /// Страниа 13 Как вирус попадает в организм человека
  Widget _page13(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
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
                            text: "c1_13text1".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:"c1_13text2".tr(),
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
                    text:"c1_13text3".tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "c1_13text4".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            Image.asset("assets/images/sex_way.png"),
            SizedBox(height: 90),
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
                            text: "c1_14text1".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:"c1_14text2".tr(),
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
                    text: "c1_14text3".tr(),
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "c1_14text4".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            Image.asset("assets/images/image_way2.png"),
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
                            text: "c1_15text1".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:"c1_15text2".tr(),
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
            Image.asset("assets/images/pregnant.png"),
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
                    text:"c1_16text1".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_16text2".tr(),
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
                            text: "c1_16text3".tr(),
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
                            text:"c1_16text4".tr(),
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
                            text: "c1_16text5".tr(),
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
                            text: "c1_16text6".tr(),
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
                            text: "c1_17text1".tr(),
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
                            text: "c1_17text2".tr(),
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
                            text: "c1_17text3".tr(),
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
                    text:"c1_17text4".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize + 6,
                    ),
                  ),
                  TextSpan(
                    text:"c1_17text5".tr(),
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
                    text:"c1_18text1".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_18text2".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:"c1_18text3".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_18text4".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_18text5".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_18text6".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_18text7".tr(),
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
                    text: "c1_19text1".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:"c1_19text2".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:"c1_19text3".tr(),
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
                    text: "c1_19text4".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:"c1_19text5".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_19text6".tr(),
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
                    text:"c1_20text1".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_20text2".tr(),
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
                    text: "c1_21text1".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize + 6,
                    ),
                  ),
                  TextSpan(
                    text: "c1_21text2".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:"c1_21text3".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            Image.asset("assets/images/что следует помнить 2.png"),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:"c1_21text4".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_21text5".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_21text6".tr(),
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

  /// Страниа 22 ЧТО ПРОИСХОДИТ, КОГДА ВИЧ ПОПАДАЕТ В ОРГАНИЗМ ЧЕЛОВЕКА?
  Widget _page22(BuildContext context, TextStyle style) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Text("c1_22text1".tr()),
            SizedBox(height: 20),
            Container(
              color: kGrayishBlue,
              child: Text("c1_22text2".tr(),
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: fontSize,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/disease_evolution1.png'),
            SizedBox(height: 10),
            Image.asset('assets/images/disease_evolution.png'),
            SizedBox(height: 10),
            Image.asset('assets/images/disease_evolution2.png'),
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
                    text: "c1_23text1".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize + 6,
                    ),
                  ),
                  TextSpan(
                    text:  "c1_23text2".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "c1_23text3".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
                style: style,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:  "c1_23text4".tr(),
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
            Image.asset("assets/images/hello.png"),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "c1_24text1".tr(),
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
            ),
            Image.asset('assets/images/kashel.png'),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "c1_24text2".tr(),
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
            Image.asset('assets/images/image_way5.png'),
            SizedBox(height: 90),
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "c1_25text1".tr(),
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
            Image.asset('assets/images/image_way6.png'),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "c1_25text2".tr(),
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
            Image.asset('assets/images/image_way7.png'),
            SizedBox(height: 90),
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "c1_26text1".tr(),
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "c1_27text1".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize + 6,
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
                            text: "c1_27text2".tr(),
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
            Image.asset("assets/images/prophylaxis/2/1.gif"),
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
                            text: "c1_27text3".tr(),
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
            Image.asset("assets/images/prophylaxis/1/3.gif"),
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
                            text: "c1_28text1".tr(),
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
            Image.asset("assets/images/prophylaxis/1/4.gif"),
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
                            text: "c1_28text2".tr(),
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
            Image.asset("assets/images/prophylaxis/2/3.gif"),
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
                            text:"c1_28text3".tr(),
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
                            text:"c1_28text4".tr(),
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
                            text:"c1_28text5".tr(),
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
                            text: "c1_28text6".tr(),
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
                            text: "c1_29text1".tr(),
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
                            text: "c1_29text2".tr(),
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
                            text:"c1_29text3".tr(),
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
                            text:"c1_29text4".tr(),
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
                            text: "c1_30text1".tr(),
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
                            text: "c1_30text2".tr(),
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
            Image.asset("assets/images/prophylaxis/1/7.gif"),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  //endregion

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

  void getChapterInt() {
    setState(() {
      showDialogs = Prefs.getInt("show_dialogs");
    });
  }

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          getChapterInt();
          if (value == hivStagesPage && showDialogs == 1) {
            setState(() {
              Prefs.setInt('show_dialogs', 2);
            });
            await Doctor.showDialogFunc(
              context: context,
              text: lastDialog.tr(),
              doctor: Doctors.Azamat,
              fontSize: 16,
            );
          }
          print(showDialogs);
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
    TextStyle normal = TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: fontSize);
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
                child: Text("Aa", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
        title: Text('hiv_aids'.tr(), style: TextStyle(color: Colors.black, fontSize: 18)),
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
                // pageController.jumpToPage(value.toInt());
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
