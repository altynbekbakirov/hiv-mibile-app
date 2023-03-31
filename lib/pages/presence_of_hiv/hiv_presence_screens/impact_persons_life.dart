import 'package:hiv/components/bullet.dart';
import 'package:hiv/data/pref_manager.dart';
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
    return
      Prefs.getString(Prefs.LANGUAGE) == "ru"
          ?
      ListView(children:

    [
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
                          " туберкулез, частые ангины, герпес, кожный зуд и другие), не проявлять либо будут "
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
                  "АРТ может снизит риск передачи ВИЧ половому партнеру более, чем на 90 %! Это улучшает "
                      "семейные отношения, снизит страх инфицирования ВИЧ партнера. Однако АРТ должна "
                      "обязательно использоваться в комбинации с другими методами профилактики передачи ВИЧ, "
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
                      "передачи ВИЧ половым партнерам, за планирование рождения детей.",
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
                  "Улучшаются семейные отношения, особенно в тех случаях, когда близкие родственники вовлечены в процесс наблюдения "
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
                  text:"Назначение АРТ у детей обеспечивает их рост и развитие, как и у детей, которые не инфицированы ВИЧ.",
                  style: contentNormal,
                ),
              ),
            ),
          ),
        ],
      ),
    ]):
      ListView(children:

      [
        ListTile(
          title: RichText(
            text: TextSpan(
              text: "ВИЧ менен ооруган адамга Искуствонун таасири",
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
                    "Жашоонун сапатынын жакшырышы, б.а. ВИЧ менен байланышкан оорулар (мисалы, узакка созулган диарея"
                    "кургак учук,  ангина, герпес, кычышуу жана башка) оорулар  козгобойт же "
                    "АРТ алып жатып дарылануунун натыйжасында басылат",
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
                    "Өмүрдүн узактыгы, б.а. ВИЧке чалдыккан адамдардын өмүрүнүн узактыгы көбөйөт»,"
                    "АРТ алган адамдардын өмүрүнүн узактыгы  ВИЧи жок адамдардай эле жашашат",
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
                    "ART ВИЧтин жыныстык өнөктөшкө жугуу коркунучун 90% дан ашык азайтат! "
                        "Үй-бүлөлүк мамилелер жакшыртат жана өнөктөштүн ВИЧ-инфекциясынан коркуу сезимин азайтат. Бирок, "
                        "ВИЧ-инфекциясынын жугушун алдын алуу үчүн башка ыкмалар менен айкалыштырып колдонуу керек,"
                    "анын ичинде презервативдерди колдонуу",
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
                    "ART кабыл алуу кош бойлуулукту пландаштырууга мүмкүндүк берет жана ВИЧ менен жашаган ата-энелерде дени сак баланын төрөлүшүн камсыздайт.",
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
                    "Жакшыртылган лабораториялык параметрлер: "
                  "\n- вирустук жүктөмдүн аныкталбаган деңгээлге чейин төмөндөшү терапиянын эффективдүү экенин билдирет,"
                  "ВИЧ иммундук клеткаларды репликациялабайт же кол салбайт;"
                  "\n- CD4 клеткаларынын санынын өсүшү иммундук системанын калыбына келе баштаганын билдирет жана "
                  "олуттуу кошумча оорулар өнүкпөйт;"
                  "\n- башка лабораториялык параметрлерди жакшыртуу мүмкүн (мисалы, деңгээлдин жогорулашы "
                  "гемоглобин, боор анализдерин нормалдаштыруу).",
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
                    "ВИЧти жыныстык өнөктөштөргө бербөө же балдардын төрөлүшүн пландаштыруу , мүмкүнчүлүк үчүн жакындары үчүн тынчсыздануу сезими жоюлуп, маанай жакшырат"
                    ", .",
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
                    "Үй-бүлө мамилелери жакшырат, өзгөчө жакын туугандары көзөмөл процессинде"
                    "жана дарылоодо.",
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
                    text:"Балдарга АРТны дайындоо аларды ВИЧ-инфекциясы жок балдардай эле өсүшүн жана өнүгүшүн камсыздайт.",
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
