import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NotTransmittedHivScreen extends StatefulWidget {
  @override
  _NotTransmittedHivScreenState createState() =>
      _NotTransmittedHivScreenState();
}

class _NotTransmittedHivScreenState extends State<NotTransmittedHivScreen> {
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

    Widget _hivNotTransmittedContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Как ВИЧ не передается\n\n", style: chapterStyle),
              TextSpan(
                text:
                    "Для каждого из нас важно знать, как ВИЧ не передается, чтобы перестать бояться того, что не опасно, "
                    "а снижать риск там, где опасно; уметь обезопасить себя. Помните, что ВИЧ передается только тремя путями "
                    "(посмотрите этот раздел). Не бойтесь людей, живущих с ВИЧ – они для Вас не несут никакой угрозы. "
                    "Угроза в нашем незнании и неумении защитить себя.\n",
                style: contentItalic,
              ),
            ]),
          ),
        ),
        Image.asset('assets/images/image_way4.png'),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "При объятии, рукопожатии, поцелуе\n\n",
                style: normalBoldForChapter,
              ),
              TextSpan(text: "При кашле и чихании", style: contentNormal),
            ]))),
        SizedBox(height: 20),
        Image.asset('assets/images/image_way5.png'),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "При приготовлении и принятии пищи\n\n",
                    style: normalBoldForChapter,
                  ),
                  TextSpan(text: "При пользовании общей посудой, столовыми приборами, полотенцами и постельным бельем. "
                      "При общении пользовании книгами,  бытовыми приборами.",
                      style: contentNormal),
                ]))),
        SizedBox(height: 20),
        Image.asset('assets/images/image_way6.png'),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "При пользовании туалетом, душем, ванной\n\n",
                    style: normalBoldForChapter,
                  ),
                  TextSpan(text: "При плавании в бассейне, при занятиях спортом.",
                      style: contentNormal),
                ]))),
        SizedBox(height: 20),
        Image.asset('assets/images/image_way7.png'),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "При укусах насекомых (комаров, москитов, пчел)\n\n",
                    style: normalBoldForChapter,
                  ),
                  TextSpan(text: "При общении и укусах животных.",
                      style: contentNormal),
                ]))),
        SizedBox(height: 20),
        Container(
          color: kLightGrayishBlue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Человек, живущий с ВИЧ не опасен в быту. Вы можете общаться, проживать в одной комнате, учиться в одном классе, "
                          "одной группе. Сидеть за одним столом. Ходить в клубы, в кафе, на дискотеки, вместе отдыхать.",
                      style: normalBold,
                    ),
      ])),
            ))
      ]);
    }

    Widget _hivNotTransmitted() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivNotTransmittedContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("how_is_HIV_not_transmitted".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
          onTap: () {
            Navigator.pop(context, Routes.hiv_info);
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
      body: _hivNotTransmitted(),
    );
  }
}
