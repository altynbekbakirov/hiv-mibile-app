import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/routes/routes.dart';
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
                  text: "Как вирус попадает в организм человека\n\n",
                  style: chapterStyle),
              TextSpan(
                text:
                    "Спасибо, что остаетесь на связи с нами.  В этом разделе содержится важная информация, "
                    "которая поможет определить собственные риски заражения ВИЧ и как этого можно избежать.\n",
                style: contentItalic,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "ВИЧ", style: normalBold),
              TextSpan(
                text: " – это вирус иммунодефицита человека. "
                    "Это означает, что им болеет только человек и вирус передается от человека к человеку.\n",
                style: contentNormal,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Существует только 3 пути передачи ВИЧ: \n",
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
                  TextSpan(text: "Половой путь", style: contentNormal),
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
                  TextSpan(text: "Инъекционный", style: contentNormal),
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
                      text:
                          "От ВИЧ-позитивной матери ребенку во время беременности, родов и при кормлении грудью",
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
              TextSpan(text: "Половой путь: ", style: normalBold),
              TextSpan(
                  text: "ВИЧ передается при всех видах сексуальных контактов. "
                      "Особенно опасны анальные половые контакты; частая смена половых партнеров; "
                      "случайные половые контакты; насильственный и групповой секс. Увеличивают риск "
                      "инфицирования ВИЧ инфекций, которые передаются половым путем (сифилис, гонорея и др.). ",
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Снижает риск инфицирования ВИЧ: ", style: normalBold),
              TextSpan(
                  text: "Воздержание от половых контактов; "
                      "верность одному неинфицированному партнеру; использование презервативов и "
                      "специальных смазок на водной основе (лубрикантов).",
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        Image.asset('assets/images/injection_way.png'),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Инъекционый путь передачи ВИЧ возможен: ",
                  style: normalBold),
              TextSpan(
                  text:
                      "при совместном употреблении наркотиков путем инъекций; "
                      "получении медицинских услуг у случайных лиц (переливание крови; хирургические операции; инъекции; "
                      "лечение у табибов, сопровождающееся повреждением кожи – насечки; кровопускание; обрезание); "
                      "при проведении татуировок, пирсинга, иглоукалывания нестерильным инструментом.",
                  style: contentNormal),
            ]),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Снижает риск ", style: normalBold),
              TextSpan(
                  text:
                      "отказ от употребления наркотиков, использование индивидуального шприца "
                      "и посуды для приготовления наркотиков; получение медицинских услуг только в медицинских учреждениях; "
                      "использование стерильного инструментария при проведении татуировок, пирсинга "
                      "и других процедур вне организаций здравоохранения.",
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
                  text: "От ВИЧ-позитивной матери – ребенку. ",
                  style: normalBold),
              TextSpan(
                  text:
                      "Своевременное выявление \nВИЧ-инфекции и лечение \nВИЧ-инфекции"
                      " снижает риск передачи ВИЧ ребенку. \n\nПредлагаем Вам получить консультацию по оценке и снижению риска у "
                      "консультантов НПО или в медицинском центре. \n\nВы можете сами определить риски инфицирования. Для этого ответьте "
                      "на следующие несколько вопросов. Если хотя бы по одному вопросу Вы ответили «да», то Вам нужно пройти "
                      "консультирование и тестирование на ВИЧ, а также предпринять меры по собственной безопасности:",
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
                      text: "Были ли у Вас сексуальные отношения?",
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
                      text:
                          "Всегда ли Вы использовали презерватив при сексуальных контактах?",
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
                      text: "Было ли у Вас более одного полового партнера?",
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
                      text:
                          "Были ли у Вас или Вашего полового партнера язвы на половых органах, необычные выделения "
                          "из половых органов, боли внизу живота, либо проходили ли Вы лечение инфекций, которые передаются "
                          "половым путем (сифилис, гонорея, трихомониаз)?",
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
                      text:
                          "Принимали ли вы когда-либо наркотики путем инъекций, хотя бы раз?",
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
                      text:
                          "Принимали ли Вы наркотики совместно с Вашим партнером /партнерами?",
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
                      text: "Болели ли Вы гепатитом?", style: contentNormal),
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
