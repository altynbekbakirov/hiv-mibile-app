import 'package:hiv/components/bottom_slider.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterFour extends StatefulWidget {
  const ChapterFour({Key key, this.chapterFourCallback}) : super(key: key);

  final Function(double) chapterFourCallback;

  @override
  _ChapterFourState createState() => _ChapterFourState();
}

class _ChapterFourState extends State<ChapterFour> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;
  int showChapterFourDialog;

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
  void initState() {
    super.initState();
    showChapterFourDialog = Prefs.getInt("show_chapter_four_dialog");
    show();
  }

  String textAza = "c4_text1".tr();
  String textNadya = "c4_text1".tr();

  show() async {
    await Future.delayed(const Duration(seconds: 1), () {
      showChapterFourDialog == null ?
      Doctor.showDialogFunc(
        context: context,
        text: textAza,
        doctor: Doctors.Azamat,
        fontSize: 20,
      ).then((value) async {
        await Doctor.showInstruction(context);
      }) : Container();
      Prefs.setInt("show_chapter_four_dialog", 1);
    });
  }

  //region Pages
  /// Страница 1 Оппортунистические инфекции (ОИ)
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c4_1text1".tr()),
                normalText("c4_1text2".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/oportunisticheskie1.png"),
            RichText(
              text: TextSpan(children: [
                normalText("c4_1text3".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            RichText(
              text: TextSpan(children: [
                normalText("c4_1text4".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 2 Оппортунистические инфекции (ОИ)
  Widget _page2(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c4_2text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/oportunisticheskie2.png"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                normalText("c4_2text2".tr()),
                normalText("c4_2text3".tr()),
                normalText("c4_2text4".tr()),
                normalText("c4_2text5".tr()),
                normalText("c4_2text6".tr()),
                normalText("c4_2text7".tr()),
                normalText("c4_2text8".tr()),
                normalText("c4_2text9".tr()),
                normalText("c4_2text10".tr()),
                normalText("c4_2text11".tr()),
                normalText("c4_2text12".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 3 Оппортунистические инфекции (ОИ)
  Widget _page3(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c4_3text1".tr()),
                normalText("c4_3text2".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 4 Оппортунистические инфекции (ОИ)
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c4_4text1".tr()),
                normalText("c4_4text2".tr()),
                normalText("c4_4text3".tr()),
                normalText("c4_4text4".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 5 Оппортунистические инфекции (ОИ)
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c4_5text1".tr()),
                normalText("c4_5text2".tr()),
                normalText("c4_5text3".tr()),
                normalText("c4_5text4".tr()),
                normalText("c4_5text5".tr()),
                normalText("c4_5text6".tr()),
                normalText("c4_5text7".tr()),
                normalText("c4_5text8".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/prava2.png"),
            RichText(
              text: TextSpan(children: [
                boldText("c4_5text9".tr()),
                normalText("c4_5text10".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 6 Туберкулез у людей с ВИЧ
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("c4_6text1".tr()),
                boldText("c4_6text2".tr()),
                normalText("c4_6text3".tr()),
                boldText("c4_6text4".tr()),
                normalText("c4_6text5".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 7 Туберкулез у людей с ВИЧ
  Widget _page7(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c4_7text1".tr()),
                normalText("c4_7text2".tr()),
                normalText("c4_7text3".tr()
                ),
                normalText("c4_7text4".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 8 Туберкулез у людей с ВИЧ
  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c4_8text1".tr()),
                normalText("c4_8text2".tr()),
                TextSpan(
                  text: "c4_8text3".tr(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                normalText("c4_8text4".tr()),
                normalText("c4_8text5".tr()),
                normalText("c4_8text6".tr()),
                boldText("c4_8text7".tr()),
                normalText("c4_8text8".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 9 Что такое вирусные гепатиты?
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c4_9text1".tr()),
                normalText("c4_9text2".tr()),
                normalText("c4_9text3".tr()),
                normalText("c4_9text4".tr()),
                normalText("c4_9text5".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 10 Что такое вирусные гепатиты?
  Widget _page10(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("c4_10text1".tr()),
                normalText("c4_10text2".tr()),
                normalText("c4_10text3".tr()),
                italicText("c4_10text4".tr()),
                boldText("c4_10text5".tr()),
                normalText("c4_10text6".tr()),
                normalText("c4_10text7".tr())
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/prophylaxis/1/6.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 11 Что такое вирусные гепатиты?
  Widget _page11(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText("c4_11text1".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/prophylaxis/1/3.gif"),
            RichText(
              text: TextSpan(children: [
                normalText("c4_11text2".tr()),
                normalText("c4_11text3".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/prophylaxis/1/8.gif"),
            RichText(
              text: TextSpan(children: [
                normalText("c4_11text4".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/prophylaxis/2/2.gif"),
            RichText(
              text: TextSpan(children: [
                boldText("c4_11text5".tr()),
                normalText("c4_11text6".tr()),
                boldText("c4_11text7".tr()),
                normalText("c4_11text8".tr()),
                normalText("c4_11text9".tr()),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 12 Что такое вирусные гепатиты?
  Widget _page12(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText( "c4_12text1".tr()),
                normalText("c4_12text2".tr()),
                normalText("c4_12text3".tr()),
                normalText("c4_12text4".tr()),
                normalText("c4_12text5".tr()),
                normalText("c4_12text6".tr()),
              ], style: TextStyle(fontSize: fontSize)),
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

  int lastPage = 11;

  void getChapterInt() {
    setState(() {
      showChapterFourDialog = Prefs.getInt("show_chapter_four_dialog");
    });
  }

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          getChapterInt();
          if (value == lastPage && showChapterFourDialog == 1){
            setState(() {
              Prefs.setInt("show_chapter_four_dialog", 2);
            });
            await Doctor.showDialogFunc(
              context: context,
              text: textNadya,
              doctor: Doctors.Nadezhda,
              fontSize: 14,
            );
          }
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterFourCallback((value + 1) * 100 / pages.length);
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
        title: Text('opportunistic_infections'.tr(),
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
