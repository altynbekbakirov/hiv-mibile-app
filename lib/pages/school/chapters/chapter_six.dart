import 'package:hiv/components/bottom_slider.dart';
import 'package:hiv/components/bullet.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterSix extends StatefulWidget {
  const ChapterSix({Key key, this.chapterSixCallback}) : super(key: key);

  final Function(double) chapterSixCallback;

  @override
  _ChapterSixState createState() => _ChapterSixState();
}

class _ChapterSixState extends State<ChapterSix> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;
  int showChapterSixDialog;

  String first =
  "c6_text1".tr();
  String second ="c6_text2".tr();

  @override
  void initState() {
    super.initState();
    showChapterSixDialog = Prefs.getInt("show_chapter_six_dialog");
    show();
  }

  show() async {
    await Future.delayed(const Duration(seconds: 1), () {
      showChapterSixDialog == null
          ? Doctor.showDialogFunc(
              context: context,
              text: first,
              doctor: Doctors.Nadezhda,
              fontSize: 20,
            ).then((value) async {
              await Doctor.showInstruction(context);
            })
          : Container();
      Prefs.setInt("show_chapter_six_dialog", 1);
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

  //region Pages
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  header("c6_1text1".tr()),
                  normalText("c6_1text2".tr()),
                  italicText("c6_1text3".tr()),
                ],
              ),
            ),
            Image.asset("assets/images/prava1.png"),
            RichText(
              text: TextSpan(
                children: [
                  boldText("c6_1text4".tr()),
                  normalText("c6_1text5".tr()),
                  boldText("c6_1text6".tr()),
                  boldText("c6_1text7".tr()),
                  TextSpan(
                      text: "c6_1text8".tr(),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600)),
                  boldText("c6_1text9".tr()),
                ],
              ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    boldText("c6_2text1".tr()),
                  ],
                ),
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
                          text:"c6_2text2".tr(),
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
                          text:"c6_2text3".tr(),
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
                        text:"c6_2text4".tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600),
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
                        text:"c6_2text5".tr(),
                        style:
                            TextStyle(color: Colors.black, fontSize: fontSize),
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
                        "c6_2text6".tr(),
                        style:
                            TextStyle(color: Colors.black, fontSize: fontSize),
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
                          text:"c6_3text1".tr(),
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
                          text:"c6_3text2".tr(),
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
                        text:"c6_3text3".tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prava2.png"),
            RichText(
              text: TextSpan(
                children: [
                  italicText("c6_3text4".tr()),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header("c6_4text1".tr()),
                    normalText("c6_4text2".tr(),
                    ),
                    normalText(
                      "c6_4text3".tr(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  ///ОТВЕТСТВЕННОСТЬ и ОГРАНИЧЕНИЯ, ПРЕДУСМОТРЕННЫЕ ЗАКОНОМ
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header( "c6_5text1".tr()),
                    normalText( "c6_5text2".tr(),),
                    boldText( "c6_5text3".tr(),),
                    normalText( "c6_5text4".tr(),),
                    boldText( "c6_5text5".tr()),
                    normalText( "c6_5text6".tr()),
                    boldText( "c6_5text7".tr()),
                    normalText(
                        "c6_5text8".tr()),
                  ],
                ),
              ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    boldText("c6_6text1".tr()),
                    normalText("c6_6text2".tr(),
                    ),
                    boldText("c6_6text3".tr(),
                    ),
                    normalText("c6_6text4".tr()),
                    boldText("c6_6text5".tr()),
                    normalText("c6_6text6".tr()),
                    normalText("c6_6text7".tr()),
                    boldText("c6_6text8".tr()),
                    normalText(
                        "c6_6text9".tr()),
                  ],
                ),
              ),
            ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    boldItalicText("c6_7text1".tr()),
                    normalText("c6_7text2".tr(),
                    ),
                    boldText("c6_7text3".tr()),
                    normalText("c6_7text4".tr()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    boldText("c6_8text1".tr()),
                    normalText(
                        "c6_8text2".tr()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  ///Социальная защита детей, живущих с ВИЧ (Ст. 12 закона о ВИЧ/СПИДе)
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header("c6_9text1".tr()),
                    normalText("c6_9text2".tr(),
                    ),
                    normalText("c6_9text3".tr()),
                    normalText(
                      "c6_9text4".tr(),
                    ),
                  ],
                ),
              ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    normalText("c6_10text1".tr()),
                    normalText("c6_10text2".tr()),
                    normalText(
                        "c6_10text3".tr()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _page11(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header("c6_11text1".tr()),
                    boldText("c6_11text2".tr()),
                    normalText("c6_11text3".tr()),
                    boldText("c6_11text4".tr()),
                    normalText("c6_11text5".tr()),
                    boldText("c6_11text6".tr()),
                    normalText("c6_11text7".tr()),
                    boldText("c6_11text8".tr()),
                    normalText("c6_11text85".tr()),
                    boldText("c6_11text9".tr()),
                  ],
                ),
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
                          text:"c6_11text10".tr(),
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
                          text: "c6_11text11".tr(),
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

  Widget _page12(BuildContext context) {
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
                          text:"c6_12text1".tr(),
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
                          text:"c6_12text2".tr(),
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
                          text:"c6_12text3".tr(),
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
                          text:"c6_12text4".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  normalText("c6_12text5".tr()),
                  boldText("c6_12text6".tr()),
                  normalText("c6_12text65".tr()),
                  boldText("c6_12text7".tr()),
                  normalText("c6_12text8".tr()),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _page13(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  boldText("c6_13text1".tr()),
                  normalText("c6_13text2".tr()),
                  boldText("c6_13text3".tr()),
                ],
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
                          text:"c6_13text4".tr(),
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
                          text:"c6_13text5".tr(),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text: "c6_13text6".tr(),
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
                          text: "c6_13text7".tr(),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c6_13text8".tr(),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text: "c6_13text9".tr(),
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

  Widget _page14(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  header("c6_14text1".tr()),
                  boldText("c6_14text2".tr()),
                  italicText("c6_14text3".tr()),
                ],
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
                        text: italicText("c6_14text4".tr())),
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
                        text: italicText("c6_14text5".tr())),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  italicText("c6_14text6".tr()),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _page15(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  normalText("c6_15text1".tr()),
                  boldText("c6_15text2".tr()),
                  normalText("c6_15text3".tr()),
                  boldText("c6_15text4".tr()),
                  normalText("c6_15text5".tr()
                      ),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _page16(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  boldText("c6_16text1".tr()),
                  normalText("c6_16text2".tr()),
                  normalText("c6_16text3".tr()),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _page17(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  boldText("c6_17text1".tr()),
                  normalText("c6_17text2".tr()),
                  normalText("c6_17text3".tr()),
                  normalText("c6_17text4".tr()),
                ],
              ),
            ),
            SizedBox(height: 90),
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

  int lastPage = 16;

  void getChapterInt() {
    setState(() {
      showChapterSixDialog = Prefs.getInt("show_chapter_six_dialog");
    });
  }

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          getChapterInt();
          if (value == lastPage && showChapterSixDialog == 1){
            setState(() {
              Prefs.setInt("show_chapter_six_dialog", 2);
            });
            await Doctor.showDialogFunc(
              context: context,
              text: second,
              doctor: Doctors.Azamat,
              fontSize: 18,
            );
          }
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterSixCallback((value + 1) * 100 / pages.length);
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
        title: Text('human_rights'.tr(), style: TextStyle(color: Colors.black)),
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
