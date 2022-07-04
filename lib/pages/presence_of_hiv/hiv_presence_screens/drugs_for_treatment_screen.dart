import 'package:HIVApp/components/bullet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TreatmentDrugs extends StatefulWidget {
  const TreatmentDrugs({Key key}) : super(key: key);

  @override
  _TreatmentDrugsState createState() => _TreatmentDrugsState();
}

class _TreatmentDrugsState extends State<TreatmentDrugs> {
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
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    TextStyle chapterStyle = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 10,
        fontWeight: FontWeight.w600);

    TextStyle contentItalic = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);

    TextStyle contentNormal =
    TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w600);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w600);

    Widget _treatmentDrugsContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(
              text: "presence_of_hiv_2text1".tr(),
              style: chapterStyle,
            ),
          ),
        ),
        Image.asset("assets/images/ДКП.png"),
        ListTile(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:"presence_of_hiv_2text2".tr(),
                  style: normalBold,
                ),
                TextSpan(
                  text: "presence_of_hiv_2text3".tr(),
                ),
                TextSpan(
                  text:"presence_of_hiv_2text4".tr(),
                ),
                TextSpan(
                  text:"presence_of_hiv_2text5".tr(),
                  style: contentItalic,
                ),
                TextSpan(
                  text: "presence_of_hiv_2text6".tr(),
                  style: normalBoldForChapter,
                ),
                TextSpan(
                  text:"presence_of_hiv_2text7".tr(),
                ),
                TextSpan(
                  text:"presence_of_hiv_2text8".tr(),
                ),
              ],
              style: contentNormal,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: MyBullet()),
            Expanded(
              flex: 4,
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_2text9".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: MyBullet()),
            Expanded(
              flex: 4,
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_2text10".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: MyBullet()),
            Expanded(
              flex: 4,
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_2text11".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: MyBullet()),
            Expanded(
              flex: 4,
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_2text12".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ],
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:"presence_of_hiv_2text13".tr(),
                  style: normalBold,
                ),
                TextSpan(
                  text: "presence_of_hiv_2text14".tr(),
                  style: normalBold,
                ),
              ],
              style: contentNormal,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: MyBullet()),
            Expanded(
              flex: 4,
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_2text15".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: MyBullet()),
            Expanded(
              flex: 4,
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "presence_of_hiv_2text16".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ],
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "presence_of_hiv_2text17".tr(),
                  style: normalBold,
                ),
                TextSpan(
                  text:"presence_of_hiv_2text18".tr(),
                  style: normalBold,
                ),
                TextSpan(
                  text: "presence_of_hiv_2text19".tr(),
                  style: normalBold,
                ),
              ],
              style: contentNormal,
            ),
          ),
        ),
      ]);
    }

    Widget _treatmentDrugs(BuildContext context) {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _treatmentDrugsContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hiv_drugs".tr(),
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
      body: _treatmentDrugs(context),
    );
  }
}
