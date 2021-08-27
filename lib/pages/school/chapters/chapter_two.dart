import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterTwo extends StatefulWidget {
  const ChapterTwo({Key key, this.chapterTwoCallback}) : super(key: key);

  final Function(double) chapterTwoCallback;

  @override
  _ChapterTwoState createState() => _ChapterTwoState();
}

class _ChapterTwoState extends State<ChapterTwo> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();

  String textAza = 'Однако до настоящего '
      "времени не разработано "
      "лекарство, которое могло "
      "бы полностью излечить "
      "человека от ВИЧ-инфекции, "
      "и нет вакцины, которая "
      "могла бы защитить от"
      "заражения ВИЧ. Поэтому "
      "человек с ВИЧ должен "
      "постоянно получать "
      "лечение.";
  String textNadya =
      'Когда дети вступают в подростковый возраст, они начинают осознавать свою непохожесть на других детей. В этот период очень важна поддержка со стороны близких и сообщества для открытия статуса и поддержки приверженности к терапии.';

  @override
  void initState() {
    super.initState();
    show();
  }

  show() async {
    await Future.delayed(
        const Duration(seconds: 1),
        () => Doctor.showDialogFunc(
              context: context,
              text: textAza,
              doctor: Doctors.Azamat,
              fontSize: 18,
            ));
  }

  header(String header) {
    return TextSpan(
      text: '\n$header\n\n',
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize + 6,
          color: Colors.black),
    );
  }

  boldText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: fontSize, color: Colors.black),
    );
  }

  normalText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(fontSize: fontSize, color: Colors.black),
    );
  }

  italicText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(
          fontSize: fontSize, color: Colors.black, fontStyle: FontStyle.italic),
    );
  }

  //region Pages
  /// Страица 1 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("ЛЕЧЕНИЕ ВИЧ-инфекции"),
                boldText("Лечение "),
                normalText("ВИЧ-инфекции называется "),
                boldText("антиретровирусная терапия (сокращенно - АРТ).\n"),
                boldText("АРТ "),
                normalText(
                    "- это лечение, которое действует против ретровируса – то есть вируса, который вызывает ВИЧ-инфекцию."),
                normalText(
                    "\n\nБез лечения ВИЧ поражает лимфоциты – клетки иммунной (защитной) системы организма "
                    "(их называют CD4-клетки). Поэтому количество СД4 уменьшается, а количество вируса в крови "
                    "быстро увеличивается. При отсутствии лечения разрушается так много клеток, что иммунная "
                    "система не может защищать организм, и человек погибает от других инфекционных заболеваний или от рака."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/pills.png"),
            SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 2 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page2(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                italicText(
                    "До настоящего времени не разработано лекарство, которое могло бы полностью "
                    "излечить человека от ВИЧ-инфекции, и нет вакцины, которая могла бы защитить от "
                    "заражения ВИЧ. Поэтому человек с ВИЧ должен постоянно получать лечение всю свою жизнь."),
                normalText("\nДля лечения ВИЧ-инфекции используют "),
                boldText("антиретровирусные препараты (АРВП).\n"),
                normalText(
                    "Они останавливают размножение вируса.  Через 3-6 месяцев после начала лечения количество вируса снижается до очень "),
                boldText("низкого уровня, "),
                normalText(
                    "которое не определяется при исследовании крови – это называется "),
                boldText("неопределяемая вирусная нагрузка."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/befor&afterhiv.png"),
            Text(
                "Рис. Вирусная нагрузка – количество вируса в крови до и после лечения."),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                boldText("АРТ останавливает размножение вируса\n"),
                normalText(
                    "\nПри приеме АРТ ВИЧ не размножается и не убивает СД4 лимфоциты. В результате, иммунная система восстанавливается, увеличивается количество CD4-клеток. Исчезают, или уменьшаются проявления ВИЧ-инфекции (если они были ранее)."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 3 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page3(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\nКроме того, риск заражения ВИЧ полового партнера или будущего ребенка значительно снижается."),
                boldText(
                    "\nЧем раньше Вы начали АРТ, тем меньше вреда вирус успевает нанести иммунной системе. "),
                normalText(
                    "Это очень важно, потому что восстановление иммунитета происходит очень медленно и организм "
                    "остается без защиты даже если вирус уже не размножается в результате приема АРТ.\n\n"),
                normalText(
                    "Важно строго соблюдать дозу и время приема лекарств, никогда не прерывать лечение – "),
                boldText("это называется приверженность к лечению. "),
                normalText(
                    "У ЛЖВ всегда должен быть запас препаратов, не меньше, чем на 1 месяц, который нужно регулярно "
                    "пополнять, чтобы не было перерывов в лечении. Нарушение предписаний врача по приему АРТ может привести к "),
                boldText("устойчивости вируса к лечению "),
                normalText(
                    "– тогда лекарства не будут действовать на ВИЧ. В таком случае врач меняет курс лечения или назначает"
                    " уже вторую линию препаратов и количество применяемых таблеток увеличивается."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 4 ЛЕЧЕНИЕ ВИЧ-инфекции
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText(
                    "\nПрепараты для лечения ВИЧ-инфекции (АРВП) предоставляются бесплатно! \n"),
                //TODO image Get Pill
                normalText(
                    "Лечение ВИЧ-инфекции позволяет сохранить здоровье и жизнь человека. "),
                boldText("Поэтому лечение нужно начинать как можно раньше"),
                normalText(
                    " – сразу же после установления ВИЧ-статуса и строго соблюдать назначения врача. \n"),
                boldText(
                    "Антиретровирусная терапия позволяет людям с ВИЧ прожить полноценную и долгую жизнь!"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 10),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 5 Антиретровирусные препараты
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Антиретровирусные препараты"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/pills_health.png"),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                boldText("Антиретровирусные препараты (АРВП) – "),
                normalText(
                    "это лекарства, которые действуют против ретровируса – "
                    "то есть вируса, который вызывает ВИЧ-инфекцию\n"),
                normalText(
                    "\nСуществует много эффективных препаратов для лечения ВИЧ-инфекции. "
                    "Важно получать одновременно несколько препаратов, "
                    "которые действуют на разные этапы развития вируса. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 6 Антиретровирусные препараты
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kGrayishBlue,
              child: Text(
                "До настоящего времени не разработано лекарство, которое могло бы полностью излечить "
                "человека от ВИЧ-инфекции, и нет вакцины, которая могла бы защитить от заражения ВИЧ. "
                "Поэтому человек с ВИЧ должен постоянно получать лечение всю свою жизнь.",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: fontSize,
                    color: CupertinoColors.black),
              ),
            ),
            RichText(
              text: TextSpan(children: [
                boldText("\nКак действуют антиретровирусные препараты?"),
                header("Антиретровирусные препараты"),
                normalText(
                    "Антиретровирусные препараты не излечивают от ВИЧ-инфекции, а лишь подавляют "
                    "размножение вируса, обеспечивая контроль над инфекцией. С целью максимального эффекта от лечения "),
                boldText("применяются трехкомпонентные схемы лечения, "),
                normalText(
                    "то есть содержащие три антиретровирусных препарата в одной таблетке, "
                    "каждый из которых действует на разные этапы размножения вируса. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 7 Антиретровирусные препараты
  Widget _page7(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Они, дополняя друг друга защищают организма от ВИЧ. Например:\n"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Препараты зидовудин, ламивудин, невирапин, эфавиренц нарушают процесс размножения "
                              "ВИЧ внутри клетки",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Лопинавир/ритонавир нарушают процесс дозревания ВИЧ, что также блокирует размножение вируса.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Долутогравир подавляет фермент интегразу – которая запускает размножение вируса в клетке СД-4 человека.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\nВ результате применения АРТ, содержание ВИЧ в организме уменьшается в миллионы раз, "
                    "и он практически перестает размножаться. Если ВИЧ не размножается, он больше не поражает "
                    "иммунные клетки. С этого времени иммунная система начинает восстанавливаться."),
                normalText(
                    "\n\nСхему лечения определяет врач, с учетом особенностей здоровья и результатов лабораторного исследования. "
                    "В одной таблетке может содержаться 1, 2, или 3 препарата. Ежедневно принимают от одной до трех "
                    "(иногда до шести) таблеток. Это зависит от состояния иммунитета и устойчивости вируса к препаратам.")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 8 Антиретровирусные препараты
  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText(
                    "Для того, чтобы контролировать лечение, нужно регулярно сдавать кровь на вирусную нагрузку.\n"),
                boldText(
                    "Когда АРТ перестает работать (не снижается вирусная нагрузка)?\n"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Чаще всего это связано с низкой приверженностью к лечению - когда ЛЖВ по разным причинам пропускают прием препаратов.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Иногда сам ВИЧ приспосабливается и становится невосприимчивым (устойчивым) к действию лекарств.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                boldText(
                    "Такие случаи нужно обсудить с врачом и совместно решать проблему.\n"),
                boldText(
                    "\nНазначение АРВП проводится в строгом соответствии с инструкциями, которые утверждаются Министерством здравоохранения (они называются Клинические протоколы)."),
                boldText(
                    "\n\nВ мире ведется постоянная работа по созданию новых более эффективных лекарств для лечения ВИЧ-инфекции.\n"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 9 Воздействие АРТ на человека с ВИЧ
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Воздействие АРТ на человека с ВИЧ"),
                normalText(
                    "Лечение ВИЧ-инфекции (АРТ) позволяет продлить жизнь, улучшить ее качество, предотвратить"
                    " развитие СПИДа, снизить уровень смертности среди людей с ВИЧ, снизить риск передачи ВИЧ, "
                    "а также предотвратить передачу ВИЧ от ВИЧ-позитивной матери ребенку.")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Улучшается качество жизни, то есть заболевания, связанные с ВИЧ (например, длительная диарея, туберкулез, частые ангины, герпес, кожный зуд и другие), "
                              "не появятся либо будут лучше поддаваться лечению на фоне АРТ. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Увеличится продолжительность жизни, т. е. продолжительность жизни людей с ВИЧ, получающих АРТ, практически не отличается от таковой у людей без ВИЧ.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 10 Воздействие АРТ на человека с ВИЧ
  Widget _page10(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "АРТ может снизить риск передачи ВИЧ половому партнеру более, чем на 90 %! "
                              "То есть помимо положительного воздействия на организм человека с ВИЧ, АРТ "
                              "также помогает улучшить семейные отношения, снизить страх инфицирования ВИЧ "
                              "партнера. Однако АРТ должна обязательно использоваться с комбинации с другими"
                              " методами профилактики передачи ВИЧ, в том числе с использованием презервативов.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Прием АРТ позволяет планировать беременность и обеспечивает рождение здорового ребенка у родителей, живущих с ВИЧ.  ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text: "Улучшаются лабораторные показатели:",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: Text("-"),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "снижение вирусной нагрузки до неопределяемого уровня означает, что терапия эффективна, что ВИЧ не размножается и не поражает иммунные клетки;",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 11 Воздействие АРТ на человека с ВИЧ
  Widget _page11(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: Text("-"),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "повышение количества CД4-клеток означает, что иммунная система восстанавливается и серьезные сопутствующие заболевания не разовьются;",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50),
                  child: Text("-"),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "возможно улучшение других лабораторных показателей (например, повышение уровня гемоглобина, нормализация печёночных тестов).",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Улучшается настроение, поскольку снимается чувство беспокойства за близких, за возможность передачи ВИЧ половым партнерам, за планирование рождения детей. Улучшаются семейные отношения, особенно в тех случаях, когда близкие родственники вовлечены в процесс наблюдения и лечения.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Назначение АРТ у детей обеспечивает их рост и развитие в соответствии с их возрастом, как и у детей без ВИЧ.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 12 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page12(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header(
                    "Ссылка: Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/virus_nagruzka.png"),
            RichText(
              text: TextSpan(children: [
                boldText(
                    "\nЛимфоциты CД4 (или CД4-клетки) – это вид лимфоцитов (клетки-помощники), которые играют важную роль в иммунном ответе организма.")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Тест на CД4 определяет количество лимфоцитов CД4 в одном микролитре крови (клеток/мкл).",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 13 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page13(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "В норме количество лимфоцитов CД4 для взрослых без ВИЧ составляет примерно от 500 до 1200/мкл.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Пока число лимфоцитов CД4 превышает 500/мкл, человек находится в безопасности. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "При снижении числа лимфоцитов CД4 менее 350/мкл могут начаться проблемы со здоровьем в виде частых простудных заболеваний, молочницы (кандидоз полости рта, половых органов), опоясывающего лишая, туберкулеза лёгких и др.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "При снижении уровня CД4-клеток менее 200/мкл повышается риск развития опасных для жизни инфекций – пневмоний, сепсиса, токсоплазмоза, которые очень сложно лечить, человек полностью истощен и может погибнуть без лечения.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "На фоне приёма АРТ количество лимфоцитов CД4 увеличивается, однако рост числа клеток у разных пациентов происходит по-разному. В среднем можно ожидать повышения числа клеток на 50-100/мкл в год в течение 3-5 лет после начала АРТ. Далее рост замедляется. У пожилых людей, и у больных с очень низким числом клеток, число СД4 восстанавливается очень медленно. Это означает, что несмотря на малое количество, организм все еще остается без защиты. Поэтому при низких показателях СД4 принимают дополнительные лекарства для профилактики туберкулеза и других инфекций.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 14 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page14(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText(
                    "Вирусная нагрузка (сокращенно – ВН) — это количество копий ВИЧ в 1 миллилитре крови (копий/мл).\n")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Этот показатель показывает эффективность АРТ. Целью приёма АРТ является снижение ВН до неопределяемого уровня.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Неопределяемым считается уровень, когда ВН снизится до 40 копий/мл, ниже этого количества аппарат уже не может определить ВИЧ в крови.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Чаще всего ВН становится неопределяемой через 6 месяцев после начала АРТ. Если этого не происходит, то нужно обсудить с врачом причину и принять меры для снижения вируса в крови.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 15 Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?
  Widget _page15(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText(
                    "Как часто нужно сдавать анализы на число CД4-клеток и ВН?\n\n"),
                normalText(
                    "Эти исследования проводятся при установлении ВИЧ-статуса либо при возобновлении АРТ после перерыва в лечении. \nТест на ВН очень важно проводить регулярно "
                    "1 раз в 6 месяцев – поскольку он показывает эффективность лечения. При недоступности такого исследования, "
                    "например, если человек длительно находится в миграции в других странах, тест на ВН следует проводить не "
                    "реже 1 раза в год\n"),
                normalText(
                    "\nЕсли количество СД-4 клеток не ниже 500 клеток в 1 мкл., человек хорошо переносит терапию и "
                    "не имеет проблем со здоровьем, тест на СД-4 можно не проводить."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 16 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page16(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/treatment_image51.png", scale: 2),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Приверженность к АРТ означает прием антиретровирусных препаратов пациентом с точным "
                    "соблюдением времени приема и дозы, которые были рекомендованы врачом.\nВысокая приверженность "
                    "АРТ – важнейшее условие успеха лечения. "),
                TextSpan(
                  text:
                      "\n\nДля эффективного подавления размножения ВИЧ (то есть до достижения неопределяемой вирусной нагрузки) "
                      "необходимо принимать 95 –100 % предписанных доз препаратов. ",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: "95 –100 % предписанных доз препаратов. ",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    )),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 17 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page17(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Люди иногда допускают ошибки в приеме препаратов по невнимательности, забывчивости либо "
                    "неверия в эффективность лечения. Поэтому важно получить информацию об АРТ и получить "
                    "поддержку от своих близких или людей, которые живут с ВИЧ, и могут открыто говорить "
                    "о своем статусе. Можно принять участие в группах поддержки (группы само и взаимопомощи) "
                    "из числа ЛЖВ и/или сообщества. Они помогут справиться со стрессом, связанным с принятием "
                    "ВИЧ-статуса; помогут на начальном этапе лечения по ВИЧ-инфекции, напомнят о приеме "
                    "препаратов; окажут другую помощь."),
                //TODO Картинка часы
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 18 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page18(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("Почему важно принимать препараты точно по времени?"),
                //TODO Картинка часы
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Для каждого препарата рассчитана такая дозировка и такая частота приёма, чтобы в "
                              "крови постоянно поддерживалось определённое количество лекарства. Только в этом"
                              " случае ВИЧ не размножается, и не формируются его изменения (мутации), которые "
                              "могут стать причиной устойчивости к антиретровирусным препаратам – и лечение "
                              "перестанет действовать на вирус.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "При пропуске препарата количество лекарства в крови снижается, и ВИЧ начинает "
                              "размножаться. При этом могут образоваться вирусы-мутанты, которые обладают "
                              "устойчивостью к антиретровирусным препаратам. В результате назначенная схема "
                              "АРТ перестает действовать. Это приводит к замене схемы лечения, что может "
                              "сопровождаться увеличением количества принимаемых таблеток. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 19 ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ
  Widget _page19(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Чем чаще повторяются пропуски, тем больше шансов, что вирус приспособится и станет устойчивым к антиретровирусным препаратам. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Допустимо отклонятся на один час от предписанного времени приема лекарств в ту или "
                              "иную сторону, но лучше всего ориентироваться на прием лекарств в одни и те же "
                              "часы - для этого можно использовать оповещение на мобильном телефоне, увязать"
                              " прием препаратов с обычным ежедневным действием (умыванием, завтраком, ежедневным "
                              "выходом на работу) либо попросить помощи друзей или родственников.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          children: [
                            normalText(
                                "При пропуске приема очередной дозы препарата её можно принять только в том "
                                "случае, если до времени следующего приема осталось "),
                            boldText("более 6 "),
                            normalText(
                                "часов (для лекарств, которые принимают два раза в день, например, Комбивир) или "),
                            boldText("более 12 часов "),
                            normalText(
                                "(для лекарств, которые принимают один раз в день, например, Атрипла)."),
                          ],
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 20 Как повысить приверженность к АРТ
  Widget _page20(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Нужно узнать больше о действии вируса и важности приема АРТ. "
                          "Вы можете прочитать книгу «Позитивная жизнь или "
                          "прослушать в записи Школу пациента в этом мобильном приложении. "),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Нужно получать только достоверную информацию из надежных источников. "
                          "Она изложена в данном мобильном приложении или на других сайтах, о которых "
                          "Вы можете узнать здесь же. Кроме того, эту информацию Вы получите от врача "
                          "или сотрудников НПО."),
                    ),
                  ),
                ),
              ],
            ),
            // Text("Картинка Книги или скан мобильного приложения",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Можно привязать прием препаратов к повседневным делам (например, к чистке зубов)."),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Использовать напоминающие приспособления (таймеры сотовых телефонов)."),
                    ),
                  ),
                ),
              ],
            ),
            // Text("Картинка телефона, часы",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Записать рекомендации врача и следовать им."),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Составить календарь посещения врача с учетом возможных выходных и праздничных дней, чтобы получать препараты заранее до их полного использования."),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 21 Как повысить приверженность к АРТ
  Widget _page21(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            // Text("Картинка Календарь и ручка",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Использовать контейнеры для таблеток или аптечки-органайзеры."),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Общение с равными себе людьми (с ЛЖВ), которые оказывают моральную поддержку и практическую помощь."),
                    ),
                  ),
                ),
              ],
            ),
            // Text("Картинка групповая работа",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: fontSize,
            //         fontWeight: FontWeight.w600)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Найти компаньона по лечению – человека, который будет рядом и будет помогать (родственник, друг или патронажная медсестра, хотя бы на начальном этапе лечения)."),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: italicText(
                          "Включение в программы заместительной терапии метадоном для ЛЖВ, которые принимают наркотики."),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 22 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page22(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header(
                    "НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/doctor2.png"),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Лекарственные препараты принимают для специальных целей, например, чтобы избавиться "
                    "от кашля, подавить размножение вируса. Однако каждое лекарство может оказать какое-то другое "
                    "влияние на организм – это называют "),
                boldText("«нежелательный» "),
                normalText("или"),
                boldText("«побочный эффект». "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 23 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page23(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText(
                    "Разработка новых лекарств для лечения ВИЧ-инфекции направлена также на снижение "
                    "нежелательных эффектов от их применения. ")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Практически все, лекарства, в том числе антиретровирусные препараты в той или иной степени имеют побочные эффекты.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Нежелательные эффекты антиретровирусных препаратов могут иметь определенные проявления, а иногда только изменения лабораторных показателей (например, «печеночных тестов»).",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Следует помнить, что иногда такие эффекты наблюдаются в силу психологического ожидания таких эффектов. ЛЖВ слышат от своих знакомых, получающих АРТ, что у них появляются побочные эффекты и заранее испытывают страх перед терапией, прислушиваются к своим ощущениям.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 24 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page24(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Побочные реакции бывают не у каждого пациента.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Нужно понимать, что эти реакции могут проходить по мере принятия препаратов, либо имеются некоторые условия для снижения таких реакций. Например, врач назначает прием препарата до или после еды; прием на ночь и другое – это все направлено на снижение побочных эффектов.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(children: [
                        italicText(
                            "Эффект от приема препаратов значительно выше, чем их негативное воздействие – поэтому в интересах здоровья и жизни следует принять некоторые нежелательные эффекты от лечения и попытаться их преодолеть, советуясь с врачом. "),
                        normalText(
                            "Обо всех своих нежелательных ощущениях после начала терапии, следует сообщать врачу. Если же побочные явления тяжелые – врач может изменить схему лечения. "),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(children: [
                        normalText(
                            "Некоторые побочные эффекты наблюдаются только в первые дни и недели приёма АРТ. Они обычно проходят самостоятельно без какого-либо лечения."),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страица 25 НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.
  Widget _page25(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText(
                    "Можно ли предотвратить побочные эффекты антиретровирусных препаратов?\n"),
                normalText(
                  "Иногда врач может снизить риск возникновения побочных эффектов, правильно подобрав "
                  "схему лечения. Например, если у пациента есть анемия, ему не назначают препараты, которые "
                  "могут её усугубить (например, зидовудин). Другой пример: если у пациента имеется гепатит, "
                  "ему нежелательно назначать невирапин, который может вызвать ухудшение состояния печени.\n\n",
                ),
                normalText(
                  "В некоторых случаях за побочные эффекты могут принять проявления других заболеваний. "
                  "Например, рвота и диарея могут быть связаны не с приёмом АРТ, а с острой кишечной инфекцией. ",
                ),
                boldText(
                    "Поэтому пациенту всегда следует сообщать врачу о всех новых симптомах, которые появились после начала АРТ."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  //endregion

  Widget _appBar() {
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

  double currentPage = 0;
  int lastPage = 24;

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          if (value == lastPage)
            await Doctor.showDialogFunc(
              context: context,
              text: textNadya,
              doctor: Doctors.Nadezhda,
              fontSize: 18,
            );
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterTwoCallback((value + 1) * 100 / pages.length);
        },
        children: pages,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      _page1(context),
      _page2(context),
      _page3(context),
      _page4(context),
      _page5(context),
      _page6(context),
      _page7(context),
      _page8(context),
      _page9(context),
      _page10(context),
      _page11(context),
      _page12(context),
      _page13(context),
      _page14(context),
      _page15(context),
      _page16(context),
      _page17(context),
      _page18(context),
      _page19(context),
      _page20(context),
      _page21(context),
      _page22(context),
      _page23(context),
      _page24(context),
      _page25(context),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
          onTap: () {
            Navigator.of(context).pop();
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
        title: Text(
          '${'hiv_infection_treatment'.tr()}',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            _chapters(context, pages),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.transparent,
                  ),
                ),
                GestureDetector(
                  onTap: () => pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            BottomSlider(
              currentPage: currentPage + 1,
              maxPage: pages.length,
              currentPageCallback: (value) {
                pageController.jumpToPage(value.toInt());
              },
            ),
          ],
        ),
      ),
    );
  }
}
