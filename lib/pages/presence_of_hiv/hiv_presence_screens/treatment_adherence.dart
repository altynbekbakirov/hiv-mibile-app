import 'package:HIVApp/components/bullet.dart';
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
            text: "ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ",
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
                text:
                    "Приверженность к АРТ означает прием антиретровирусных препаратов пациентом с точным "
                    "соблюдением графика приема и дозировки, которые были рекомендованы врачом. Высокая "
                    "приверженность АРТ – важнейшее условие успеха лечения.\n",
              ),
              TextSpan(
                text:
                    "Для эффективного подавления размножения ВИЧ (то есть до достижения неопределяемой вирусной "
                    "нагрузки) необходимо принимать ",
                style: normalBold,
              ),
              TextSpan(
                text: "95 –100 % предписанных доз препаратов.\n",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:
                    '\nЛюди иногда допускают ошибки в приеме препаратов по невнимательности, забывчивости либо неверия в '
                    'эффективность лечения. Поэтому важно получить правдивую информацию об АРТ и получить поддержку. '
                    'Большую помощь Вам могут оказать люди, которые живут с ВИЧ, и могут открыто говорить о своем статусе. '
                    'Можно также принять участие в группах поддержки (группы само и взаимопомощи) из числа ЛЖВ. Они помогут '
                    'справиться со стрессом, связанным с принятием ВИЧ-статуса; помогут на начальном этапе лечения по '
                    'ВИЧ-инфекции, напомнят о приеме препаратов; окажут другую помощь.\n',
              ),
              TextSpan(
                text: '\nПочему важно принимать препараты точно по времени?\n',
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
                  text: "Для каждого препарата рассчитана такая дозировка и такая частота приёма, чтобы в крови "
                      "постоянно поддерживалось определённое количество лекарства. Только в этом случае ВИЧ не "
                      "размножается, и не формируются его изменения (мутации), которые могут стать причиной "
                      "устойчивости к антиретровирусным препаратам – и лечение перестанет действовать на вирус.",
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
                  text: "При пропуске препарата количество лекарства в крови снижается, и ВИЧ начинает размножаться. При этом "
                      "могут образоваться вирусы-мутанты, которые обладают устойчивостью к препаратам. В результате лечение "
                      "перестает действовать, а вирус начинает размножаться. В результате назначаются другие схемы лечения, и "
                      "может увеличиться количество принимаемых таблеток.",
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
                  text: "Чем чаще повторяются пропуски, тем больше риск, что вирус приспособится и станет "
                      "устойчивым к антиретровирусным препаратам.",
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
                  text: "Можно отклонятся на один час от предписанного времени приема лекарств в ту или иную сторону, "
                      "но лучше всего ориентироваться на прием лекарств в одно и то же время – для этого можно использовать "
                      "оповещение на мобильном телефоне, увязать прием препаратов с обычным ежедневным действием "
                      "(умыванием, завтраком, ежедневным выходом на работу) либо попросить помощи друзей или родственников.",
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
                  text: "При пропуске приема очередной дозы препарата её можно принять только в том случае, если "
                      "до времени следующего приема осталось более 6 часов (для лекарств, которые принимают два "
                      "раза в день, например, Комбивир) или более 12 часов (для лекарств, которые принимают один "
                      "раз в день, например, Атрипла).",
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
            text: "Как повысить приверженность",
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
                  text: "Привязать прием препаратов к повседневным делам (например, к чистке зубов).",
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
                  text: "Напоминающие приспособления (таймеры сотовых телефонов).",
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
                  text: "Записать рекомендации врача и следовать им.",
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
                  text: "Составить календарь посещения врача с учетом возможных выходных и праздничных дней, "
                      "чтобы получать препараты заранее до их полного использования.",
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
                  text: "Использовать контейнеры для таблеток или аптечки-органайзеры.",
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
                  text: "Общение с ЛЖВ, которые могут оказать моральную поддержку и практическую помощь.",
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
                  text: "Найти компаньона по лечению – человека, который поможет на этапе начала АРТ (родственник, друг или медсестра).",
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
                  text: "Включение в программы заместительной терапии метадоном для ЛЖВ, которые принимают наркотики.",
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
