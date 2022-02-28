import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Лечение ВИЧ-инфекции
class HivTreatmentScreen extends StatefulWidget {
  @override
  _HivTreatmentScreenState createState() => _HivTreatmentScreenState();
}

class _HivTreatmentScreenState extends State<HivTreatmentScreen> {
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
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);

    TextStyle contentNormal =
        TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w600);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w600);

    Widget _hivTreatmentContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(text:"presence_of_hiv_6text1".tr(), style: chapterStyle),
          ),
        ),
        Image.asset("assets/images/ДКП.png"),
        ListTile(
          title: RichText(
              text: TextSpan(children: [
            TextSpan(text:"presence_of_hiv_6text2".tr(), style: normalBold),
            TextSpan(text:"presence_of_hiv_6text3".tr(), style: contentNormal),
            TextSpan(
                text:"presence_of_hiv_6text4".tr(),
                style: normalBold),
                TextSpan(text:"presence_of_hiv_6text45".tr(), style: contentNormal),
            TextSpan(
                text:"presence_of_hiv_6text5".tr(),
                style: contentNormal),
          ])),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
                text:"presence_of_hiv_6text6".tr(),
                style: normalBoldForChapter),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "presence_of_hiv_6text7".tr(),
                  style: contentNormal),
              TextSpan(
                  text:"presence_of_hiv_6text8".tr(),
                  style: normalBold),
              TextSpan(
                  text:"presence_of_hiv_6text9".tr(),
                  style: contentNormal)
            ]),
          ),
        ),
        Image.asset("assets/images/lechenie3.png"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("presence_of_hiv_6text10".tr(),
              style: TextStyle(
                  fontSize: fontSize - 6,
                  fontWeight: FontWeight.w300,
                  color: Colors.black)),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text:"presence_of_hiv_6text11".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text12".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text13".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text14".tr(),
                style: normalBold,
              ),
              TextSpan(
                text:"presence_of_hiv_6text15".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text16".tr(),
                style: normalBold,
              ),
              TextSpan(
                text:"presence_of_hiv_6text17".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text18".tr(),
                style: contentItalic,
              ),
              TextSpan(
                text:"presence_of_hiv_6text19".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text20".tr(),
                style: normalBold,
              ),
              TextSpan(
                text:"presence_of_hiv_6text21".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text22".tr(),
                style: normalBold,
              ),
              TextSpan(
                text:"presence_of_hiv_6text23".tr(),
                style: contentNormal,
              ),
              TextSpan(
                text:"presence_of_hiv_6text24".tr(),
                style: normalBold,
              ),
              TextSpan(
                text:"presence_of_hiv_6text25".tr(),
                style: normalBold,
              ),
            ]),
          ),
        ),
      ]);
    }

    Widget _hivTreatment() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivTreatmentContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hiv_infection_treatment".tr(),
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
      body: _hivTreatment(),
    );
  }
}
