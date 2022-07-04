import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../doctors_component.dart';

class ChapterThree extends StatefulWidget {
  const ChapterThree({Key key, this.chapterThreeCallback}) : super(key: key);

  final Function(double) chapterThreeCallback;

  @override
  _ChapterThreeState createState() => _ChapterThreeState();
}

class _ChapterThreeState extends State<ChapterThree> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;
  int showChapterThreeDialog;

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

  @override
  initState() {
    super.initState();
    showChapterThreeDialog = Prefs.getInt("show_chapter_three_dialog");
    show();
  }

  String text = "c3_text1".tr();

  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        showChapterThreeDialog == null ? Doctor.showDialogFunc(
          context: context,
          text: text,
          doctor: Doctors.Nadezhda,
          fontSize: 20,
        ).then((value) async {
          await Doctor.showInstruction(context);
        }) : Container();
        Prefs.setInt("show_chapter_three_dialog", 1);
      }
    );
  }

  //region Pages
  /// Страница 1 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header( "c3_1text1".tr()),
                boldText( "c3_1text2".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text( "c3_1text3".tr(), style: TextStyle(color: Colors.red, fontSize: fontSize)),
                      SizedBox(height: 20),
                      Text( "c3_1text4".tr(), style: TextStyle(color: kDarkModerateBlue, fontSize: fontSize)),
                      SizedBox(height: 20),
                      Text( "c3_1text5".tr(), style: TextStyle(color: kModerateBlue, fontSize: fontSize)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text( "c3_1text6".tr(), style: TextStyle(color: Colors.orange, fontSize: fontSize)),
                      SizedBox(height: 20),
                      Text( "c3_1text7".tr(), style: TextStyle(color: Colors.deepPurple, fontSize: fontSize)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/beremennost1.png'),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                normalText( "c3_1text8".tr()),
                boldText( "c3_1text9".tr()),
                normalText( "c3_1text10".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/prophylaxis/1/3.gif'),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 2 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page2(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText("c3_2text1".tr()),
               ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/beremennost3.gif"),
            RichText(
              text: TextSpan(children: [
                boldText("c3_2text2".tr()),
                normalText("c3_2text3".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c3_2text4".tr(),
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
                          text:"c3_2text5".tr(),
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
  /// Страница 3 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page3(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:"c3_3text1".tr(),
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                boldText("c3_3text2".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страница 4 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c3_4text1".tr()),
               ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/profilactika1.png'),
            RichText(
              text: TextSpan(children: [
                boldText("c3_4text2".tr()),
                normalText("c3_4text3".tr()),
                normalText("c3_4text4".tr()),
                boldText("c3_4text5".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/profilactika2.gif'),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 5 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText("c3_5text1".tr()),
                boldText("c3_5text2".tr()),
                normalText("c3_5text3".tr()),
                boldText("c3_5text4".tr()),], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/beremennost4.gif"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                italicText("c3_5text5".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 6 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText("c3_6text1".tr()),
                italicText("c3_6text2".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/beremennost5.gif"),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text:"c3_6text3".tr(),
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "c3_6text4".tr(),
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text:"c3_6text5".tr(),
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text:"c3_6text6".tr(),
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text:"c3_6text7".tr(),
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 7 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page7(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header(
                    "c3_7text1".tr()),
                normalText(
                    "c3_7text2".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/nabludenie1.png"),
            RichText(
              text: TextSpan(children: [
                normalText("c3_7text3".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/nabludenie2.png"),
            RichText(
              text: TextSpan(children: [
                normalText("c3_7text4".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/beremennost5.gif"),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страница 8 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText("c3_8text1".tr()),
                boldText("c3_8text2".tr()),
                normalText("c3_8text3".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страница 9 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text:"c3_9text1".tr(),
                  style: TextStyle(
                      color: kDesaturatedBlue,
                      fontSize: fontSize,
                      fontStyle: FontStyle.italic),
                )
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Container(
              color: kGrayishBlue,
              child: Text("c3_9text2".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
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

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterThreeCallback((value + 1) * 100 / pages.length);
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
        title: Text('hiv_transmission_to_child'.tr(),
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
