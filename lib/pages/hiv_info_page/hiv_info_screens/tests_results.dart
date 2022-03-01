import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Страница "Результы тестов"
class TestResultScreen extends StatefulWidget {
  @override
  _TestResultScreenState createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
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
        fontWeight: FontWeight.w600);

    TextStyle contentItalic = TextStyle(
        color: Colors.black, fontSize: fontSize, fontStyle: FontStyle.italic);

    TextStyle contentNormal =
    TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w600);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w600);

    Widget _testResultContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text:"hiv_test_result1".tr(), style: chapterStyle),
              TextSpan(
                text:"hiv_test_result2".tr(),
                style: contentNormal,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "hiv_test_result3".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text:"hiv_test_result4".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text:"hiv_test_result5".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_test_result6".tr(),
                  style: normalBold),
              TextSpan(
                  text:"hiv_test_result7".tr(),
                  style: contentNormal),

              TextSpan(
                  text: "hiv_test_result8".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text:"hiv_test_result9".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_test_result10".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_test_result11".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_test_result12".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_test_result13".tr(),
                  style: contentNormal),
              TextSpan(
                  text: "hiv_test_result14".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text:"hiv_test_result15".tr(),
                  style: contentNormal),
              TextSpan(
                  text:"hiv_test_result16".tr(),
                  style: normalBoldForChapter),
              TextSpan(
                  text: "hiv_test_result17".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
      ]);
    }

    Widget _result() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _testResultContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("test_results".tr(),
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
      body: _result(),
    );
  }
}
