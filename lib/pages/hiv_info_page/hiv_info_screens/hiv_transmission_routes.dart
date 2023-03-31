import 'package:hiv/components/bullet.dart';
import 'package:hiv/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Страница "Пути Передачи"
class HivTransmissionRoutesScreen extends StatefulWidget {
  @override
  _HivTransmissionRoutesScreenState createState() =>
      _HivTransmissionRoutesScreenState();
}

class _HivTransmissionRoutesScreenState
    extends State<HivTransmissionRoutesScreen> {
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

    Widget _hivTransmissionRoutesContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"hiv_info2text1".tr(),
                  style: chapterStyle),
              TextSpan(
                text:"hiv_info2text2".tr(),
                style: contentItalic,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text:"hiv_info2text3".tr(), style: normalBold),
              TextSpan(
                text:"hiv_info2text4".tr(),
                style: contentNormal,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "hiv_info2text5".tr(),
                  style: normalBoldForChapter),
            ]),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MyBullet(),
            )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(text:"hiv_info2text6".tr(), style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MyBullet(),
            )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(text:"hiv_info2text7".tr(), style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MyBullet(),
            )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:"hiv_info2text8".tr(),
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        SizedBox(height: 20),
        Image.asset('assets/images/image_way1.png'),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "hiv_info2text9".tr(), style: normalBold),
              TextSpan(
                  text: "hiv_info2text10".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"hiv_info2text11".tr(), style: normalBold),
              TextSpan(
                  text:"hiv_info2text12".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        Image.asset('assets/images/image_way2.png'),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"hiv_info2text13".tr(),
                  style: normalBold),
              TextSpan(
                  text:"hiv_info2text14".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "hiv_info2text15".tr(), style: normalBold),
              TextSpan(
                  text:"hiv_info2text16".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        Image.asset('assets/images/image_way3.png'),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"hiv_info2text17".tr(),
                  style: normalBold),
              TextSpan(
                  text:"hiv_info2text18".tr(),
                  style: contentNormal),
            ]),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MyBullet(),
            )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "hiv_info2text19".tr(),
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
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
                      text:"hiv_info2text20".tr(),
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MyBullet(),
            )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:"hiv_info2text21".tr(),
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
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
                      text:"hiv_info2text22".tr(),
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
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
                      text:"hiv_info2text23".tr(),
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
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
                      text:"hiv_info2text24".tr(),
                      style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 23),
              child: MyBullet(),
            )),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "hiv_info2text25".tr(), style: contentNormal),
                ]),
              )),
            ),
          ],
        ),
      ]);
    }

    Widget _hivTransmission() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivTransmissionRoutesContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hiv_transmission_routes".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
            onTap: () {
              Navigator.pop(context, Routes.hiv_info);
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
      body: _hivTransmission(),
    );
  }
}
