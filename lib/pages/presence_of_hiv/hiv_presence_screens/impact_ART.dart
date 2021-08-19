import 'package:HIVApp/components/number_bullet.dart';
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
            text: "Воздействие АРТ на здоровье человека",
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
                    text: "Несмотря на то, что ВИЧ может долго не проявляет себя в организме человека, он медленно "
                        "уничтожает иммунные клетки, которые защищают организм от болезней. Назначение АРТ позволит "
                        "сохранить иммунную систему и, таким образом, защитит организм от болезней.",
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
                    text: "В случае нарушения иммунитета, организм человека с ВИЧ подвергается риску сопутствующих "
                        "заболеваний – они называются оппортунистические инфекции и не развиваются у людей с сильной "
                        "иммунной системой. Каждое такое заболевание само по себе создает серьезную (а иногда и "
                        "смертельную) опасность для человека. Чаще всего при ВИЧ-инфекции присоединяется туберкуле."
                        " Для человека с ВИЧ – это дополнительная угроза снижения иммунитета. Помимо этого, наряду с"
                        " АРТ возникнет необходимость приема других препаратов, что усилит риск нежелательных "
                        "эффектов от лечения. Т.е. вместо 2-3 препаратов в день придется принимать 8-10 препаратов "
                        "в зависимости от формы туберкулеза.",
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
                    text: "Риск возникновения и тяжесть течения любых заболеваний у человека с ВИЧ значительно "
                        "опаснее, чем у людей без ВИЧ-инфекции.",
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
                    text: "Назначение АРТ ВИЧ-позитивным беременным женщинам позволяет предотвратить передачу ВИЧ ее ребенку.",
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
                    text: "Важно назначать лечение детям, живущим с ВИЧ, чтобы они испытали все радости жизни и общения со сверстниками без боли, без болезней,"
                        " с хорошим физическим развитием и сильной иммунной системой.",
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
                    text: "Наука не стоит на месте. Проводится работа по разработке новых лекарств для лечения ВИЧ-инфекции. "
                        "Возможно, такие лекарства будут найдены и Вам удастся полностью освободиться от ВИЧ.",
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
                    text: "Человек рожден, чтобы жить. Для этого люди переносят тяжелые операции, соглашаются на "
                        "ампутацию ног, рук, груди, платят огромные деньги за пересадку сердца и почек, а затем "
                        "пожизненно принимают специальные препараты; бывает, что жертвуют своими органами (почкой) "
                        "для своих близких. Поэтому прием одной-трех таблеток в день – это минимальная плата за "
                        "долгую и здоровую жизнь…",
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
