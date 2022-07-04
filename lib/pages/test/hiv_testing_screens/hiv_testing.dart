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
              TextSpan(text:"hiv_test1text1".tr(), style: chapterStyle),
              TextSpan(
                text:"hiv_test1text2".tr(),
                style: contentItalic,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"hiv_test1text3".tr(),
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
                      text:"hiv_test1text4".tr(),
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
                      text:"hiv_test1text5".tr(),
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
                      text:"hiv_test1text6".tr(),
                      style: contentNormal),
                  TextSpan(text:"hiv_test1text7".tr(), style: normalBold),
                  TextSpan(
                      text:"hiv_test1text8".tr(),
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
                  text:"hiv_test1text9".tr(),
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
                      text:"hiv_test1text10".tr(),
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
                      text:"hiv_test1text11".tr(),
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
                      text: "hiv_test1text12".tr(),
                      style: contentNormal),
                  TextSpan(
                      text: "hiv_test1text13".tr(), style: normalBold),
                  TextSpan(
                      text:"hiv_test1text14".tr(),
                      style: contentNormal),
                  TextSpan(text:"hiv_test1text15".tr(), style: normalBold),
                  TextSpan(
                      text:"hiv_test1text16".tr(),
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
                      text: "hiv_test1text17".tr(),
                      style: contentNormal),
                  TextSpan(text: "hiv_test1text18".tr(), style: linkedStyle),
                  TextSpan(text: "hiv_test1text19".tr(), style: contentNormal),
                  TextSpan(
                      text:"hiv_test1text20".tr(),
                      style: linkedStyle),
                  TextSpan(
                      text: "hiv_test1text21".tr(),
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
                          text:"hiv_test1text22".tr(), style: normalBold),
                      TextSpan(
                          text:"hiv_test1text23".tr(),
                          style: contentNormal),
                      TextSpan(
                        text: "www.aidscenter.kg. ",
                        style: linkedStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {launch("http://aidscenter.kg/")},
                      ),
                      TextSpan(
                          text:"hiv_test1text24".tr(),
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
                      text:"hiv_test1text25".tr(),
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
                      text:"hiv_test1text26".tr(),
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
                      text:"hiv_test1text27".tr(),
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
                      "hiv_test1text28".tr(),
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
                  text:"hiv_test1text29".tr(),
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
