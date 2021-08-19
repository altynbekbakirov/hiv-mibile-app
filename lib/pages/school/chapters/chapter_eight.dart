import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/components/bullet.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterEight extends StatefulWidget {
  const ChapterEight({Key key, this.chapterEightCallback}) : super(key: key);

  final Function(double) chapterEightCallback;

  @override
  _ChapterEightState createState() => _ChapterEightState();
}

class _ChapterEightState extends State<ChapterEight> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;

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
    show();
  }

  String drAza = 'Американец Тимоти Браун (Timothy Brown), у которого в 1995 '
      'году был выявлен ВИЧ, с 2007 года является единственным '
      'в мире человеком (пока), который исцелился от СПИДа. '
      'Тимоти Брауну дважды сообщали, что он умрет – сначала в '
      '1995 году, когда у него обнаружили ВИЧ, а затем в 2006 году, ';

  String drAza2 = 'когда врачи выявили у него лейкемию. Он излечился от СПИДа '
      'после пересадки ему костного мозга, которое состоялось '
      'в медицинской клинике в Берлине, поэтому его называют '
      '«берлинский пациент».';

  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => Doctor.showDialogFunc(
        context: context,
        text: drAza,
        doctor: Doctors.Nadezhda,
        fontSize: 16,
      ),
    ).then((value) async {
      await Doctor.showDialogFunc(
        context: context,
        text: drAza2,
        doctor: Doctors.Nadezhda,
        fontSize: 18,
      );
    });
  }

  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  header("Если Ваш ребенок инфицирован ВИЧ"),
                  normalText(
                      "В Кыргызской Республике зарегистрировано более 700 детей до 15 лет и 199 подростков до 18 лет, живущих с ВИЧ (01.04.2021 год). "),
                  normalText(
                      "\n\nДети, которые принимают АРТ, чувствуют себя здоровыми, развиваются физически и умственно так же, как дети без ВИЧ. "),
                  boldText(
                      "Важно, чтобы дети, как можно раньше, начали прием АРТ и строго выполняли все предписания врача."),
                  normalText(
                      "\n\nМногие дети уже достигли подросткового возраста и знают о своем статусе. Другие спрашивают у родителей, почему они ежедневно пьют таблетки, когда их сверстники не принимают лекарства.  "),
                  boldText("\n\nПринять статус своего ребенка"),
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
                              "Как можно раньше узнайте ВИЧ-статус своего ребенка.",
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
                              "Установление диагноза ВИЧ-инфекции исключает какую-либо ошибку. Диагноз уточняется многократно, и родителям сообщают о ВИЧ-статусе ребенка только тогда, когда это полностью подтверждено.",
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
                              "Проконсультируйтесь с врачом, который наблюдает ребенка. При желании родителей можно получить консультацию в областном или республиканском центре СПИД. ",
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
                              "Вы можете встретиться с родителями, которые уже приняли ВИЧ-статус своих детей, и они помогут вам справиться с принятием статуса.",
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
                              "Пройдите специальное обучение («Школу пациента») в поликлинике, в НПО или в данном приложении. Это поможет понять, как ВИЧ влияет на здоровье; почему важно получать АРТ и профилактику оппортунистических инфекций.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                boldText("Наблюдение и лечение ВИЧ-позитивного ребенка "),
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
                              "Важно начать лечение как можно раньше, чтобы сохранить иммунную систему ребенка. Лечение обеспечит нормальное физическое и умственное развитие ребенка, а также сохранит ему жизнь. ",
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
                          text:
                              "Следует строго выполнять назначения врача: принимать лекарства в той дозе, которую прописал врач; постоянно в строго в установленное время, не допуская перерывов в лечении, вовремя получать препараты.",
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
                              "Нужно в установленные сроки посещать врача и проходить необходимые обследования, а также получать прививки.",
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
                              "Любые назначения по сопутствующим заболеваниям ребенка следует согласовывать с лечащим врачом, т.к. это может повлиять на эффективность лечения.",
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
                              "Своевременно реагировать на любые изменения в состоянии здоровья ребенка и сразу же сообщать об этом врачу. Отслеживать эффективность лечения – т.е. снижение вирусной нагрузки.",
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

  Widget _page4(BuildContext context) {
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
                              "Вовлекать ребенка в процесс приема препаратов, воспитывая у него привычку и ответственность за лечение. ",
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
                              "Быть настойчивым и терпеливым в обеспечении приема препаратов ребенком, не используя насилия или наказаний, а только разъяснения и убеждение.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: boldText(
                  "Детям, которые живут с ВИЧ, назначается государственное пособие в размере 4 000 сомов до достижения ими возраста 18 лет. "),
            ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  header("Общение и воспитание ребенка, живущего с ВИЧ"),
                  normalText(
                      "\nДетям важен физический и эмоциональный контакт с родителями (ласковое поглаживание и спокойная речь, забота, внимание). Воспитание ребенка с ВИЧ ничем не отличается от воспитания обычного ребенка. Ребенку нужны добрые отношения внутри семьи и общение со сверстниками. Дети, живущие с ВИЧ, должны играть, учиться, заниматься спортом вместе с другими детьми. Необходимо следить за тем, чтобы ребенок не уставал и не переутомлялся. "),
                  normalText(
                      "\n\nБудьте другом своему ребенку, откровенно говорите о разных проблемах, в том числе о сексуальных отношениях, будущей профессии, взаимоотношении со сверстниками."),
                  normalText(
                      "\n\nУмейте слушать Ваших детей, не обрывая, не критикуя, спокойно реагировать на его непростые вопросы и попытайтесь обсудить их доброжелательно и спокойно. "),
                ], style: TextStyle(fontSize: fontSize)),
              ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  normalText(
                      "\nУважайте ребенка, его мнения, тревоги и опасения. Для него важно, чтобы было с кем поделиться своими проблемами и что его выслушают. "),
                  normalText(
                      "\n\nВырабатывайте у ребенка чувство собственного достоинства, которое позволит ему получить навык отстаивания своих интересов."),
                  normalText(
                      "\n\nХвалите ребенка, вовлекайте в посильные домашние и общественные дела. "),
                  normalText(
                      "\n\nВ подростковом возрасте говорить с детьми о сексе. Если Вы не можете ответить на некоторые вопросы, вы можете позволить ребенку обсудить это с психологом либо с лечащим врачом. "),
                  normalText(
                      "\n\nГоворите о безопасности: о сексуальном насилии и как его можно избежать; об алкоголе, курении и наркотиках. ")
                ], style: TextStyle(fontSize: fontSize)),
              ),
            ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  boldText("Раскрытие ВИЧ-статуса ребенку"),
                  normalText(
                      "\n\nНе нужно слишком рано говорить детям о ВИЧ статусе, поскольку дети могут рассказать об этом другим людям, что может привести к нежелательным последствиям, как для детей, так и семей, живущих с ВИЧ. Но можно говорить о правильном отношении к своему здоровью с раннего возраста."),
                  normalText(
                      "\n\nРаскрытие статуса рекомендуется детям в 10-12 лет. Лучше всего, если открытие ВИЧ статуса подросткам будут делать родители. Если же вам удастся наладить контакт с детьми с самого детства, то вы сможете рассказать ребенку о ВИЧ, о причинах его заражения, а также о жизни с ВИЧ. "),
                  normalText(
                      "\n\nПомощь в раскрытии ВИЧ-статуса ребенку оказывают врачи центров СПИД, психологи, некоторые обученные педагоги и представители НПО. После раскрытия статуса дети нуждаются в психологической поддержке для принятия своего статуса и формирования приверженности к лечению. В этих вопросах помощь могут оказать молодые лидеры из числа ЛЖВ.  "),
                ], style: TextStyle(fontSize: fontSize)),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

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
        onPageChanged: (value) {
          if (value == 6)
            Doctor.showDialogs(context);
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterEightCallback((value + 1) * 100 / pages.length);
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
                child: Text(
                  "Aa",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
        title: Text(
          'how_to_live'.tr(),
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            _chapters(context, pages),
            BottomSlider(
              currentPage: currentPage + 1,
              maxPage: pages.length,
            ),
          ],
        ),
      ),
    );
  }
}
