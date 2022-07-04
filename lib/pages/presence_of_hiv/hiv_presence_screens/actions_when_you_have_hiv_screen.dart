import 'package:HIVApp/components/number_bullet.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HivActionsScreen extends StatefulWidget {
  @override
  _HivActionsScreenState createState() => _HivActionsScreenState();
}

class _HivActionsScreenState extends State<HivActionsScreen> {
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

    Widget _hivActionsContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:"presence_of_hiv_1text1".tr(),
                  style: chapterStyle),
              TextSpan(
                text:"presence_of_hiv_1text2".tr(),
                style: normalBold,
              ),
            ]),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: NumberBullet(text: "1"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:"presence_of_hiv_1text3".tr(),
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
              child: NumberBullet(text: "2"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"presence_of_hiv_1text4".tr(),
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
              child: NumberBullet(text: "3"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"presence_of_hiv_1text5".tr(),
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
              child: NumberBullet(text: "4"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"presence_of_hiv_1text6".tr(),
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
              child: NumberBullet(text: "5"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"presence_of_hiv_1text7".tr(),
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
              child: NumberBullet(text: "6"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"presence_of_hiv_1text8".tr(),
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
              child: NumberBullet(text: "7"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"presence_of_hiv_1text9".tr(),
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
              child: NumberBullet(text: "8"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:"presence_of_hiv_1text10".tr(),
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
              child: NumberBullet(text: "9"),
            ),
            Expanded(
              flex: 4,
              child: ListTile(
                  title: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "presence_of_hiv_1text11".tr(),
                          style: contentNormal),
                    ]),
                  )),
            ),
          ],
        ),
      ]);
    }

    Widget _hivActions() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivActionsContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("actions_when_you_have_hiv".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
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
      ),
      body: _hivActions(),
    );
  }
}
