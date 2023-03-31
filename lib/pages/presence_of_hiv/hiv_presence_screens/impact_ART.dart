import 'package:hiv/components/number_bullet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ImpactART extends StatefulWidget {
  const ImpactART({Key key}) : super(key: key);

  @override
  _ImpactARTState createState() => _ImpactARTState();
}

class _ImpactARTState extends State<ImpactART> {
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
            text: "presence_of_hiv_3text1".tr(),
            style: chapterStyle,
          ),
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NumberBullet(text: "1")),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_3text2".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NumberBullet(text: "2")),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_3text3".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NumberBullet(text: "3")),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "presence_of_hiv_3text4".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NumberBullet(text: "4")),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "presence_of_hiv_3text5".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NumberBullet(text: "5")),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_3text6".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NumberBullet(text: "6")),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text:"presence_of_hiv_3text7".tr(),
                    style: contentNormal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: NumberBullet(text: "7")),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "presence_of_hiv_3text8".tr(),
                    style: contentNormal,
                  ),
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
