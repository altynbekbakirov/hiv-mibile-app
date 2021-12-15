import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterFour extends StatefulWidget {
  const ChapterFour({Key key, this.chapterFourCallback}) : super(key: key);

  final Function(double) chapterFourCallback;

  @override
  _ChapterFourState createState() => _ChapterFourState();
}

class _ChapterFourState extends State<ChapterFour> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;
  int showChapterFourDialog;

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
  void initState() {
    super.initState();
    showChapterFourDialog = Prefs.getInt("show_chapter_four_dialog");
    show();
  }

  String textAza =
      'Специфические инфекционные заболевания у людей с ВИЧ называют оппортунистическими инфекциями (ОИ).';
  String textNadya =
      'Важно помнить, что специалистам, вовлеченным в процесс оказания услуг по вопросам лечения и ухода для ЛЖВ, следует предлагать все усилия для максимально раннего начала АРТ, как только в этом возникнет необходимость (при числе лимфоцитов CД4 менее 500 клеток/мкл). Раннее начало АРТ позволяет избежать возникновения таких серьезных ОИ, как ПЦП, а также таких дополнительных вмешательств, как профилактическое лечение котримоксазолом.';

  show() async {
    await Future.delayed(const Duration(seconds: 1), () {
      showChapterFourDialog == null ?
      Doctor.showDialogFunc(
        context: context,
        text: textAza,
        doctor: Doctors.Azamat,
        fontSize: 20,
      ).then((value) async {
        await Doctor.showInstruction(context);
      }) : Container();
      Prefs.setInt("show_chapter_four_dialog", 1);
    });
  }

  //region Pages
  /// Страница 1 Оппортунистические инфекции (ОИ)
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Оппортунистические инфекции (ОИ)"),
                normalText(
                    "Оппортунистические инфекции (ОИ) – это особые заболевания, которые развиваются только при снижении иммунитета. Вирус иммунодефицита человека (ВИЧ), убивает клетки иммунной системы, в результате иммунитет снижается и присоединяются оппортунистические инфекции, которые не вызывают заболевания у человека с сильной иммунной системой. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/oportunisticheskie1.png"),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\n\nОсновным показателем состояния иммунной системы – является количество иммунных клеток – СД4 лимфоцитов. Снижение числа СД4  ниже 350 клеток/мкл, говорит о существенном снижении иммунитета и высоком риске возникновении оппортунистических инфекций. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\n\nЧаще всего из ОИ встречается туберкулез, пневмоцистная пневмония, токсоплазмоз, саркома Капоши (рак кожи), грибковые поражения и другое."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 2 Оппортунистические инфекции (ОИ)
  Widget _page2(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Основные проявления ОИ:"),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/oportunisticheskie2.png"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "Проявления и время проявления ОИ у каждого человека разное. У ВИЧ-позитивного человека с хорошим состоянием иммунитета, оппортунистические инфекции не возникают или протекают в легкой форме. Основные проявления:"),
                normalText(
                    "\n - постоянная слабость, усталость, повышенная утомляемость;"),
                normalText("\n - увеличение лимфатических узлов;"),
                normalText("\n - потеря массы тела (исхудание);"),
                normalText(
                    "\n - длительная лихорадка (повышение температуры тела);"),
                normalText("\n - ночная потливость;"),
                normalText("\n - постоянные головные боли;"),
                normalText("\n - кашель и одышка (затрудненное дыхание);"),
                normalText(
                    "\n - стоматит (воспаление и язвы слизистой оболочки полости рта);"),
                normalText(
                    "\n - заболевания ЛОР-органов (ангина, отит, синусит);"),
                normalText(
                    "\n - поражения кожи (герпес, опоясывающий лишай, грибок ногтей и др.)."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 3 Оппортунистические инфекции (ОИ)
  Widget _page3(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Чем опасны оппортунистические инфекции"),
                normalText(
                    "Оппортунистические инфекции при развитии иммунодефицита могут привести"
                    " к серьезным проблемам здоровья у ВИЧ-инфицированных людей. "
                    "Некоторые инфекции могут развиваться только у людей с ВИЧ (например, токсоплазмоз), другие – в сочетании с "
                    "ВИЧ протекают очень тяжело и (например, туберкулез).   ОИ являются основной причиной смерти людей, живущих "
                    "с ВИЧ."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 4 Оппортунистические инфекции (ОИ)
  Widget _page4(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Как предупредить развитие ОИ"),
                normalText(
                    "Раннее начало лечения ВИЧ-инфекции АРВ препаратами, высокая приверженность к терапии является основным способом предупреждения ОИ."),
                normalText(
                    "\n\nПлохое питание, нарушение режима сна и отдыха, потребление алкоголя и наркотиков приводит к снижению иммунитета и повышает риск развития ОИ."),
                normalText(
                    "\n\nКонтакт с животными, употребление в пищу некипяченого молока, сырых яиц или плохо проваренного мяса; уход за животными; контакт с больными инфекционными заболеваниями, незащищенные половые контакты повышают риск заражения ОИ. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 5 Оппортунистические инфекции (ОИ)
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("Для сохранения здоровья нужно:"),
                normalText(
                    "\n- пить бутилированную или кипяченую воду для профилактики кишечных инфекций;"),
                normalText(
                    "\n- избегать контакта с людьми с инфекционными заболеваниями, часто и правильно мыть руки; носить защитную маску в общественных местах или при контакте с больными;"),
                normalText(
                    "\n- проветривать помещение, соблюдать личную гигиену (содержать руки и тело в чистоте); регулярно гулять на свежем воздухе;"),
                normalText(
                    "\n- женщинам с ВИЧ ежегодно проходить гинекологическое обследование, что позволит предотвратить либо вовремя выявить онкологические заболевания. "),
                normalText(
                    "\n- избегать стрессов, потребления алкоголя, никотина и наркотиков;"),
                normalText(
                    "\n- получать прививки для детей и взрослых по назначению врача. Они помогут защититься от инфекций;"),
                normalText(
                    "\n- при половых контактах всегда использовать презерватив."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/prava2.png"),
            RichText(
              text: TextSpan(children: [
                boldText(
                    "\n\nОппортунистические инфекции появляются при ослаблении иммунитета. "),
                normalText(
                    "Поэтому важно обследоваться на СД4-клетки и своевременно получить лекарства для профилактики ОИ при низком уровне СД4. ")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 6 Туберкулез у людей с ВИЧ
  Widget _page6(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                header("Туберкулез у людей с ВИЧ"),
                boldText("Как передается туберкулез"),
                normalText(
                    "\n    Туберкулез – инфекционное заболевание, передающееся от больного туберкулезом здоровому человеку при кашле, чихании и разговоре. Туберкулезом можно также заразиться через продукты (некипяченое молоко, сырые яйца, не проваренное мясо). Туберкулез является одной из причин смертности среди людей, живущих с ВИЧ."),
                boldText("\n\nКак проявляется туберкулез у людей с ВИЧ"),
                normalText(
                    "\n    Туберкулез – это одна из основных оппортунистических инфекций при ВИЧ-инфекция, что связано со снижением иммунитета. У людей с ВИЧ туберкулез протекает более тяжело. При числе СД4 менее 200 клеток/мкл, туберкулез может поражать не только легкие, но также позвоночник, головной мозг, сердце, почки, кости и другие органы. Туберкулез также приводит к ухудшению течения ВИЧ-инфекции – повышению вирусной нагрузки ВИЧ, что приводит к еще большему снижению иммунитета и ухудшению здоровья. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 7 Туберкулез у людей с ВИЧ
  Widget _page7(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("    Как проявляется туберкулез у людей с ВИЧ"),
                normalText(
                    "\n\nК наиболее частым проявлениям туберкулеза обносятся:"),
                normalText(
                  "\n- кашель на протяжении двух недель и более; "
                  "\n- кровохарканье (появление крови в мокроте или при кашле); "
                  "\n- затрудненное дыхание (одышка); "
                  "\n- потеря веса (похудание); "
                  "\n- повышенная температура тела (37ͦС – 37,5 ͦС и выше); "
                  "\n- повышенная ночная потливость; "
                  "\n- усталость, утомляемость; "
                  "\n- увеличение лимфатических узлов.",
                ),
                normalText(
                    "\n\n  Если у человека с ВИЧ отмечается хотя бы один из таких проявлений, то следует срочно обратиться к врачу. Проводится консультация фтизиатра, рентгенологическое и лабораторное исследование мокроты."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 8 Туберкулез у людей с ВИЧ
  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("Лечение туберкулеза у людей с ВИЧ"),
                normalText(
                    "\n\n   Лечение туберкулеза следует начинать немедленно. Жизненно важно завершить полный курс лечения и строго следовать предписаниям врача"),
                TextSpan(
                  text: '\n   Внимание: туберкулез излечим! ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                normalText(
                    "При соблюдении режима лечения с момента выявления заболевания и до полного излечения,"
                    'необходимо быть в контакте с врачом, вовремя проходить лабораторные исследования и '
                    'ограничить контакты, чтобы не заразить близких при бытовом общении. '),
                normalText(
                    "\n    При выявлении ТБ сначала начинают лечить туберкулез, затем (в течение 2 недель) подключают АРВ терапию. "),
                normalText(
                    "\n    У людей с ВИЧ повышен риск заболеть туберкулезом и, чтобы избежать заражения, всем ЛЖВ назначается профилактическое лечение изониазидом, которое нужно принимать 6 месяцев. "),
                boldText("\n\nДля чего нужно принимать котримаксазол"),
                normalText(
                    "\n\nПри сочетании туберкулеза с ВИЧ-инфекцией пациентам также назначают котримаксазол. Это препятствует "
                    "развитию одной из часто встречающейся оппортунистической инфекции – пневмоцистной пневмонии. ")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 9 Что такое вирусные гепатиты?
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("Что такое вирусные гепатиты?"),
                normalText(
                    "\n\nПечень выполняет важные функции в организме. Гепатит – это воспаление печени в результате действия вирусов, химических веществ, алкоголя. "),
                normalText(
                    "\n\nНаиболее опасны вирусные гепатиты В и С. Их основные проявления – желтуха "
                    "(пожелтение кожи, белков глаз, мочи), увеличение печени, боли в животе, плохой сон, "
                    "быстрая утомляемость, снижение веса, плохой аппетит, тошнота. Гепатит С может протекать "
                    "незаметно, но приводит к тяжелым последствиям (его еще называют «ласковый убийца»)."),
                normalText(
                    "\n\nЛюди заражаются гепатитами В и С, также как ВИЧ, через кровь (часто при использовании загрязненных игл и шприцев). "
                    "Поэтому многие ЛЖВ инфицированы также гепатитами В и С. "),
                normalText(
                    "\n\nРиск заражения гепатитом В значительно выше, чем ВИЧ. Вирус гепатита В очень устойчив во внешней среде. Им можно также заразиться "
                    "бытовым путем при пользовании общим полотенцем, бритвенным прибором или половым путем. ")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 10 Что такое вирусные гепатиты?
  Widget _page10(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("Как выявить вирусный гепатит?"),
                normalText(
                    "\n\nОбследование на гепатиты В и С проводится сразу после выявления ВИЧ-инфекции. "),
                normalText(
                    "\n\nЕсли у человека с ВИЧ сохраняется опасное поведение (секс без презерватива с "
                    "разными половыми партнерами, совместное использование шприцев), то обследование проводят ежегодно."),
                italicText(
                    "\n\nВ случае появления признаков вирусного гепатита, сразу обратитесь к врачу, пройдите обследование и лечение."),
                boldText("\n\nКак защитить себя от вирусных гепатитов?\n\n"),
                normalText(
                    "Профилактика вирусных гепатитов В и С такая же, как и для ВИЧ-инфекции. "),
                normalText(
                    "\n- При употреблении наркотиков, откажитесь от внутривенного использования или пользуйтесь только своим шприцом и приспособлениями для изготовления наркотика.")
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/prophylaxis/1/6.gif"),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 11 Что такое вирусные гепатиты?
  Widget _page11(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\n- При половых контактах всегда и правильно используйте презерватив."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/prophylaxis/1/3.gif"),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\n- Пользуйтесь индивидуальными предметами личной гигиены (зубной щеткой, бритвенным станком, полотенцем и др.)."),
                normalText(
                    "\n- При проведении татуировки или пирсинга, используйте одноразовые (стерильные) инструменты."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/prophylaxis/1/8.gif"),
            RichText(
              text: TextSpan(children: [
                normalText(
                    "\n- От гепатита В защищает прививка, которую ЛЖВ могут получить бесплатно. "),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            Image.asset("assets/images/prophylaxis/2/2.gif"),
            RichText(
              text: TextSpan(children: [
                boldText("\n\nКак жить с вирусными гепатитами?"),
                normalText(
                    "\nВирусные гепатиты В и С нужно обязательно лечить – без лечения развиаются тяжелые осложнения (цирроз или рак печени)."),
                boldText(
                    "\n\nЛЖВ могут бесплатно получить лечение гепатита С, "),
                normalText(
                    "и более 90% людей излечиваются от него.  Курс лечения длится 3-6 месяцев."),
                normalText(
                    "\n\nДля гепатита В также существует лечение, но оно длительное. Некоторые АРВ-препараты (тенофовир, ламивудин, эмтрицитабин) помогают в лечении гепатита В."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  /// Страница 12 Что такое вирусные гепатиты?
  Widget _page12(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(children: [
                boldText("Рекомендации для больных гепатитами:"),
                normalText(
                    "\n- ограничить чрезмерные физические нагрузки, соблюдать режим дня;"),
                normalText(
                    "\n- не употреблять (или сильно ограничить) наркотики, алкоголь, курение;"),
                normalText(
                    "\n- отказаться от некоторых продуктов (жирного, жаренного, острого);"),
                normalText(
                    "\n- сообщить половому партнеру и членам семьи о своем заболевании, а также о мерах безопасности и соблюдать их."),
                normalText(
                    "\n- дополнительную информацию, вопросы обследования, профилактики и лечения обсуждать с врачом."),
              ], style: TextStyle(fontSize: fontSize)),
            ),
            SizedBox(height: 90),
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

  int lastPage = 11;

  void getChapterInt() {
    setState(() {
      showChapterFourDialog = Prefs.getInt("show_chapter_four_dialog");
    });
  }

  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          getChapterInt();
          if (value == lastPage && showChapterFourDialog == 1){
            setState(() {
              Prefs.setInt("show_chapter_four_dialog", 2);
            });
            await Doctor.showDialogFunc(
              context: context,
              text: textNadya,
              doctor: Doctors.Nadezhda,
              fontSize: 14,
            );
          }
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterFourCallback((value + 1) * 100 / pages.length);
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
        title: Text('opportunistic_infections'.tr(),
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
                // pageController.jumpToPage(value.toInt());
              },
            ),
          ],
        ),
      ),
    );
  }
}
