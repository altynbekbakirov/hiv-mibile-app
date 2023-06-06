import 'package:hiv/components/bottom_slider.dart';
import 'package:hiv/components/bullet.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterSeven extends StatefulWidget {
  const ChapterSeven({Key key, this.chapterSevenCallback}) : super(key: key);

  final Function(double) chapterSevenCallback;

  @override
  _ChapterSevenState createState() => _ChapterSevenState();
}

class _ChapterSevenState extends State<ChapterSeven> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;
  int showChapterSevenDialog;

  header(String header) {
    return TextSpan(
      text: '\n$header\n',
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
  boldItalicText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600),
    );
  }

  @override
  initState() {
    super.initState();
    showChapterSevenDialog = Prefs.getInt("show_chapter_seven_dialog");
    show();
  }

  String drAza = "c7_text1".tr() ;
  String drNadya = "c7_text2".tr();
  String drNadyaText2 = "c7_text3".tr();
  String textAza = "c7_text4".tr();
  String textAza2 = "c7_text5".tr();

  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        showChapterSevenDialog == null ? Doctor.showDialogFunc(
          context: context,
          text: drAza,
          doctor: Doctors.Azamat,
          fontSize: 20,
        ).then((value) async {
          await Doctor.showInstruction(context);
        }) : Container();
        setState(() {
          Prefs.setInt("show_chapter_seven_dialog", 1);
        });
      },
    );
  }

  /// Страница 1 Что следует помнить:
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  header("c7_1text1".tr()),
                ], style: TextStyle(fontSize: fontSize)),
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
                          text:"c7_1text2".tr(),
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
                          text:"c7_1text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 2.png", scale: 7),
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
                          text:"c7_1text4".tr(),
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 60),
                      child: MyBullet(),
                    )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_1text5".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
  Widget _page2(BuildContext context) {
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
                          text:"c7_2text1".tr(),
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
                          text:"c7_2text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 4.png", scale: 7),
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
                          "c7_2text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 5.png", scale: 1),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page3(BuildContext context) {
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
                          text: "c7_3text1".tr(),
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
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_3text2".tr(),
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
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_3text3".tr(),
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
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_3text4".tr(),
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
                          text:"c7_3text5".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 7.png", scale: 5),
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
                          text:"c7_3text6".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 8.png", scale: 5),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///Что делать, если мне сообщили о положительном ВИЧ-статусе?
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  header("c7_4text1".tr()),
                ], style: TextStyle(fontSize: fontSize)),
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
                          text:"c7_4text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c7_4text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/2/2.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page5(BuildContext context) {
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
                          text:"c7_5text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_5text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_5text3".tr(),
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_5text4".tr(),
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_5text5".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_6text1".tr(),
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_6text2".tr(),
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c7_6text3".tr(),
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
                          text:"c7_6text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
  Widget _page7(BuildContext context) {
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
                          text:"c7_7text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/2/6.gif"),
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
                          text:"c7_7text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/7.gif"),
            RichText(
              text: TextSpan(children: [
                header("c7_7text3".tr()),
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
                          text:"c7_7text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/6.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///Преимущества раскрытия ВИЧ-статуса своим близким
  Widget _page8(BuildContext context) {
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
                          text:"c7_8text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c7_8text2".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
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
                          text:"c7_8text3".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/11.gif"),
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
                          text:"c7_8text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/2.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///Означает ли диагноз ВИЧ - инфекции,
  /// что в Вашей жизни что-то должно измениться?
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c7_9text1".tr()),
                boldText("c7_9text2".tr()),
                normalText("c7_9text3".tr()),
                boldText("c7_9text4".tr()),
                normalText("c7_9text5".tr()),
                boldText("c7_9text6".tr()),
                normalText("c7_9text7".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page10(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c7_10text1".tr()),
                normalText("c7_10text2".tr()),
                boldText("c7_10text3".tr()),
                normalText("c7_10text4".tr()),
                boldText("c7_10text5".tr()),
                normalText("c7_10text6".tr()),
                boldText("c7_10text7".tr()),
                normalText("c7_10text8".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
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

  void getChapterInt() {
    setState(() {
      showChapterSevenDialog = Prefs.getInt("show_chapter_seven_dialog");
    });
  }

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          getChapterInt();
          if (value == 10 && showChapterSevenDialog == 1){
            setState(() {
              Prefs.setInt("show_chapter_seven_dialog", 2);
            });
            await Doctor.showDialogFunc(
              context: context,
              text: drNadya,
              doctor: Doctors.Nadezhda,
              fontSize: 16,
            ).then((value) async {
              await Doctor.showDialogFunc(
                context: context,
                text: drNadyaText2,
                doctor: Doctors.Nadezhda,
                fontSize: 16,
              );
              await Doctor.showDialogFunc(
                context: context,
                text: textAza,
                doctor: Doctors.Azamat,
                fontSize: 18,
              );
              await Doctor.showDialogFunc(
                context: context,
                text: textAza2,
                doctor: Doctors.Azamat,
                fontSize: 18,
              );
            });
          }
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterSevenCallback((value + 1) * 100 / pages.length);
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
      // _page11(context),
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
        title: Text('how_to_live'.tr(),
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
                // pageController.jumpToPage(value.toInt());
              },
            ),
          ],
        ),
      ),
    );
  }
}
