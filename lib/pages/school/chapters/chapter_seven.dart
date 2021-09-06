import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterSeven extends StatefulWidget {
  const ChapterSeven({Key key, this.chapterSevenCallback}) : super(key: key);

  final Function(double) chapterSevenCallback;

  @override
  _ChapterSevenState createState() => _ChapterSevenState();
}

class _ChapterSevenState extends State<ChapterSeven> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;
  int showChapterSevenDialog;

  header(String header) {
    return TextSpan(
      text: '\n$header\n',
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
  boldItalicText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600),
    );
  }

  @override
  initState() {
    super.initState();
    showChapterSevenDialog = Prefs.getInt("show_chapter_seven_dialog");
    show();
  }

  String drAza =
      'Каким бы сильным ни было ваше отчаяние, не забывайте, что ваша семья или ваши близкие любят вас, беспокоятся за вас и готовы вас поддержать.';
  String drNadya = 'Первые случаи ВИЧ среди граждан Кыргызской '
      'Республики были зарегистрированы у женщин. В '
      '1997 году был выявлен второй случай ВИЧ-инфекции. '
      'Женщина С. 23 лет была выявлена на 20-й неделе '
      'беременности. Она горько плакала, беспокоясь о '
      'здоровье своего долгожданного младенца. Она была '
      'даже готова прервать беременность, чтобы не';
  String drNadyaText2 = 'допустить, чтобы ребенок родился с ВИЧ. Ее супруг '
      '(ВИЧ-негативный) полностью поддержал ее. Он '
      'сказал: «Я люблю С. и не оставлю ее». Они обсудили '
      'ситуацию и решили сохранить беременность. В то '
      'время не было эффективных средств профилактики '
      'передачи ВИЧ от ВИЧ-позитивной матери ребенку.';
  String textAza = 'Специалисты Республиканского центра СПИД '
      'посоветовались с коллегами из России, которые '
      'привезли бесплатно единственное существующее '
      'тогда лекарство для мамы – АЗТ (азидотимидин).';
  String textAza2 = 'Ребенок родился здоровым. Супруги занимались '
  'мелким бизнесом, они были очень дружны и счастливы. '
  'Ребенок рос в окружении любящих папы и мамы, а '
  'также был любимцем всей семьи.';

  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        showChapterSevenDialog == null ? Doctor.showDialogFunc(
          context: context,
          text: drAza,
          doctor: Doctors.Azamat,
          fontSize: 20,
        ).then((value) async {
          await Doctor.showInstruction(context);
        }) : Container();
        Prefs.setInt("show_chapter_seven_dialog", 1);
      },
    );
  }

  /// Страница 1 Что следует помнить:
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  header("Что следует помнить:"),
                ], style: TextStyle(fontSize: fontSize)),
              ),
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
                              "Клетки иммунной системы (лимфоциты) играют важную роль в защите организма человека от инфекционных заболеваний, а также от злокачественных опухолей.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 1.png", scale: 7),
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
                              "Когда ВИЧ попадает в организм человека, он атакует клетки иммунной системы, которые называются Т-лимфоциты- помощники (или CД4 клетки). ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 2.png", scale: 7),
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
                              "ВИЧ вызывает заболевание, называемое ВИЧ-инфекцией. Стадию ВИЧ-инфекции, когда у пациента развиваются тяжелые инфекционные или онкологические заболевания, называют СПИД. ",
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 60),
                      child: MyBullet(),
                    )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "Если не проводится лечение, то ВИЧ разрушает так много Т-лимфоцитов,  , что они не уже не могут защищать организм. Поэтому у человека с ослабленным иммунитетом, развиваются инфекционные или онкологические заболевания. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 3.png", scale: 7),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page2(BuildContext context) {
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
                              "Специфические инфекционные заболевания у людей с ВИЧ называют оппортунистическими инфекциями (ОИ) или оппортунистическими заболеваниями (ОЗ). Эти заболевания не развиваются у людей с высоким иммунитетом.",
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
                              "При своевременно начатом и правильно проводимом лечении (строгое соблюдение дозы препарата, непрерывности лечения) антиретровирусными препаратами у ВИЧ-позитивных людей СПИД не развивается, не разовьются также и оппортунистические инфекции. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 4.png", scale: 7),
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
                              "Для человека с ВИЧ чрезвычайно важна профилактика ВИЧ-инфекции, поскольку он может быть инфицирован другой разновидностью ВИЧ повторно, что утяжелит течение болезни. Профилактика также важна для предупреждения инфицирования ИППП и инфекциями, передаваемыми через кровь (например, вирусными гепатитами). ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 5.png", scale: 1),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page3(BuildContext context) {
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
                          text: "Существует только 3 пути передачи ВИЧ: ",
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
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              " - через инфицированную ВИЧ кровь, при совместном использовании шприцев и игл и других медицинских инструментов; ",
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
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              " - при незащищенном (без презерватива) полового контакте;",
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
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              " - от ВИЧ-положительной матери ребенку во время беременности, во время родов и при грудном вскармливании.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 6.png", scale: 5),
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
                              "Постконтактная профилактика ВИЧ-инфекции (ПКП) – это срочная медицинская мера для предупреждения передачи ВИЧ после ситуации, в которой была возможна такая передача (например, после незащищенного полового контакта с ВИЧ-позитивным человеком либо при совместном употреблении наркотика путем инъекций).",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 7.png", scale: 5),
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
                              "Доконтактная профилактика (ДКП) – это предупреждение ВИЧ в случае высокого риска инфицирования. Она предполагает профилактический прием антиретровирусных препаратов здоровыми лицами для предотвращения инфицирования ВИЧ. ДКП иногда применяется в дискордантных парах ЛЖВ, когда один из партнеров инфицирован ВИЧ и не применяет АРТ, либо не достигает подавления вирусной нагрузки. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/что следует помнить 8.png", scale: 5),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///Что делать, если мне сообщили о положительном ВИЧ-статусе?
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  header(
                      "Что делать, если мне сообщили о положительном ВИЧ-статусе?"),
                ], style: TextStyle(fontSize: fontSize)),
              ),
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
                              "Нужно подумать о том, что могло привести к заражению ВИЧ-инфекцией, и сделать свой собственный выбор – продолжить жизнь, как она есть, или изменить ее к лучшему. Для лечения ВИЧ-инфекции есть лекарства.    ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/2/1.gif"),
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
                              "Нужно подумать и принять ответственное решение в отношении своей семейной жизни. Наличие ВИЧ-инфекции не означает прекращение сексуальной жизни, не ограничивает возможности создания семьи и рождения здоровых детей, но нужно помнить и объективно оценивать риск заражения близкого человека/полового партнера. Важно, как можно раньше начать АРТ, и, в зависимости от своего иммунного статуса (ВН), использовать средства защиты (презерватив), планировать беременность.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/2/2.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page5(BuildContext context) {
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
                              "Раскрытие близкому человеку/половому партнеру своего ВИЧ-статуса – также важное и ответственное решение, которое Вам нужно принять.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/2/3.gif"),
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
                              "Благодаря Антиретровирусной терапии (АРТ) люди с ВИЧ могут прожить долгую и плодотворную жизнь, и для этого нужно:",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/2/4.gif'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "принимать АРТ долгий период времени, соблюдая рекомендации лечащего врача;",
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "при наличии других заболеваний, таких как алкогольная или наркотическая зависимости, туберкулез и др., обращаться к специалистам для получения соответствующего лечения, наряду с АРТ; ",
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "при наличии возможности, пройти вакцинацию для предупреждения таких инфекций, как грипп, вирусный гепатит (по назначению врача);",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "отказаться от вредных привычек либо существенно их ограничить (например, курение);",
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "употреблять здоровую пищу и безопасную питьевую воду;",
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
                  padding: const EdgeInsets.only(top: 10, left: 60),
                  child: MyBullet(),
                )),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "правильно организовать свой распорядок дня, чередовать работу, отдых и физическую активность.",
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
                              "Помнить, что любая инфекция для человека с ВИЧ значительно опаснее, чем для человека без ВИЧ, поэтому следует строго следовать мерам профилактики передачи ВИЧ, поскольку Вы не только можете инфицировать своих партнеров, но получить дополнительную инфекцию, как половым, так и инъекционным путем.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/prophylaxis/2/5.gif'),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page7(BuildContext context) {
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
                              "Следует помнить, что ЛЖВ может повторно заразиться и другой разновидностью ВИЧ, что создает большую угрозу его здоровью.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/2/6.gif"),
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
                              "Люди, с которыми Вы имели половые контакты или использовали общие шприцы, также могут быть инфицированы ВИЧ и не знать об этом. Им нужно предложить пройти тестирование на ВИЧ, чтобы своевременно начать лечение, сохранить здоровье и жизнь. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/7.gif"),
            RichText(
              text: TextSpan(children: [
                header("Преимущества раскрытия ВИЧ-статуса своим близким"),
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
                              "Вам не нужно скрывать свое заболевание, прятать лекарства – Вы будете жить спокойно и открыто, не боясь, что Ваш статус откроется в самый неподходящий момент (например, родители решили Вас женить, Ваша супруга/партнерша забеременела и др. ситуации).",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/6.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///Преимущества раскрытия ВИЧ-статуса своим близким
  Widget _page8(BuildContext context) {
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
                              "Вы можете защитить своего близкого человека/полового партнера, снизив угрозу инфицирования его ВИЧ, Вам не придется испытывать угрызения совести или обманывать его. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/3.gif"),
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
                              "Вам будет оказана поддержка на этапе принятия статуса, получения АРТ, в случае развития других заболеваний, в сложных жизненных ситуациях (например, при раскрытии Вашего статуса близкому окружению), как со стороны медицинских, общинных организаций, так и со стороны близкого окружения.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/4.gif"),
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
                              "Вы можете открыто обсуждать возможность начала или продолжения близких отношений, вопросы создания семьи, планирования и рождения детей.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/11.gif"),
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
                              "Вы становитесь защищены от уголовной ответственности за угрозу поставления другого лица в опасность инфицирования ВИЧ, поскольку Ваш партнер сам принимает решение о продолжении сексуальных отношений. ",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/prophylaxis/1/2.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///Означает ли диагноз ВИЧ - инфекции,
  /// что в Вашей жизни что-то должно измениться?
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header(
                    "Означает ли диагноз ВИЧ - инфекции, что в Вашей жизни что-то должно измениться?"),
                boldText("\nДА, "),
                normalText(
                    "потому что при ВИЧ-инфекции следует чувствовать себя хозяином положения, а не беспомощной жертвой. Узнайте больше о ВИЧ и СПИДе, о способах поддержки здоровья, о лечении. Нужно знать о своих правах и как их защищать. "),
                boldText("\n\nДА, "),
                normalText(
                    "потому что заботиться о своем физическом и духовном здоровье нужно уже сейчас. Постарайтесь отказаться от курения, сократить потребление алкоголя, пройти лечение наркотической зависимости либо подключиться к ОЗТ. Организуйте полноценное питание. Избегайте стрессов, не отказывайте себе во сне, отдыхе, движении на свежем воздухе, развлечениях и общении. "),
                boldText("\n\nДА, "),
                normalText(
                    "потому что в ваших силах не допустить, чтобы ваш половой партнер и другие люди заразились ВИЧ. Для этого следует правильно использовать презерватив при каждом половом контакте. Ваш половой партнер должен знать о вашем ВИЧ-статусе. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page10(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("\nДА, "),
                normalText(
                    "потому что на женщину с ВИЧ ложится дополнительное бремя заботы о предупреждении передачи ВИЧ своему новорожденному ребенку. ВИЧ передается от матери ребенку во время беременности, родов и при кормлении грудью. Назначение АРТ беременной женщине и ребенку сразу после родов позволяет предотвратить передачу ВИЧ. "),
                boldText("\n\nНЕТ, "),
                normalText(
                    "потому что вы можете продолжать работать по специальности за исключением некоторых медицинских должностей, связанных с кровью. "),
                boldText("\n\nНЕТ, "),
                normalText(
                    "потому что ваши родные, друзья, соседи не могут заразиться от вас при обычных бытовых контактах (если вы не вступаете с ними в половые контакты и не вводите наркотики одним шприцем). Поэтому нет необходимости сообщать им о своем диагнозе."),
                boldText("\n\nНЕТ, "),
                normalText(
                    "потому что ВИЧ-инфекция – это не повод отказаться от своих планов и интересов, от учебы, работы и развлечений, любви и секса."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  // ///Good news
  // Widget _page11(BuildContext context) {
  //   return Column(
  //     children: [
  //       Container(
  //         child: Image.asset("assets/images/good_news.png"),
  //       ),
  //     ],
  //   );
  // }

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

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          if (value == 10)
            await Doctor.showDialogFunc(
              context: context,
              text: drNadya,
              doctor: Doctors.Nadezhda,
              fontSize: 16,
            ).then((value) async {
              await Doctor.showDialogFunc(
                context: context,
                text: drNadyaText2,
                doctor: Doctors.Nadezhda,
                fontSize: 16,
              );
              await Doctor.showDialogFunc(
                context: context,
                text: textAza,
                doctor: Doctors.Azamat,
                fontSize: 18,
              );
              await Doctor.showDialogFunc(
                context: context,
                text: textAza2,
                doctor: Doctors.Azamat,
                fontSize: 18,
              );
            });
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterSevenCallback((value + 1) * 100 / pages.length);
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
      // _page11(context),
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
        title: Text('how_to_live'.tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
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
