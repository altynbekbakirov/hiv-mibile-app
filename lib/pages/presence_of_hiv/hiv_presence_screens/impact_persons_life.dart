import 'package:HIVApp/components/bullet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ImpactARTForPersonLife extends StatefulWidget {
  const ImpactARTForPersonLife({Key key}) : super(key: key);

  @override
  _ImpactARTForPersonLifeState createState() => _ImpactARTForPersonLifeState();
}

class _ImpactARTForPersonLifeState extends State<ImpactARTForPersonLife> {
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
            text: "Воздействие АРТ на человека с ВИЧ",
            style: chapterStyle,
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
            flex: 5,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "Улучшается качество жизни, то есть заболевания, связанные с ВИЧ (например, длительная диарея,"
                          " туберкулез, частые ангины, герпес, кожный зуд и другие), не появятся либо будут "
                          "лучше поддаваться лечению при приеме АРТ.",
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
            flex: 5,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                  "Увеличится продолжительность жизни, т. е. продолжительность жизни людей с ВИЧ, "
                      "получающих АРТ, практически не отличается от таковой у людей без ВИЧ.",
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
            flex: 5,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                  "АРТ может снизить риск передачи ВИЧ половому партнеру более, чем на 90 %! Это улучшает "
                      "семейные отношения, снизить страх инфицирования ВИЧ партнера. Однако АРТ должна "
                      "обязательно использоваться с комбинации с другими методами профилактики передачи ВИЧ, "
                      "в том числе с использованием презервативов.",
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
            flex: 5,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                  "Прием АРТ позволяет планировать беременность и обеспечивает рождение здорового ребенка у родителей, живущих с ВИЧ.",
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
            flex: 5,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                  "Улучшаются лабораторные показатели: "
                      "\n- снижение вирусной нагрузки до неопределяемого уровня означает, что терапия эффективна, "
                      "что ВИЧ не размножается и не поражает иммунные клетки; "
                      "\n- повышение количества CД4-клеток означает, что иммунная система восстанавливается и "
                      "серьезные сопутствующие заболевания не разовьются; "
                      "\n- возможно улучшение других лабораторных показателей (например, повышение уровня "
                      "гемоглобина, нормализация печёночных тестов).",
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
            flex: 5,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                  "Улучшается настроение, поскольку снимается чувство беспокойства за близких, за возможность "
                      "передачи ВИЧ половым партнерам, за планирование рождения детей. Улучшаются семейные "
                      "отношения, особенно в тех случаях, когда близкие родственники вовлечены в процесс наблюдения "
                      "и лечения.",
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
            flex: 5,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:"Назначение АРТ у детей обеспечивает их рост и развитие, как и у детей, которые  не инфицированы ВИЧ.",
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
