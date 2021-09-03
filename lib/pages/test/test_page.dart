import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/model/test_model.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../empty_page.dart';
import 'warning_page.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SexQuestions();
  }
}

class SexQuestions extends StatefulWidget {
  @override
  _SexQuestionsState createState() => _SexQuestionsState();
}

class _SexQuestionsState extends State<SexQuestions>
    with SingleTickerProviderStateMixin {
  var question1 = new TestTreeModel(
    body: "Я",
    value: 0,
  );
  var question1Answer1 = new TestTreeModel(
    body: "Мужчина",
    value: 0,
  );
  var question1Answer2 = new TestTreeModel(
    body: "Женщина",
    value: 0,
  );
  var question1Answer3 = new TestTreeModel(
    body: "Трансгендерный мужчина",
    value: 0,
  );
  var question1Answer4 = new TestTreeModel(
    body: "Трансгендерная женщина",
    value: 0,
  );
  bool showNext = false;
  int type;

  bool _isdark = Prefs.getBool(Prefs.DARKTHEME, def: false);
  List<TestModel> _testList = new List<TestModel>();
  TabController _tabController;

  TextStyle tabBarTextStyle =
      TextStyle(color: kGrayishBlue, fontSize: 12, fontWeight: FontWeight.w400);

  var _kTabs = [
    Tab(
      text: 'Секс',
    ),
    Tab(
      text: 'Кровь',
    ),
    Tab(
      text: 'Симптомы',
    ),
  ];

  final _kTabTextStyle = TextStyle(
    color: kColorBlue,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  var _kTabPages = [];

  fillTheTests() {
    setState(() {
      _kTabPages = [
        EmptyPage(),
        EmptyPage(),
        EmptyPage(),
      ];
    });
  }

  onTap({index = 0}) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  void initState() {
    question1.answers = [
      question1Answer1,
      question1Answer2,
      question1Answer3,
      question1Answer4
    ];
    super.initState();
    fillTheTests();
    _tabController = TabController(vsync: this, length: _kTabs.length);
    _tabController.addListener(onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: showNext
          ? QuestionBuilder(type: type)
          : Container(
              child: Column(
                children: [
                  Container(
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: kLightGrayishBlue,
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          color: kColorWhite,
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelStyle: tabBarTextStyle,
                        unselectedLabelColor: kGrayishBlue,
                        labelStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                        labelColor: kDarkModerateBlue,
                        tabs: _kTabs,
                      ),
                    ),
                  ),
                  DefaultTabController(
                    length: _kTabs.length,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          Container(
                              child: Text(
                            question1.body,
                            style: TextStyle(fontSize: 25),
                          )),
                          SizedBox(height: 80),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: ListView.builder(
                                  itemCount: question1.answers.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      height: 56,
                                      child: CustomButton(
                                        textColor: kModerateBlue,
                                        fillColor: kSoftCyan,
                                        text: question1.answers[index].body,
                                        onPressed: () {
                                          setState(() {
                                            type = index;
                                            showNext = true;
                                          });
                                        },
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class QuestionBuilder extends StatefulWidget {
  int type;

  QuestionBuilder({
    this.type,
  });

  @override
  _QuestionBuilderState createState() => _QuestionBuilderState();
}

class _QuestionBuilderState extends State<QuestionBuilder>
    with SingleTickerProviderStateMixin {
  static final _myTabbedPageKey = new GlobalKey<_QuestionBuilderState>();
  TestTreeModel model = new TestTreeModel();
  int type;
  bool female = true;
  bool blood = false;
  bool symptom = false;
  double val = 0;
  double total = 0;
  List<bool> isSelected;

  bool _isdark = Prefs.getBool(Prefs.DARKTHEME, def: false);
  List<TestModel> _testList = new List<TestModel>();

  final _kTabTextStyle = TextStyle(
    color: kColorBlue,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  //region Questions
  //region Sex
  var question26 = new TestTreeModel(
    body: "Были-ли у тебя когда либо сексуальные отношения?",
    value: 0,
  );
  var question3 = new TestTreeModel(
    body: "Количество партнеров в сексе за последний год",
    value: 0,
  );
  var question4 = new TestTreeModel(
    body: "Я занимаюсь с сексом за вознаграждение",
    value: 0,
  );
  var question6 = new TestTreeModel(
    body: "Мой партнер регулярно принимает АРТ(терапию, сдерживающую ВИЧ)",
    value: 0,
  );
  var question7 = new TestTreeModel(
    body: "Мой половой партнер ВИЧ положительный",
    value: 0,
  );
  var question8 = new TestTreeModel(
    body:
        "Я использую стимуляторы или другие вещества, чтобы сделать секс интересней и ярче",
    value: 0,
  );
  var question9 = new TestTreeModel(
    body: "Я практикую анальный секс",
    value: 0,
  );
  var question10 = new TestTreeModel(
    body: "У моего полового партнера (партнеров) бывают другие партнеры",
    value: 0,
  );
  var question11 = new TestTreeModel(
    body: "Я использую/требую от партнера использовать презерватив",
    value: 0,
  );
  var question12 = new TestTreeModel(
    body: "Мой партнер (партнеры) занимаются сексом за вознаграждение",
    value: 0,
  );
  var question27 = new TestTreeModel(
    body: "У меня были случаи секса с применением насилия",
    value: 0,
  );

  //endregion

  //region Blood
  var question19 = new TestTreeModel(
    body: "Были -ли хирургические вмешательства  или переливание крови",
    value: 0,
  );
  var question20 = new TestTreeModel(
    body: "Я употреблял наркотики через шприц",
    value: 0,
  );
  var question21 = new TestTreeModel(
    body:
        "Бывало, что я пользовался(лась) одной иглой или шприцем с другим человеком/людьми",
    value: 0,
  );

  //endregion

  //region Symptom
  var question22 = new TestTreeModel(
    body:
        "У меня бывают высыпания или выделения с неприятным запахом на половых органах",
    value: 0,
  );
  var question23 = new TestTreeModel(
    body: "У меня бывает увеличение лимфатических узлов, длящееся более месяца",
    value: 0,
  );
  var question24 = new TestTreeModel(
    body: "Я болею гепатитом и/или туберкулезом",
    value: 0,
  );
  var question25 = new TestTreeModel(
    body: "В последний раз  я проверялся(-лась) на ВИЧ",
    value: 0,
  );

  //endregion
  //endregion

  //region Answers
  //region Sex

  var question2Answer1 = new TestTreeModel(
    body: "Не важно",
    value: 1,
  );
  var question2Answer2 = new TestTreeModel(
    body: "Мужчин",
    value: 1,
  );
  var question2Answer3 = new TestTreeModel(
    body: "Женщин",
    value: 1,
  );

  var question3Answer1 = new TestTreeModel(
    body: "Один",
    value: 1,
  );
  var question3Answer2 = new TestTreeModel(
    body: "Больше одного",
    value: 5,
  );
  var question3Answer3 = new TestTreeModel(
    body: "Много",
    value: 5,
  );

  var question4Answer1 = new TestTreeModel(
    body: "Да",
    value: 10,
  );
  var question4Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question5Answer1 = new TestTreeModel(
    body: "Да",
    value: 1,
  );
  var question5Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question5Answer3 = new TestTreeModel(
    body: "Затрудняюсь ответить",
    value: 1,
  );

  var question6Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question6Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question6Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 5,
  );

  var question7Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question7Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question7Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 5,
  );

  var question8Answer1 = new TestTreeModel(
    body: "Да",
    value: 10,
  );
  var question8Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question9Answer1 = new TestTreeModel(
    body: "Да",
    value: 10,
  );
  var question9Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question9Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 5,
  );

  var question10Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question10Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question10Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 5,
  );

  var question11Answer1 = new TestTreeModel(
    body: "Всегда",
    value: 1,
  );
  var question11Answer2 = new TestTreeModel(
    body: "Никогда",
    value: 10,
  );
  var question11Answer3 = new TestTreeModel(
    body: "Иногда",
    value: 10,
  );

  var question12Answer1 = new TestTreeModel(
    body: "Да",
    value: 10,
  );
  var question12Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question12Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 10,
  );

  var question13Answer1 = new TestTreeModel(
    body: "Бывает",
    value: 10,
  );
  var question13Answer2 = new TestTreeModel(
    body: "Никогда",
    value: 1,
  );

  var question14Answer1 = new TestTreeModel(
    body: "Да",
    value: 1,
  );
  var question14Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question15Answer1 = new TestTreeModel(
    body: "Да",
    value: 1,
  );
  var question15Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question16Answer1 = new TestTreeModel(
    body: "Да",
    value: 1,
  );
  var question16Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question17Answer1 = new TestTreeModel(
    body: "Всегда",
    value: 1,
  );
  var question17Answer2 = new TestTreeModel(
    body: "Никогда",
    value: 1,
  );
  var question17Answer3 = new TestTreeModel(
    body: "Не всегда",
    value: 1,
  );

  var question18Answer1 = new TestTreeModel(
    body: "Всегда",
    value: 1,
  );
  var question18Answer2 = new TestTreeModel(
    body: "Никогда",
    value: 1,
  );
  var question18Answer3 = new TestTreeModel(
    body: "Не всегда",
    value: 1,
  );

  var question26Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question26Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question27Answer1 = new TestTreeModel(
    body: "Да",
    value: 10,
  );
  var question27Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question27Answer3 = new TestTreeModel(
    body: "Не помню",
    value: 10,
  );

  //endregion
  //region Blood
  var question19Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question19Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question20Answer1 = new TestTreeModel(
    body: "Пробовал один-два раза",
    value: 10,
  );
  var question20Answer2 = new TestTreeModel(
    body: "Употребляю и сейчас",
    value: 10,
  );
  var question20Answer3 = new TestTreeModel(
    body: "Раньше да, сейчас нет",
    value: 10,
  );
  var question20Answer4 = new TestTreeModel(
    body: "не употреблял никогда",
    value: 1,
  );

  var question21Answer1 = new TestTreeModel(
    body: "Да",
    value: 10,
  );
  var question21Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  //endregion
  //region Symptom
  var question22Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question22Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question23Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question23Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question23Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 5,
  );

  var question24Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question24Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question25Answer1 = new TestTreeModel(
    body: "Больше 6 месяцев назад",
    value: 10,
  );
  var question25Answer2 = new TestTreeModel(
    body: "Меньше 6 месяцев назад",
    value: 1,
  );
  var question25Answer3 = new TestTreeModel(
    body: "Никогда",
    value: 10,
  );

  //endregion
  //endregion

  @override
  void initState() {
    isSelected = [true, false, false];
    question3.answers = [question3Answer1, question3Answer2, question3Answer3];
    question4.answers = [question4Answer1, question4Answer2];
    question6.answers = [question6Answer1, question6Answer2, question6Answer3];
    question7.answers = [question7Answer1, question7Answer2, question7Answer3];
    question8.answers = [question8Answer1, question8Answer2];
    question9.answers = [question9Answer1, question9Answer2];
    question10.answers = [
      question10Answer1,
      question10Answer2,
      question10Answer3
    ];
    question11.answers = [
      question11Answer1,
      question11Answer2,
      question11Answer3
    ];
    question12.answers = [
      question12Answer1,
      question12Answer2,
      question12Answer3
    ];
    question26.answers = [question26Answer1, question26Answer2];
    question27.answers = [
      question27Answer1,
      question27Answer2,
      question27Answer3
    ];

    question19.answers = [
      question19Answer1,
      question19Answer2,
    ];
    question20.answers = [
      question20Answer1,
      question20Answer2,
      question20Answer3,
      question20Answer4
    ];
    question21.answers = [
      question21Answer1,
      question21Answer2,
    ];

    question22.answers = [
      question22Answer1,
      question22Answer2,
    ];
    question23.answers = [
      question23Answer1,
      question23Answer2,
      question23Answer3,
    ];
    question24.answers = [
      question24Answer1,
      question24Answer2,
    ];
    question25.answers = [
      question25Answer1,
      question25Answer2,
      question25Answer3,
    ];

    question2Answer1.to = question26;
    question2Answer2.to = question26;
    question2Answer3.to = question26;

    question26Answer1.to = question3;
    question26Answer2.to = question19;

    question13Answer1.to = question19;
    question13Answer2.to = question19;

    question3Answer1.to = question8;
    question3Answer2.to = question4;
    question3Answer3.to = question4;

    question4Answer1.to = question9;
    question4Answer2.to = question9;

    question6Answer1.to = question27;
    question6Answer2.to = question27;
    question6Answer3.to = question27;

    question7Answer1.to = question6;
    question7Answer2.to = question6;
    question7Answer3.to = question6;

    question8Answer1.to = question9;
    question8Answer2.to = question9;

    if (female) {
      question9Answer1.to = question10;
      question9Answer2.to = question10;
    } else {
      question9Answer1.to = question11;
      question9Answer2.to = question11;
    }

    question10Answer1.to = question12;
    question10Answer2.to = question12;
    question10Answer3.to = question12;

    question11Answer1.to = question7;
    question11Answer2.to = question7;
    question11Answer3.to = question7;

    question12Answer1.to = question11;
    question12Answer2.to = question11;
    question12Answer3.to = question11;

    type = widget.type;
    buildTree(type);
    model = question26;
    super.initState();
  }

  buildTree(int type) {
    bloodAndSymptomQuestionsBuilder();
    manQuestionBuilder();
    // if (type == 0)
    //   manQuestionBuilder();
    // else if (type == 1)
    //   womanQuestionBuilder();
    // else if (type == 2)
    //   transManQuestionBuilder();
    // else if (type == 3) transWomanQuestionBuilder();
  }

  changeActiveTab(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  manQuestionBuilder() {
    question2Answer1.to = question26;
    question2Answer2.to = question26;
    question2Answer3.to = question26;

    question26Answer1.to = question3;
    question26Answer2.to = question19;

    question13Answer1.to = question19;
    question13Answer2.to = question19;

    question3Answer1.to = question8;
    question3Answer2.to = question4;
    question3Answer3.to = question4;

    question4Answer1.to = question9;
    question4Answer2.to = question9;

    question6Answer1.to = question27;
    question6Answer2.to = question27;
    question6Answer3.to = question27;

    question7Answer1.to = question6;
    question7Answer2.to = question6;
    question7Answer3.to = question6;

    question8Answer1.to = question9;
    question8Answer2.to = question9;

    question9Answer1.to = question10;
    question9Answer2.to = question11;

    question10Answer1.to = question12;
    question10Answer2.to = question12;
    question10Answer3.to = question12;

    question11Answer1.to = question7;
    question11Answer2.to = question7;
    question11Answer3.to = question7;

    question7Answer1.to = question6;
    question7Answer2.to = question27;
    question7Answer3.to = question27;

    question6Answer1.to = question27;
    question6Answer2.to = question27;
    question6Answer3.to = question27;

    question12Answer1.to = question11;
    question12Answer2.to = question11;
    question12Answer3.to = question11;

    question27Answer1.to = question19;
    question27Answer2.to = question19;
    question27Answer3.to = question19;
  }

  womanQuestionBuilder() {
    question2Answer1.to = question26;
    question2Answer2.to = question26;
    question2Answer3.to = question26;

    question26Answer1.to = question3;
    question26Answer2.to = question19;

    question13Answer1.to = question19;
    question13Answer2.to = question19;

    question3Answer1.to = question8;
    question3Answer2.to = question4;
    question3Answer3.to = question4;

    question4Answer1.to = question9;
    question4Answer2.to = question9;

    question6Answer1.to = question27;
    question6Answer2.to = question27;
    question6Answer3.to = question27;

    question7Answer1.to = question6;
    question7Answer2.to = question6;
    question7Answer3.to = question6;

    question8Answer1.to = question9;
    question8Answer2.to = question9;

    question9Answer1.to = question10;
    question9Answer2.to = question10;

    question10Answer1.to = question12;
    question10Answer2.to = question12;
    question10Answer3.to = question12;

    question11Answer1.to = question7;
    question11Answer2.to = question7;
    question11Answer3.to = question7;

    question7Answer1.to = question6;
    question7Answer2.to = question27;
    question7Answer3.to = question27;

    question6Answer1.to = question27;
    question6Answer2.to = question27;
    question6Answer3.to = question27;

    question12Answer1.to = question11;
    question12Answer2.to = question11;
    question12Answer3.to = question11;

    question27Answer1.to = question19;
    question27Answer2.to = question19;
    question27Answer3.to = question19;
  }

  transManQuestionBuilder() {
    question2Answer1.to = question3;
    question2Answer2.to = question3;
    question2Answer3.to = question3;

    question3Answer2.to = question4;
    question3Answer3.to = question4;

    question5Answer1.to = question6;
    question5Answer2.to = question8;
    question5Answer3.to = question8;

    question6Answer1.to = question8;
    question6Answer2.to = question8;
    question6Answer3.to = question8;

    question8Answer1.to = question10;
    question8Answer2.to = question10;

    question10Answer1.to = question12;
    question10Answer3.to = question12;
  }

  transWomanQuestionBuilder() {
    question2Answer1.to = question3;
    question2Answer2.to = question3;
    question2Answer3.to = question3;

    question3Answer2.to = question4;
    question3Answer3.to = question4;

    question5Answer1.to = question6;
    question5Answer2.to = question8;
    question5Answer3.to = question8;

    question6Answer1.to = question8;
    question6Answer2.to = question8;
    question6Answer3.to = question8;

    question8Answer1.to = question10;
    question8Answer2.to = question10;

    question10Answer1.to = question12;
    question10Answer3.to = question12;
  }

  bloodAndSymptomQuestionsBuilder() {
    question19Answer1.to = question20;
    question19Answer2.to = question20;

    question20Answer1.to = question21;
    question20Answer2.to = question21;
    question20Answer3.to = question21;
    question20Answer4.to = question25;

    question21Answer1.to = question22;
    question21Answer2.to = question22;

    question22Answer1.to = question23;
    question22Answer2.to = question23;

    question23Answer1.to = question24;
    question23Answer2.to = question24;
    question23Answer3.to = question24;

    question24Answer1.to = question25;
    question24Answer2.to = question25;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: kLightGrayishBlue,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 28,
                  child: Center(
                    child: LayoutBuilder(builder: (context, constraints) {
                      return ToggleButtons(
                        constraints: BoxConstraints.expand(width: constraints.maxWidth / 3, height: 48),
                        borderColor: Colors.transparent,
                        onPressed: (int index) {},
                        isSelected: isSelected,
                        selectedBorderColor: Colors.transparent,
                        borderWidth: 0.0,
                        fillColor: kColorWhite,
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                'Секс'.tr(),
                                style: isSelected[0]
                                    ? _kTabTextStyle
                                    : _kTabTextStyle.copyWith(
                                        color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'Кровь'.tr(),
                                style: isSelected[1]
                                    ? _kTabTextStyle
                                    : _kTabTextStyle.copyWith(
                                        color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'Симптомы'.tr(),
                                style: isSelected[2]
                                    ? _kTabTextStyle
                                    : _kTabTextStyle.copyWith(
                                        color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        model.body,
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: model.answers.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 56,
                            child: CustomButton(
                              fillColor: kSoftCyan,
                              text: model.answers[index].body,
                              textColor: kModerateBlue,
                              onPressed: () {
                                if (question4Answer1 == model.answers[index] ||
                                    question4Answer2 == model.answers[index]) {
                                  setState(() {
                                    female = false;
                                    buildTree(0);
                                  });
                                }
                                if (model.answers[index].to != null) {
                                  setState(() {
                                    if (model.answers[index].to == question19) {
                                      changeActiveTab(1);
                                    }
                                    if (model.answers[index].to == question22) {
                                      changeActiveTab(2);
                                    }
                                    total = total + model.answers.length;
                                    val = model.answers[index].value + val;
                                    model = model.answers[index].to;
                                  });
                                } else {
                                  _showModalBottomSheet(val, total);
                                  // Route route = MaterialPageRoute(
                                  //     builder: (context) => WarningPage(
                                  //         value: val,
                                  //         total: female ? 125.0 : 110.0));
                                  // Navigator.push(context, route);
                                }
                              },
                            ),
                          );
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(double value, double total) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return WarningPage(value: value, total: total);
        });
  }
}
