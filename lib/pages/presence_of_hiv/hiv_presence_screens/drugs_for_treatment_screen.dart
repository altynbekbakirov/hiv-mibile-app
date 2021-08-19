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
              text: "Антиретровирусные препараты",
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
                  text: 'Антиретровирусные препараты (АРВП)',
                  style: normalBold,
                ),
                TextSpan(
                  text: ' – это лекарства, которые действуют против '
                      'ретровируса – то есть вируса, который вызывает ВИЧ-инфекцию.\n',
                ),
                TextSpan(
                  text:
                  '\nВ настоящее время существует много эффективных препаратов для лечения ВИЧ-инфекции. '
                      'Важно получать одновременно несколько препаратов, которые действуют на разные этапы развития '
                      'вируса. Современные лекарства включают три разных препарата в одной таблетке.\n',
                ),
                TextSpan(
                  text:
                  '\nДо настоящего времени не разработано лекарство, которое могло бы полностью излечить человека '
                      'от ВИЧ-инфекции, и нет вакцины, которая могла бы защитить от заражения ВИЧ. Поэтому человек '
                      'с ВИЧ должен постоянно получать лечение.\n',
                  style: contentItalic,
                ),
                TextSpan(
                  text: '\nКак действуют антиретровирусные препараты?',
                  style: normalBoldForChapter,
                ),
                TextSpan(
                  text:
                  '\n\nАнтиретровирусные препараты не излечивают от ВИЧ-инфекции, а лишь подавляют размножение '
                      'вируса. В результате применения АРТ, содержание ВИЧ в организме уменьшается в тысячи и '
                      'миллионы раз, ВИЧ перестает размножаться и не разрушает иммунные клетки. С этого времени '
                      'иммунная система начинает восстанавливаться.\n',
                ),
                TextSpan(
                  text:
                  '\nВ настоящее время в мире применяется более 20 антиретровирусных препаратов. Каждый препарат'
                      ' действует на один из этапов размножения вируса. Поэтому врачи подбирают схему лечения, '
                      'которая включает несколько препаратов. АРВП, дополняя друг друга, обеспечивают защиту '
                      'организма от ВИЧ.\n',
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
                    text: "Схема АРТ всегда содержит три разных АРВ-препарата.",
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
                    text: "Схему лечения определяет врач, с учетом особенностей здоровья и результатов лабораторного исследования.",
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
                    text: "В одной таблетке может содержаться 1, 2, или 3 препарата.",
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
                    text: "Ежедневно принимают от одной до трех (иногда до шести) таблеток. Это зависит от "
                        "состояния иммунитета и устойчивости вируса к препаратам.",
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
                  text: 'Для того, чтобы контролировать лечение, нужно регулярно сдавать кровь на вирусную '
                      'нагрузку – то есть узнавать о количестве вируса в крови.\n',
                  style: normalBold,
                ),
                TextSpan(
                  text: '\nКогда АРТ перестает работать (не снижается вирусная нагрузка)?\n',
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
                    text: "Чаще всего это связано с низкой приверженностью к лечению - когда ЛЖВ по разным причинам "
                        "пропускают прием препаратов.",
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
                    text: "Иногда сам ВИЧ приспосабливается и становится невосприимчивым (устойчивым) к действию лекарств.",
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
                  text: '\nТакие случаи нужно обсудить с врачом и совместно решать проблему.\n',
                  style: normalBold,
                ),
                TextSpan(
                  text: '\nНазначение АРВП проводится в строгом соответствии с инструкциями, которые утверждаются '
                      'Министерством здравоохранения (они называются Клинические протоколы).\n',
                  style: normalBold,
                ),
                TextSpan(
                  text: '\nВ мире ведется постоянная работа по созданию новых более эффективных лекарств для лечения ВИЧ-инфекции.\n',
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
