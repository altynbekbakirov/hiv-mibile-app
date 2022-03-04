import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

/// Страница "Самотестирование на ВИЧ"
class HIVSelfTestScreen extends StatefulWidget {
  @override
  _HIVSelfTestScreenState createState() => _HIVSelfTestScreenState();
}

class _HIVSelfTestScreenState extends State<HIVSelfTestScreen> {
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
        fontWeight: FontWeight.w600);

    Widget _hivSelfTestingContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "hiv_selftest1".tr(), style: chapterStyle),
              TextSpan(text: "hiv_selftest2".tr(), style: TextStyle(color: Colors.black, fontSize: fontSize + 6, fontWeight: FontWeight.bold)),
              TextSpan(text: "hiv_selftest3".tr(), style: normalBold),
              TextSpan(
                text:"hiv_selftest4".tr(),
                style: contentNormal,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"hiv_selftest5".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                text: "hiv_selftest6".tr(),
                style: contentNormal),
              TextSpan(
                  text: "hiv_selftest7".tr(),
                  style: normalBold),
              TextSpan(
                  text: "hiv_selftest8".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_selftest9".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest10".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_selftest11".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest12".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_selftest13".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest14".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_selftest15".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest16".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text:"hiv_selftest17".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
        Image.asset("assets/images/gradusnik.png"),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "hiv_selftest18".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_selftest19".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest20".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_selftest21".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest22".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_selftest23".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest24".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_selftest25".tr(),
                  style: contentItalic),
            ]),
          ),
        ),
      ]);
    }

    Widget _hivSelfTesting() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivSelfTestingContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hiv_self_test".tr(),
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
      body: _hivSelfTesting(),
    );
  }
}
