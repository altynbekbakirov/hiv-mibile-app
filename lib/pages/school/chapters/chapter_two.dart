import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterTwo extends StatefulWidget {
  const ChapterTwo({Key key, this.chapterTwoCallback}) : super(key: key);

  final Function(double) chapterTwoCallback;

  @override
  _ChapterTwoState createState() => _ChapterTwoState();
}

class _ChapterTwoState extends State<ChapterTwo> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  int showChapterTwoDialog;

  String textAza = "c2_atext1".tr();
  String textNadya ="c2_ntext1".tr();

  @override
  void initState() {
    super.initState();
    showChapterTwoDialog = Prefs.getInt("show_chapter_two_dialog");
    show();
  }

  show() async {
    await Future.delayed(const Duration(seconds: 1), () {
      showChapterTwoDialog == null
          ? Doctor.showDialogFunc(
              context: context,
              text: textAza,
              doctor: Doctors.Azamat,
              fontSize: 18,
            ).then((value) async {
              await Doctor.showInstruction(context);
            })
          : Container();
      Prefs.setInt("show_chapter_two_dialog", 1);
    });
  }

  header(String header) {
    return TextSpan(
      text: '\n$header\n\n',
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize + 6,
          color: Colors.black),
    );
  }

  boldText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: fontSize, color: Colors.black),
    );
  }

  normalText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(fontSize: fontSize, color: Colors.black),
    );
  }

  italicText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(
          fontSize: fontSize, color: Colors.black, fontStyle: FontStyle.italic),
    );
  }

  //region Pages
  /// Страица 1 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c2_1text1".tr()),
                normalText("c2_1text3".tr()),
                boldText("c2_1text4".tr()),
                normalText("c2_1text2".tr()),
                boldText("c2_1text5".tr()),
                normalText("c2_1text6".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/lechenie1.png"),
            RichText(
              text: TextSpan(children: [
                normalText("c2_1text7".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/ДКП.png"),
            SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 2 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page2(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                italicText("c2_2text1".tr()),
                normalText("c2_2text2".tr()),
                boldText("c2_2text3".tr()),
                normalText("c2_2text4".tr()),
                boldText("c2_2text5".tr()),
                normalText("c2_2text6".tr()),
                boldText("c2_2text7".tr()),
                normalText("c2_2text75".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/lechenie3.png"),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                boldText("c2_2text8".tr()),
                normalText(
                    "c2_2text9".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 3 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page3(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText("c2_3text1".tr()),
                boldText("c2_3text2".tr()),
                normalText("c2_3text3".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/truvada.png"),
            RichText(
              text: TextSpan(children: [
                normalText("c2_3text4".tr()),
                boldText("c2_3text5".tr()),
                normalText("c2_3text6".tr()),
                boldText("c2_3text7".tr()),
                normalText("c2_3text8".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 4 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_4text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/lechenie4.png"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                normalText("c2_4text2".tr()),
                boldText("c2_4text3".tr()),
                normalText("c2_4text4".tr()),
                boldText("c2_4text5".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 5 Антиретровирусные препараты
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c2_5text1".tr(),),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            RichText(
              text: TextSpan(children: [
                boldText("c2_5text2".tr(),),
                normalText("c2_5text3".tr(),),
                normalText("c2_5text4".tr(),),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Container(
              color: kGrayishBlue,
              child: Text("c2_5text5".tr(),
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: fontSize,
                    color: CupertinoColors.black),
              ),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 6 Антиретровирусные препараты
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_6text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/atreavirus.png"),
            RichText(
              text: TextSpan(children: [
                normalText("c2_6text2".tr()),
                boldText("c2_6text3".tr()),
                normalText("c2_6text4".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 7 Антиретровирусные препараты
  Widget _page7(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText("c2_7text1".tr()),
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
                          text:"c2_7text2".tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
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
                          text:"c2_7text3".tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
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
                          text:"c2_7text4".tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                normalText("c2_7text5".tr()),
                normalText("c2_7text6".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 8 Антиретровирусные препараты
  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_8text1".tr()),
                boldText("c2_8text2".tr()),
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
                          text:"c2_8text3".tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
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
                          text:"c2_8text4".tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                boldText("c2_8text5".tr()),
                boldText("c2_8text6".tr()),
                boldText("c2_8text7".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 9 Воздействие АРТ на человека с ВИЧ
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c2_9text1".tr()),
                normalText("c2_9text2".tr())
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
                          text:"c2_9text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/2/3.gif'),
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
                          text:"c2_9text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/2/4.gif'),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 10 Воздействие АРТ на человека с ВИЧ
  Widget _page10(BuildContext context) {
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
                          text:"c2_10text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/1/2.gif'),
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
                          text:"c2_10text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/profilactika2.gif'),
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
                          text: "c2_10text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/1/4.gif'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: Text("-"),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:     "c2_10text4".tr(),
                            style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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

  /// Страица 11 Воздействие АРТ на человека с ВИЧ
  Widget _page11(BuildContext context) {
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
                  child: Text("-"),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c2_11text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                  child: Text("-"),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c2_11text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_11text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/2/6.gif'),
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
                          text:"c2_11text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prevent11.png'),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 12 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page12(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c2_12text1".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/ДКП.png"),
            RichText(
              text: TextSpan(children: [
                boldText("c2_12text2".tr())
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
                          text:"c2_12text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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

  /// Страица 13 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page13(BuildContext context) {
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
                          text:"c2_13text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_13text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_13text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_13text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_13text5".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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

  /// Страица 14 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page14(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_14text1".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/lechenie3.png'),
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
                          text:"c2_14text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_14text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_14text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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

  /// Страица 15 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page15(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_15text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/виды-тестов.png'),
            RichText(
              text: TextSpan(children: [
                normalText("c2_15text2".tr()),
                normalText("c2_15text3".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 16 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page16(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c2_16text1".tr(),),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/treatment_image51.png"),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                normalText("c2_16text2".tr(),),
                TextSpan(
                  text:"c2_16text3".tr(),
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                    color: Colors.black,
                  ),
                ),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 17 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page17(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText( "c2_17text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 18 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page18(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_18text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/что следует помнить 8.png'),
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
                          text:"c2_18text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_18text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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

  /// Страица 19 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page19(BuildContext context) {
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
                          text:"c2_19text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_19text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                            normalText("c2_19text3".tr()),
                            boldText("c2_19text4".tr()),
                            normalText("c2_19text5".tr()),
                            boldText("c2_19text6".tr()),
                            normalText("c2_19text7".tr()),
                          ],
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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

  /// Страица 20 Как повысить приверженность к АРТ
  Widget _page20(BuildContext context) {
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
                      text: italicText("c2_20text1".tr()),
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
                      text: italicText("c2_20text2".tr()),
                    ),
                  ),
                ),
              ],
            ),
            // Text("Картинка Книги или скан мобильного приложения",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
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
                      text: italicText("c2_20text3".tr()),
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
                      text: italicText("c2_20text4".tr()),
                    ),
                  ),
                ),
              ],
            ),
            // Text("Картинка телефона, часы",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
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
                      text: italicText("c2_20text5".tr()),
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
                      text: italicText("c2_20text6".tr())
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

  /// Страица 21 Как повысить приверженность к АРТ
  Widget _page21(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            // Text("Картинка Календарь и ручка",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
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
                      text: italicText( "c2_21text1".tr()),
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
                      text: italicText( "c2_21text2".tr()),
                    ),
                  ),
                ),
              ],
            ),
            // Text("Картинка групповая работа",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
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
                      text: italicText( "c2_21text3".tr()),
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
                      text: italicText( "c2_21text4".tr()),
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

  /// Страица 22 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page22(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c2_22text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                normalText("c2_22text2".tr()),
                boldText("c2_22text3".tr()),
                normalText("c2_22text4".tr()),
                boldText("c2_22text5".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 23 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page23(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_23text1".tr())
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
                          text:"c2_23text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_23text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c2_23text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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

  /// Страица 24 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page24(BuildContext context) {
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
                          text:"c2_24text1".tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic)),
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
                          text:"c2_24text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                        italicText(
                          "c2_24text3".tr(),),
                        normalText("c2_24text4".tr(),),
                      ]),
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
                        normalText("c2_24text5".tr(),),
                      ]),
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

  /// Страица 25 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page25(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c2_25text1".tr()),
                normalText("c2_25text2".tr(),
                ),
                normalText("c2_25text3".tr(),
                ),
                boldText("c2_25text4".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
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
  int lastPage = 24;

  void getChapterInt() {
    setState(() {
      showChapterTwoDialog = Prefs.getInt("show_chapter_two_dialog");
    });
  }

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          getChapterInt();
          if (value == lastPage && showChapterTwoDialog == 1){
            setState(() {
              Prefs.setInt("show_chapter_two_dialog", 2);
            });
            await Doctor.showDialogFunc(
              context: context,
              text: textNadya,
              doctor: Doctors.Nadezhda,
              fontSize: 18,
            );
          }
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterTwoCallback((value + 1) * 100 / pages.length);
        },
        children: pages,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      _page1(context),
      _page2(context),
      _page3(context),
      _page4(context),
      _page5(context),
      _page6(context),
      _page7(context),
      _page8(context),
      _page9(context),
      _page10(context),
      _page11(context),
      _page12(context),
      _page13(context),
      _page14(context),
      _page15(context),
      _page16(context),
      _page17(context),
      _page18(context),
      _page19(context),
      _page20(context),
      _page21(context),
      _page22(context),
      _page23(context),
      _page24(context),
      _page25(context),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
          onTap: () {
            Navigator.of(context).pop();
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
        title: Text(
          '${'hiv_infection_treatment'.tr()}',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
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
}
