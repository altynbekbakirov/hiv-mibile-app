import 'package:HIVApp/components/bottom_slider.dart';
import 'package:HIVApp/components/bullet.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../doctors_component.dart';

class ChapterSix extends StatefulWidget {
  const ChapterSix({Key key, this.chapterSixCallback}) : super(key: key);

  final Function(double) chapterSixCallback;

  @override
  _ChapterSixState createState() => _ChapterSixState();
}

class _ChapterSixState extends State<ChapterSix> {
  double fontSize = 18.0;
  bool showSlider = false;
  PageController pageController = PageController();
  double currentPage = 0;

  String drNadya = 'Здравствуйте. Мы, доктор Надежда';
  String drAza = 'и доктор Азамат, продолжаем обучение';
  String first = 'Право – это один из видов регуляции отношений в обществе; это система обязательных для граждан прописанных, гарантированных государством правил поведения.';
  String second = 'Привлечение лиц, живущих с ВИЧ, в качестве объектов для испытаний лекарственных средств, научного исследования или учебного процесса, фотографирования, видеоили киносъемки производится только с их или их законных представителей письменного согласия.';

  @override
  void initState(){
    super.initState();
    show();
  }
  show() async {
    await Future.delayed(
      const Duration(seconds: 1),
          () => Doctor.showDialogFunc(
        context: context,
        text: drNadya,
        doctor: Doctors.Nadezhda,
        fontSize: 20,
      ),
    ).then((value) async {
      await Doctor.showDialogFunc(
        context: context,
        text: drAza,
        doctor: Doctors.Azamat,
        fontSize: 20,
      );
      await Doctor.showDialogFunc(
        context: context,
        text: first,
        doctor: Doctors.Nadezhda,
        fontSize: 20,
      );
    });
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
  boldItalicText(String text) {
    return TextSpan(
      text: '$text',
      style: TextStyle(
          fontSize: fontSize, color: Colors.black, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
    );
  }

  //region Pages
  Widget _page1(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  header("Права ЛЖВ "),
                  normalText(
                      "Права человека гарантируются законами Кыргызской Республики; они предоставляются каждому человеку от рождения и не могут ущемляться в связи с ВИЧ-статусом. Люди, живущие с ВИЧ, обладают всей полнотой социально-экономических, политических, личных прав и свобод, а также несут обязанности, закрепленные законодательством Кыргызской Республики."),
                  italicText(
                      "\n\nУслуги профилактики, лечения, ухода и поддержки оказываются на принципах уважения и соблюдения прав человека, потребностях и интересах этих людей. "),
                  boldText("\n\nГарантии государства для ЛЖВ "),
                  normalText(
                      "\nЗакон «О ВИЧ/СПИДе в Кыргызской Республике» предусматривает медицинскую и социальную помощь ЛЖВ и членам их семей. Закон запрещает "),
                  boldText(
                      "какое-либо принуждение при проведении тестирования на ВИЧ, проведение его без согласия обследуемого лица либо с использованием методов физического, психологического и морального давления."),
                  boldText(
                      "\n\nСведения о заражении того или иного лица вирусом иммунодефицита человека составляют служебную тайну, охраняемую законом. За разглашение служебной тайны "),
                  TextSpan(
                      text: "предусмотрена уголовная ответственность ",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600)),
                  boldText("(Ст. 160 УК КР)."),
                ],
              ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    boldText("Люди, живущие с ВИЧ, имеют право:"),
                  ],
                ),
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
                              "на уважительное и гуманное отношение, исключающее унижение человеческого достоинства в связи с данным заболеванием;",
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
                              "на получение качественной медицинской и лекарственной помощи; на добровольное, анонимное и конфиденциальное медицинское освидетельствование; на дотестовое и послетестовое психосоциальное консультирование;",
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
                            "на получение достоверной и полной информации о своих правах, характере имеющегося у них заболевания и применяемых методах наблюдения и лечения;",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600),
                      ),
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
                            "на социальное обеспечение и обслуживание в порядке, предусмотренном законодательством; ",
                        style:
                            TextStyle(color: Colors.black, fontSize: fontSize),
                      ),
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
                            "на получение бесплатной квалифицированной юридической помощи и психологической поддержки;",
                        style:
                            TextStyle(color: Colors.black, fontSize: fontSize),
                      ),
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
                              "на реализацию сексуальных и репродуктивных прав;",
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
                              "на профессиональное образование, переквалификацию и трудовую деятельность по избранной профессии, за исключением работы по специальностям и на должностях, установленных специальным перечнем, утвержденным Правительством Кыргызской Республики;",
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
                            "на свободный выбор врача и организации здравоохранения при проведении медицинского освидетельствования, лечения и наблюдения. ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  italicText(
                      "Привлечение лиц, живущих с ВИЧ, в качестве объектов для испытаний лекарственных средств, научного исследования или учебного процесса, фотографирования, видео- или киносъемки производится только с их или их законных представителей письменного согласия. "),
                ],
              ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header("Социальная защита ЛЖВ"),
                    normalText(
                      "Лицам, заражение которых произошло вследствие выполнения медицинских манипуляций, предусмотрено возмещение вреда в порядке, установленном законодательством Кыргызской Республики.",
                    ),
                    normalText(
                      "\n\nЛицам, живущим с ВИЧ, которым установлена инвалидность, назначается пенсия по инвалидности, а при отсутствии права на пенсионное обеспечение – социальное пособие в соответствии с законодательством Кыргызской Республики.",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///ОТВЕТСТВЕННОСТЬ и ОГРАНИЧЕНИЯ, ПРЕДУСМОТРЕННЫЕ ЗАКОНОМ
  Widget _page5(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header("ОТВЕТСТВЕННОСТЬ и ОГРАНИЧЕНИЯ, ПРЕДУСМОТРЕННЫЕ ЗАКОНОМ"),
                    normalText(
                      "Если человек имеет права, то он обладает и обязанностями. ",
                    ),
                    boldText(
                      "Наши права заканчиваются там, где начинаются права других людей. ",
                    ),
                    normalText(
                      "Поэтому, законом внесены ограничения. ЛЖВ обязаны принимать меры по предотвращению передачи ВИЧ-инфекции.",
                    ),
                    boldText("\n\nОграничения, связанные с работой:"),
                    normalText("\nЛЖВ имеют право на работу по выбранным специальностям. Однако существует запрет на работу на некоторых медицинских должностях, которые связаны с кровью (т.е. работа хирургов, акушер-гинекологов, работников отделений переливания крови и другие). Список ограничений утвержден Правительством Кыргызской Республики и направлен на профилактику передачи ВИЧ при проведении медицинских процедур. "),
                    boldText("Любые другие ограничения при приеме на работу не допускаются."),
                    normalText("\n\nЕсли Вас просят принести справку о тестировании на ВИЧ, когда Вы поступаете на работу, не связанную с указанными выше медицинскими специальностями – это нарушение Ваших прав."),
                  ],
                ),
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
                text: TextSpan(
                  children: [
                    boldText("ЛЖВ не могут быть донорами крови, органов и тканей, "),
                    normalText(
                      "поскольку ВИЧ передается через кровь и таким образом человек, получающий кровь (реципиент), может быть инфицирован ВИЧ.",
                    ),
                    boldText(
                      "\n\nОграничения, связанные с передачей ВИЧ половым путем:",
                    ),
                    normalText("\nЗаконом не ограничены права на сексуальные отношения, но не должны нарушаться права полового партнера. Ваш партнер (как мужчина, так и женщина) должны быть информированы о Вашем ВИЧ-статусе. "),
                    boldText("Каждый человек должен самостоятельно принять решение о продолжении сексуальных отношений в случае инфицирования ВИЧ его полового партнера.  "),
                    normalText("Врач или сотрудники НПО, по Вашей просьбе, могут помочь в вопросах информирования партнера."),
                    normalText("\n\nСуществует "),
                    boldText("дискордантные "),
                    normalText("пары, в которых один из партнеров ВИЧ-позитивный. За многие годы наблюдения не установлено факта заражения ВИЧ партнера в случаях, когда применяются более безопасные сексуальные практики; используется презерватива и принимается АРТ, что снижает риск передачи ВИЧ. "),
                  ],
                ),
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
                text: TextSpan(
                  children: [
                    boldItalicText("В соответствии с законодательством Кыргызской Республики, ЛЖВ несут уголовную ответственность за поставление в опасность заражения либо заражение ВИЧ другого человека (Ст. 149 УК КР). "),
                    normalText(
                      "\n\nК сожалению, в Кыргызстане известно много случаев, когда ЛЖВ с известным ВИЧ-статусом не информировали своих половых партнеров, не использовали средств защиты – в результате происходила передача ВИЧ при половом контакте. ",
                    ),
                    boldText("\n\nОграничения для родителей ВИЧ-позитивных детей:"),
                    normalText("\nИногда ВИЧ-позитивные женщины отказываются от приема АРТ для профилактики передачи ВИЧ от матери ребенку, не проводят обследование и лечение детей. В результате дети отстают в физическом развитии, часто болеют, выявляются в запущенных стадиях ВИЧ-инфекции либо умирают. В соответствии с законодательством, родители могут быть привлечены к ответственности за нарушение права детей на здоровье и жизнь. "),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page8(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    boldText("Некоторые международные ограничения, касающиеся ЛЖВ"),
                    normalText("\nНекоторые международные ограничения, касающиеся ЛЖВ В ряде стран существует запрет на въезд и пребывание иностранных граждан, живущих с ВИЧ. Количество таких стран уменьшилось с 68 стран в 2008 до 19 – в 2016 году. Однако, Россия сохраняет ограничения на работу и на получение гражданства для ЛЖВ и не предоставляет АРТ иностранным гражданам. "),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  ///Социальная защита детей, живущих с ВИЧ (Ст. 12 закона о ВИЧ/СПИДе)
  Widget _page9(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header("Социальная защита детей, живущих с ВИЧ (Ст. 12 закона о ВИЧ/СПИДе)"),
                    normalText(
                      "Дети в возрасте до двух лет, которым установлен диагноз ВИЧ-инфекции и/или СПИД, признаются инвалидами с детства.",
                    ),
                    normalText("\n\nДетям с ВИЧ-инфекцией и больным СПИДом устанавливается государственное пособие с момента регистрации, а детям, рожденным от матерей, живущих с ВИЧ, – с момента рождения до достижения 18 месяцев, в порядке, установленном законодательством Кыргызской Республики. Пособие выдается в размере 4000 сомов ежемесячно."),
                    normalText(
                      "\n\nДети, рожденные от матерей, живущих с ВИЧ, обеспечиваются заменителями грудного молока до достижения возраста одного года за счет средств местного бюджета. ",
                    ),
                  ],
                ),
              ),
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
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    normalText("\nДети, живущие с ВИЧ, находящиеся в клиниках, реабилитационных центрах или по состоянию здоровья в домашних условиях, имеют право на обучение по специальным программам курса средней общеобразовательной школы и начального профессионального образования, утвержденной Министерством образования и Министерством труда и социальной защиты Кыргызской Республики."),
                    normalText("\n\nНе допускается отказ в приеме в детские дошкольные учреждения, школы, интернаты и санаторно-оздоровительные учреждения детей, живущих с ВИЧ."),
                    normalText("\n\nДети, живущие с ВИЧ, имеют все остальные права, предусмотренные законодательством Кыргызской Республики: на право жить в семье; защиту от насилия; на информацию; на учет его мнения, относительно лечения и профилактики ВИЧ, на наличие документов, удостоверяющих личность, уважение достоинства ребенка и, естественно, на личную тайну.  "),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page11(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    header("СТИГМА И ДИСКРИМИНАЦИЯ"),
                    boldText("Стигма"),
                    normalText("– дословно «ярлык», «клеймо», «пятно» – это сильный негативный ярлык, который полностью меняет отношение людей к другим людям и самим себе, заставляя относиться к человеку как к носителю нежелательного качества. "),
                    boldText("\n\nСтигматизация"),
                    normalText(" – это процесс обесценивания личности – присвоение человеку унижающих его достоинство свойств, связанных с его особенностями, например, цветом кожи, занятием какой-либо деятельностью, сексуальной ориентацией, фактом употребления наркотиков или заражения ВИЧ. "),
                    boldText("Она "),
                    normalText("опасна не только тем, что вызывает у человека чувство стыда, вины и изоляции, но и потому, что вызывает бездействие или действия со стороны других людей, которые могут нанести вред людям, или привести к ущемлению их прав. Такие действия являются "),
                    boldText("дискриминацией."),
                    boldText("\n\nПричины стигмы"),
                  ],
                ),
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
                          "Стигма, основана на страхе людей перед последствиями ВИЧ-инфекции из-за мифа о смертельности этого заболевания",
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
                          "Незнание и непонимание путей передачи ВИЧ.",
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
  Widget _page12(BuildContext context) {
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
                          "Существование стереотипов о людях, подвергшихся заражению ВИЧ-инфекцией.",
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
                          "Обвинение людей, живущих с ВИЧ, в «неправильном поведении».",
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
                          "Формирование негативного отношения в обществе к людям, при распространении мифов и недостоверной информации.",
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
                          "Гендерные и другие виды неравенства, усиливающие стигму.",
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize)),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  normalText("Нередко ЛЖВ испытывают не одну, двойную, тройную стигму. Например, в результате бедности и ВИЧ; в результате отнесения к меньшинствам (люли) и ВИЧ; как наркопотребители /заключенные (или бывшие заключенные) и "),
                  boldText(" ВИЧ."),
                  boldText("\n\nДискриминация – "),
                  normalText("это намеренные действия или бездействие, совершаемые для того, чтобы унизить других людей, отказать им в предоставлении услуг или реализации их прав. Она сопровождается установлением различия между людьми, приводящим к пристрастному и несправедливому отношению к некоторым из них из-за того, что они принадлежат к определенной группе, имеют особенности здоровья, поведения, а также по другим причинам. "),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page13(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  boldText("Дискриминация "),
                  normalText("может привести к ограничению доступ к образованию, здравоохранению, жилищным условиям и занятости по сравнению с другими людьми. \n\nСтигматизация и дискриминация, связанные с ВИЧ, являются главными препятствиями на пути предотвращения новых случаев инфицирования ВИЧ в стране."),
                  boldText("\n\nПоследствия стигмы и дискриминации: "),
                ],
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
                          "Позднее выявление ВИЧ-инфекции (в продвинутых стадиях ВИЧ-инфекции с тяжелым поражением иммунитета).",
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
                          "Отказ от лечения, прерывание лечения, высокий уровень смертности.",
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
                      padding: const EdgeInsets.only(top: 20),
                      child: MyBullet(),
                    )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                          "Отказ от лечения детей.",
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
                          "Отрицание проблемы (ВИЧ-статуса).",
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
                      padding: const EdgeInsets.only(top: 20),
                      child: MyBullet(),
                    )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                          "Отказ от пособий на детей.",
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
                      padding: const EdgeInsets.only(top: 20),
                      child: MyBullet(),
                    )),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                          text:
                          "Отсутствие групп поддержки.",
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
  Widget _page14(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  header("КАК ЗАЩИТИТЬ СВОИ ПРАВА?"),
                  boldText("Запрет на ограничение прав и стигматизацию людей, живущих с ВИЧ, предусмотрен законом «О ВИЧ/СПИДе в Кыргызской Республике» (ст. 13). "),
                  italicText("\n\nНе допускается дискриминация и стигматизация ЛЖВ и ЛПВ, а также ущемление их законных интересов, прав и свобод на основании наличия у них ВИЧ-инфекции. Не допускается отказ:"),
                ],
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
                      text: italicText("в заключении либо прекращение трудового договора, кроме отдельных видов профессиональной деятельности, установленных специальным перечнем;")
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
                      text: italicText("в приеме в образовательные организации и организации здравоохранения.")
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  italicText("Нарушение положений настоящего Закона влечет за собой дисциплинарную, административную, уголовную и гражданскую правовую ответственность."),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page15(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  normalText("Для ЛЖВ и их близкого окружения важно знать о том, какие права они имеют и как обеспечить, чтобы все, что им принадлежит по праву и гарантируется государством, непременно выполнялось. "),
                  boldText("\n\nЗнание"),
                  normalText("\nКаждый человек должен знать свои права, а также знать где он может получить помощь для защиты своих прав. Информация о правах дается в этом модуле (аудиоверсии в этом приложении); получить у сотрудников НПО или в медицинских организациях.  "),
                  boldText("\n\nПрактика"),
                  normalText("\nУмение отстаивать свои права. Вы можете потребовать изменить отношение к себе, например, со стороны медицинских или социальных и других работников. Но для этого следует прежде преодолеть свою собственную стигму. Вы должны быть сами уверены в своей ценности и потребовать ее уважать со стороны окружающих."),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page16(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  boldText("Защита"),
                  normalText("\nЕсли Ваши права нарушены, нужно их защитить. Каким образом? Обратиться с жалобой к вышестоящему начальству или в правоохранительные органы. Если Вы готовы идти до конца и действовать жестко, то отстаивать права через суд. Это трудный процесс: (1) это финансовые затраты (нужно оплачивать судебные пошлины и адвоката); (2) это морально-психологические издержки – поскольку другая сторона тоже будет защищаться. Здесь важна помощь НПО и юристов.Обращение в суд по поводу нарушения прав важно, но многие к этому не готовы. Можно, также обратиться в прокуратуру с жалобой на неправомерные действия государственных служб. "),
                  normalText("\n\nСогласно закону о ВИЧ/СПИДе (Ст. 17), неправомерные действия или бездействие должностных лиц, нарушающие права ЛЖВ и ЛПВ могут быть обжалованы в суде в порядке, установленном законодательством Кыргызской Республики."),
                ],
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _page17(BuildContext context) {
    return ListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  boldText("Поддержка"),
                  normalText("\nПоддержку могут оказать сотрудники центров СПИД; НПО; правозащитные организации; институт Омбудсмена; некоторые международные организации (например, ОБСЕ). Вы можете обратиться за помощью в юридическую клинику при университете, но не все они могут оказать поддержку в суде). По закону суд может предоставить Вам бесплатного адвоката, но это не гарантирует успеха. "),
                  normalText("\n\nНПО документируют нарушение прав и включают это в отчеты государству и международным институтам. НПО могут оказать поддержку в правильной подготовке жалобы и вынести ее на уровень Правительства, депутатов Жогорку Кенеша и Омбудсмена. "),
                  normalText("\n\nНПО также проводят обучение ЛЖВ и лиц, оказывающих помощь, по вопросам прав человека, а также предоставляет правовую поддержку. Важную информацию Вы можете также получить от консультантов из сообщества. "),
                ],
              ),
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

  int lastPage = 16;
  Widget _chapters(BuildContext context, List pages) {
    return Scaffold(
      appBar: showSlider ? _appBar() : null,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) async {
          if(value == lastPage)
            await Doctor.showDialogFunc(
              context: context,
              text: second,
              doctor: Doctors.Azamat,
              fontSize: 18,
          );
          setState(() {
            currentPage = value.toDouble();
          });
          widget.chapterSixCallback((value + 1) * 100 / pages.length);
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
        title: Text('human_rights'.tr(), style: TextStyle(color: Colors.black)),
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
