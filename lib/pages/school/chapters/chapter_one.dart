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
            Image.asset('assets/images/prophylaxis/2/4.gif'),
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
                    : TextSpan(),
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
                    text: 'Человека окружает множество микроорганизмов (вирусы, бактерии, грибки), '
                        'которые при попадании в организм могут стать причиной инфекционных заболеваний '
                        '(грипп, менингит, туберкулез, дизентерия и т. п.). ',
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
                    text: 'Иммунная система в большинстве случаев уничтожает микроорганизмы, попадающие в '
                        'человеческий организм, защищая его от болезней. Однако, ',
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'ВИЧ – вирус иммунодефицита человека – разрушает основные клетки иммунитета '
                        '(СД4 клетки). В результате наступает иммунодефицит и организм становится '
                        'беззащитным перед другими инфекциями.',
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
                      text: 'Как вирус попадает в организм человека\n\n',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize + 6, color: Colors.black)),
                  TextSpan(
                    text: 'Спасибо, что остаетесь на связи с нами.  В этом разделе содержится важная'
                        ' информация, которая поможет определить собственные риски заражения ВИЧ и как '
                        'этого можно избежать.\n\n',
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: 'ВИЧ - ',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: 'это вирус иммунодефицита человека. Это означает, что им болеет только человек и вирус '
                        'передается от человека к человеку.',
                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
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
            Image.asset("assets/images/что следует помнить 6.png"),
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
                            text: "Половой путь: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: " ВИЧ передается при всех видах сексуальных контактов. Особенно опасны анальные "
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Снижает риск инфицирования ВИЧ: ',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: ' Воздержание от половых контактов; верность одному неинфицированному партнеру; '
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
                            text: "Инъекционый путь передачи ВИЧ возможен: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: " при совместном употреблении наркотиков путем инъекций; получении медицинских услуг "
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Снижает риск ',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: 'отказ от употребления наркотиков, использование индивидуального шприца и посуды '
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
                    text:
                        'Предлагаем Вам получить консультацию по оценке и снижению риска у консультантов НПО или в медицинском центре. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '\nВы можете сами определить риски инфицирования. Для этого ответьте на следующие несколько '
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
                            text: "Всегда ли Вы использовали презерватив при сексуальных контактах?",
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
                            text: "Было ли у Вас более одного полового партнера?",
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
                            text: "Были ли у Вас или Вашего полового партнера язвы на половых органах, "
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
                            text: "Принимали ли вы когда-либо наркотики путем инъекций, хотя бы раз?",
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
                            text: "Принимали ли Вы наркотики совместно с Вашим партнером /партнерами?",
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
                    text: 'В зависимости от выраженности иммунодефицита, ВИЧ-инфекцию разделяют на стадии, '
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
                    text: 'Различают 4 стадии ВИЧ-инфекции, при этом 3 и 4 стадии характеризуются существенным '
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
                    text: '3-я стадия наступает при количестве СД4 клеток от 200 до 350 клеток. Когда количество '
                        'СД4 клеток снижается менее 200 говорят о 4 стадии или СПИДе. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '\nПрактически невозможно определить, когда произошло заражение, за исключением случаев, '
                        'когда был единичный сексуальный контакт либо единичное совместное потребление '
                        'наркотиков с ЛЖВ.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '\nОсобенностью ВИЧ-инфекции является длительное скрытое течение - ',
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
                    text: ' может длиться годами. По внешнему виду невозможно определить '
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
                    text: 'Дальнейшее развитие ВИЧ-инфекции связано с тяжелым поражением иммунитета ',
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
                    text: 'Проявления и течение на этих стадиях обусловлено действием оппортунистических инфекций '
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
                    text: 'Раннее начало лечения может остановить и даже вернуть на более ранние стадии '
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
                    text: 'В настоящее время люди, живущие с ВИЧ, не должны умирать от СПИДа и '
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
                    text: '\nЧТО ПРОИСХОДИТ, КОГДА ВИЧ ПОПАДАЕТ В ОРГАНИЗМ ЧЕЛОВЕКА?\n\n',
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
                    text: '– это хроническое инфекционное заболевание, вызываемое вирусом иммунодефицита'
                        ' человека (ВИЧ), протекающее с поражением иммунной системы. При отсутствии лечения '
                        'ВИЧ-инфекция приводит к появлению инфекционных заболеваний, опухолей и к развитию '
                        'синдрома приобретённого иммунного дефицита (СПИД). ',
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
                    text: '\nКогда ВИЧ попадает в организм человека, он атакует клетки иммунной системы, '
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
            Image.asset("assets/images/mechanism.png"),
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
                    text: '\n\nКак ВИЧ-не передается\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: fontSize + 6,
                    ),
                  ),
                  TextSpan(
                    text: 'Для каждого из нас важно знать, как ВИЧ не передается, чтобы перестать бояться '
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
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'При объятии, рукопожатии, поцелуе При кашле и чихании',
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
                      text: 'При кашле и чихании',
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
                    text: 'При приготовлении и принятии пищи; при пользовании общей посудой, столовыми приборами, '
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
                    text: 'При пользовании туалетом, душем, ванной; при плавании в бассейне, при занятиях спортом',
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
                    text: 'При укусах насекомых (комаров, москитов, пчел). При общении и укусах животных',
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
                    text: '\nЧеловек, живущий с ВИЧ не опасен в быту. Вы можете общаться, '
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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Что делать, если мне сообщили о положительном ВИЧ-статусе?\n",
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
                            text: "Нужно подумать о том, что могло привести к заражению ВИЧ, и сделать свой "
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
                            text: "Нужно подумать и принять ответственное решение в отношении своей семейной жизни."
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
                            text: "Раскрытие близкому человеку/половому партнеру своего ВИЧ-статуса поможет "
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
                            text: "Благодаря Антиретровирусной терапии (АРТ) люди с ВИЧ могут прожить долгую "
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
                            text: "принимать АРТ постоянно, соблюдая рекомендации лечащего врача;",
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
                            text: "при необходимости, пройти вакцинацию для предупреждения таких инфекций, "
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
                            text: "отказаться от курения либо существенно ограничить количество сигарет;",
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
                            text: "при потреблении наркотиков начать поддерживающую терапию метадоном. ",
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
                            text: "хорошее питание, употребление безопасной питьевой воды;",
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
                            text: "Помнить, что любая инфекция для человека с ВИЧ значительно опаснее, "
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
                            text: "Следует помнить, что ЛЖВ может повторно заразиться другой разновидностью ВИЧ, "
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
                            text: "Люди, с которыми Вы имели половые контакты или использовали общие шприцы, "
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
