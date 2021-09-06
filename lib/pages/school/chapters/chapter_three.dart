import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../doctors_component.dart';

class ChapterThree extends StatefulWidget {
  const ChapterThree({Key key, this.chapterThreeCallback}) : super(key: key);

  final Function(double) chapterThreeCallback;

  @override
  _ChapterThreeState createState() => _ChapterThreeState();
}

class _ChapterThreeState extends State<ChapterThree> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;
  int showChapterThreeDialog;

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

  @override
  initState() {
    super.initState();
    showChapterThreeDialog = Prefs.getInt("show_chapter_three_dialog");
    show();
  }

  String text = 'В 2019 году было зарегистрировано 28 детей до 15 лет с ВИЧ';

  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        showChapterThreeDialog == null ? Doctor.showDialogFunc(
          context: context,
          text: text,
          doctor: Doctors.Nadezhda,
          fontSize: 20,
        ).then((value) async {
          await Doctor.showInstruction(context);
        }) : Container();
        Prefs.setInt("show_chapter_three_dialog", 1);
      }
    );
  }

  //region Pages
  /// Страница 1 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Планирование беременности в семьях, живущих с ВИЧ "),
                boldText("Как предупредить заражение ВИЧ своих детей?")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('1. Предупреждение ВИЧ-инфекции ', style: TextStyle(color: Colors.red, fontSize: fontSize)),
                      SizedBox(height: 20),
                      Text('2. Тестирование на ВИЧ обоих родителей', style: TextStyle(color: kDarkModerateBlue, fontSize: fontSize)),
                      SizedBox(height: 20),
                      Text('3. Профилактика нежелательной беременности', style: TextStyle(color: kModerateBlue, fontSize: fontSize)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text('4. Профилактика передачи ВИЧ от ВИЧ+ матери ребенку', style: TextStyle(color: Colors.orange, fontSize: fontSize)),
                      SizedBox(height: 20),
                      Text('5. Предоставление лечения, помощи и поддержки ВИЧ-позитивным женщинам, их детям и семьям', style: TextStyle(color: Colors.deepPurple, fontSize: fontSize)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/beremennost1.png'),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "ВИЧ может передаваться от ВИЧ-позитивной матери ребенку, но важно, чтобы и мать,"
                    " и отец предпринимали меры для предупреждения передачи ВИЧ детям при планировании "
                    "беременности, во время беременности, во время родов и при кормлении ребенка грудью.\n"),
                boldText(
                    "\nПредупреждение передачи ВИЧ в дискордантных парах, где мужчина инфицирован ВИЧ"),
                normalText(
                    "\nДискордантные пары – это семейные пары, где один из супругов инфицирован ВИЧ. Если "
                    "один из супругов инфицирован ВИЧ, то важно предупредить передачу ВИЧ половому партнеру. "
                    "Для этого используют презерватив при каждом половом контакте.")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/prophylaxis/1/3.gif'),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 2 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page2(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Если только мужчина инфицирован ВИЧ, а пара планирует беременность, особенно важно, "
                    "чтобы мужчина правильно принимал АРТ и достиг неопределяемой вирусной нагрузки (менее 1000 "
                    "вирусов в 1 капле крови). Зачатие ребенка можно планировать только при неопределяемой вирусной "
                    "нагрузке, чтобы не подвергать женщину и ребенка риску инфицирования ВИЧ."),
               ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/beremennost3.gif"),
            RichText(
              text: TextSpan(children: [
                boldText("\n\nПланирование беременности"),
                normalText(
                    "\nКаждая пара сама решает, когда и сколько детей им иметь. Однако, нужно планировать "
                    "беременность, учитывая состояние здоровья родителей, а также интервал между родами не "
                    "менее 3 лет. Все это может оказать воздействие не только на передачу ВИЧ ребенку, но и "
                    "на состояние здоровья матери и ребенка. При планировании беременности "
                    "важно убедиться, что:"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "- каждый ВИЧ-позитивный родитель правильно принимает АРТ и имеет неопределяемую вирусную нагрузку;",
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
                              "- оба родителя не имеют заболеваний (ИППП, другие воспалительные заболевания половых органов, "
                              "туберкулез, вирусные гепатиты, онкологические заболевания и др.) или"
                              " провели их лечение до наступления беременности;",
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
  /// Страница 3 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page3(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                              "- оба родителя не употребляют алкоголь и/или наркотики либо проходят соответствующее "
                              "лечение (для инъекционных потребителей наркотиков, рекомендуется участие в программе "
                              "поддерживающей терапии метадоном);- оба родителя отказались от курения (либо "
                              "существенно снизили количество сигарет).",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(children: [
                boldText(
                    "\nПо вопросам планирования беременности нужно советоваться с лечащим врачом.")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страница 4 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Профилактика передачи ВИЧ от матери ребенку"),
               ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/profilactika1.png'),
            RichText(
              text: TextSpan(children: [
                boldText("Ведение беременности\n\n"),
                normalText(
                    "Беременность у ВИЧ-позитивной женщины при хорошем состоянии здоровья протекает так же, как у женщины без ВИЧ.\n"),
                normalText(
                    "\nБеременность – естественный процесс, но он сопровождается значительной перестройкой женского организма и повышает нагрузку на все органы (легкие, сердце, сосуды, почки, печень и др.). Поэтому к беременности нужно готовиться, ее нужно планировать, оценивать состояние вирусной нагрузки и правильно принимать АРТ. Это позволит не только сохранить здоровье ВИЧ-позитивной матери, но предотвратить передачу ВИЧ ребенку."),
                boldText(
                    "\n\nВо время беременности особенно важно правильно принимать АРТ, либо начать прием АРТ, если по каким-либо причинам женщина еще не получала АРТ до беременности. Важно иметь неопределяемую вирусную нагрузку. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset('assets/images/profilactika2.gif'),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 5 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Также важны хорошее питание, соблюдение режима работы и отдыха, поддержка близких, регулярное наблюдение у врача как по ВИЧ-инфекции, так и по беременности. "),
                boldText("\n\nВедение родов\n\n"),
                normalText(
                    "Решение о порядке родоразрешения зависит от состояния вирусной нагрузки и течения беременности. Если состояние женщины хорошее и вирусная нагрузка неопределяемая, то роды проходят естественным путем. В других случаях врач может предложить операцию (кесарево сечение). Выбор операции или естественных родов определяется по желанию женщины с учетом не только ВИЧ-статуса, но и течения беременности."),
                boldText(
                    "\n\nПомощь ВИЧ-позитивной женщине в послеродовый период\n\n"),], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/beremennost4.gif"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                italicText(
                    "Женщине после рождения ребенка проводится консультирование и назначается контрацепция для предупреждения нежелательной беременности. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 6 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\nВажно оказать помощь женщине после родов, чтобы она имела возможность для отдыха и хорошего питания,"),
                italicText(
                    " а также создать условия, чтобы женщина не прерывала прием АРТ после родов."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/beremennost5.gif"),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "Неопределяемая Вирусная Нагрузка дает возможность:",
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "- предотвратить передачу ВИЧ от матери ребенку,",
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: "\n- выбора естественных родов (без операции),",
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: "\n- естественного грудного вскармливания ребенка,",
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text:
                        "\n- уменьшения продолжительности приема АРВ-препаратов ребенком после рождения.",
                    style: TextStyle(
                        color: kDesaturatedBlue,
                        fontSize: fontSize,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600)),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  /// Страница 7 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page7(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header(
                    "Наблюдение за ребенком, рожденным у ВИЧ-позитивной матери"),
                normalText(
                    "Если у женщины неопределяемая вирусная нагрузка, разрешается естественное вскармливание ребенка – кормление грудью, которое проводится до 6 месяцев, при условии только грудного вскармливания, по требованию ребенка, без добавления искусственных смесей и воды. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/nabludenie1.png"),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\n\nЕсли же у женщины высокая вирусная нагрузка или она не принимает АРТ, грудное вскармливание может привести к инфицированию ВИЧ новорожденного ребенка. В таких случаях назначают искусственное вскармливание с рождения. Предусмотрено бесплатное предоставление заменителей грудного молока для таких детей, которое Вы сможете получить в поликлинике по месту жительства. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/nabludenie2.png"),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\n\nСразу после рождения ребенку назначают АРТ в течение 6-12 недель – это важно для профилактики инфицирования ВИЧ. Доза и продолжительность АРТ зависят от приема АРТ и состояния вирусной нагрузки у матери."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/beremennost5.gif"),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
  /// Страница 8 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Обследование новорожденных детей на ВИЧ играет важную роль для раннего выявления у них ВИЧ и своевременного назначения лечения. Обследование детей на ВИЧ проводится в срок до 48 часов после рождения; в срок 4-6 недель и, при необходимости (при положительном анализе на ВИЧ), в 3-4 месяца. Детям, у которых выявлен положительный результат на ВИЧ, при любом из этих исследований, назначается АРТ. Окончательный диагноз ставится в 18 месяцев после рождения."),
                boldText(
                    "\n\nВсе дети, рожденные у ВИЧ-позитивных матерей, независимо от ВИЧ-статуса имеют право на получение государственного социального пособия с момента рождения до 18 месяцев после рождения. "),
                normalText(
                    "\n\nСвоевременное выявление ВИЧ-инфекции у новорожденных детей важно для раннего начала лечения, планирования и проведения прививок, назначения других препаратов (котримоксазол) для профилактики инфекций. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }

  /// Страница 9 Планирование беременности в семьях, живущих с ВИЧ
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text:
                      "Ребенок, которому своевременно назначено, правильно проводится лечение и достигается неопределяемая вирусная нагрузка, хорошо развивается физически и умственно, и ни в чем не отстает от сверстников.",
                  style: TextStyle(
                      color: kDesaturatedBlue,
                      fontSize: fontSize,
                      fontStyle: FontStyle.italic),
                )
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Container(
              color: kGrayishBlue,
              child: Text(
                "Ваш ребенок имеет право на здоровье и жизнь. Думайте о своем ребенке, когда Вы принимаете решение о приеме АРТ во время беременности; о приеме АРВ-препаратов ребенком после родов; о правильном соблюдении режима лечения; о своевременном обследовании ребенка на ВИЧ.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
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

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterThreeCallback((value + 1) * 100 / pages.length);
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
        title: Text('hiv_transmission_to_child'.tr(),
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
