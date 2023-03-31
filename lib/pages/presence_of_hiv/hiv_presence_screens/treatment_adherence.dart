import 'package:hiv/components/bullet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TreatmentAdherence extends StatefulWidget {
  const TreatmentAdherence({Key key}) : super(key: key);

  @override
  _TreatmentAdherenceState createState() => _TreatmentAdherenceState();
}

class _TreatmentAdherenceState extends State<TreatmentAdherence> {
  double fontSize = 18;
  bool showSlider = false;
  TextStyle chapterStyle;
  TextStyle normalBoldForChapter;
  TextStyle normalBold;
  TextStyle contentNormal;
  TextStyle contentItalic;

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

  Widget _treatmentAdherenceContent() {
    return ListView(children: [
      ListTile(
        title: RichText(
          text: TextSpan(
            text:"presence_of_hiv_5text1".tr(),
            style: chapterStyle,
          ),
        ),
      ),
      Image.asset("assets/images/Назначение врача.png"),
      ListTile(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:"presence_of_hiv_5text2".tr(),
              ),
              TextSpan(
                text:"presence_of_hiv_5text3".tr(),
                style: normalBold,
              ),
              TextSpan(
                text: "presence_of_hiv_5text4".tr(),
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:"presence_of_hiv_5text5".tr(),
              ),
              TextSpan(
                text:"presence_of_hiv_5text6".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: "presence_of_hiv_5text7".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"presence_of_hiv_5text8".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"presence_of_hiv_5text9".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"presence_of_hiv_5text10".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"presence_of_hiv_5text11".tr(),
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
            text:"presence_of_hiv_5text12".tr(),
            style: normalBold,
          ),
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: "presence_of_hiv_5text13".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"presence_of_hiv_5text14".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"presence_of_hiv_5text15".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: "presence_of_hiv_5text16".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: "presence_of_hiv_5text17".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"presence_of_hiv_5text18".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: "presence_of_hiv_5text19".tr(),
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyBullet(),
          )),
          Expanded(
            flex: 4,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: "presence_of_hiv_5text20".tr(),
                  style: contentNormal,
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  Widget _treatmentAdherence(BuildContext context) {
    return Scaffold(
      appBar: showSlider ? _appBarWithSizeSlider(context) : null,
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: _treatmentAdherenceContent()),
    );
  }

  @override
  Widget build(BuildContext context) {
    chapterStyle = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 10,
        fontWeight: FontWeight.w600);

    contentItalic = TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic);

    contentNormal = TextStyle(color: Colors.black, fontSize: fontSize);

    normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w600);

    normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: AppBar(
        title: Text("treatment_adherence".tr(),
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
      body: _treatmentAdherence(context),
    );
  }
}
