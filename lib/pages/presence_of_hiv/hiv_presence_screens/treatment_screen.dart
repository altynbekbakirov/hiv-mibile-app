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
            text: TextSpan(text: "ЛЕЧЕНИЕ ВИЧ-инфекции", style: chapterStyle),
          ),
        ),
        Image.asset("assets/images/ДКП.png"),
        ListTile(
          title: RichText(
              text: TextSpan(children: [
            TextSpan(text: "ЛЕЧЕНИЕ ВИЧ-инфекции ", style: normalBold),
            TextSpan(text: "называется ", style: contentNormal),
            TextSpan(
                text: "антиретровирусная терапия (сокращенно - АРТ).\n",
                style: normalBold),
            TextSpan(
                text:
                    "АРТ - это лечение, которое действует против ретровируса – то есть вируса, который вызывает ВИЧ-инфекцию.",
                style: contentNormal),
          ])),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(
                text: "АРТ останавливает рамножение вируса",
                style: normalBoldForChapter),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Лекарства для лечения ВИЧ-инфекции называют ",
                  style: contentNormal),
              TextSpan(
                  text: "антиретровирусные препараты (АРВП). ",
                  style: normalBold),
              TextSpan(
                  text:
                      "Они останавливают размножение вируса.  Через 3-6 месяцев после начала лечения количество "
                      "вируса снижается до очень низкого уровня, которое не определяется при исследовании крови – это называется"
                      " неопределяемая вирусная нагрузка.",
                  style: contentNormal)
            ]),
          ),
        ),
        Image.asset("assets/images/befor&afterhiv.png", height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
              'Рис. Вирусная нагрузка – количество вируса в крови до и после лечения',
              style: TextStyle(
                  fontSize: fontSize - 6,
                  fontWeight: FontWeight.w300,
                  color: Colors.black)),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text:
                    "\nБез лечения ВИЧ поражает клетки иммунной (защитной) системы организма (их называют "
                    "CD4-клетки). Поэтому количество СД4 уменьшается, а количество вируса в крови быстро "
                    "увеличивается. При отсутствии лечения разрушается так много клеток, что иммунная система не "
                    "может защищать организм, и человек погибает от других инфекционных заболеваний или от рака.\n",
                style: contentNormal,
              ),
              TextSpan(
                text:
                "\nПри приеме АРТ иммунная система восстанавливается, увеличивается количество CD4-клеток. "
                    "Исчезают, или уменьшаются проявления ВИЧ-инфекции (если они были ранее).\nРиск заражения ВИЧ "
                    "полового партнера или будущего ребенка значительно снижается.\n",
                style: contentNormal,
              ),
              TextSpan(
                text:
                "\nЛечение ВИЧ-инфекции позволяет сохранить здоровье и жизнь человека.\n",
                style: contentNormal,
              ),
              TextSpan(
                text:
                "Лечение нужно начинать как можно раньше",
                style: normalBold,
              ),
              TextSpan(
                text:
                " – сразу же после установления ВИЧ-статуса и строго соблюдать назначения врача.",
                style: contentNormal,
              ),
              TextSpan(
                text:
                "\nЧем раньше начато лечение, тем меньше вреда вирус нанесет иммунной системе. ",
                style: normalBold,
              ),
              TextSpan(
                text:
                "Это очень важно, потому что восстановление иммунной системы происходит очень медленно и организм остается без "
                    "защиты даже если вирус уже не размножается в результате приема АРТ.\n",
                style: contentNormal,
              ),
              TextSpan(
                text:
                "\nДо настоящего времени не разработано лекарство, которое могло бы полностью излечить человека от "
                    "ВИЧ-инфекции, и нет вакцины, которая могла бы защитить от заражения ВИЧ. Поэтому человек с "
                    "ВИЧ должен постоянно получать лечение.\n",
                style: contentItalic,
              ),
              TextSpan(
                text:
                "\nВажно строго соблюдать дозу и время приема лекарств, никогда не прерывать лечение",
                style: contentNormal,
              ),
              TextSpan(
                text:
                " – это называется приверженность к лечению. ",
                style: normalBold,
              ),
              TextSpan(
                text:
                "У ЛЖВ всегда должен быть запас препаратов, не меньше, чем на 1 месяц, который нужно регулярно "
                    "пополнять, чтобы не было перерывов в лечении. Даже небольшие перерывы в лечении могут "
                    "привести к ",
                style: contentNormal,
              ),
              TextSpan(
                text:
                "устойчивости вируса",
                style: normalBold,
              ),
              TextSpan(
                text:
                " – тогда лекарства не будут действовать на ВИЧ. В таком случае назначаются другие лекарства, "
                    "а количество применяемых таблеток увеличивается. \n",
                style: contentNormal,
              ),
              TextSpan(
                text:
                "\nПрепараты для лечения ВИЧ-инфекции (АРВП) предоставляются бесплатно! \n",
                style: normalBold,
              ),
              TextSpan(
                text:
                "\nАнтиретровирусная терапия позволяет людям с ВИЧ прожить полноценную и долгую жизнь!",
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
