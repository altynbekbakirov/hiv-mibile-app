import 'package:hiv/components/custom_button.dart';
import 'package:hiv/model/test_model.dart';
import 'package:flutter/material.dart';

class SexBody extends StatefulWidget {
  const  SexBody({Key key}) : super(key: key);

  @override
  _SexBodyState createState() => _SexBodyState();
}

class _SexBodyState extends State<SexBody> {
  int personType = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: personType == 0
            ? Column(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(child: Text('Я')),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        CustomButton(
                            text: "Мужчина",
                            onPressed: () {
                              setState(() {
                                personType = 1;
                              });
                            }),
                        CustomButton(
                            text: "Женшина",
                            onPressed: () {
                              setState(() {
                                personType = 2;
                              });
                            }),
                        CustomButton(
                            text: "Трансгендерный мужчина",
                            onPressed: () {
                              setState(() {
                                personType = 3;
                              });
                            }),
                        CustomButton(
                            text: "Трансгендерный женшина",
                            onPressed: () {
                              setState(() {
                                personType = 4;
                              });
                            }),
                      ],
                    )),
              ])
            : QuestionBuilder());
  }
}

class QuestionBuilder extends StatefulWidget {
  const QuestionBuilder({Key key, this.personType}) : super(key: key);

  final int personType;

  @override
  _QuestionBuilderState createState() => _QuestionBuilderState();
}

class _QuestionBuilderState extends State<QuestionBuilder> {
  TestTreeModel model = new TestTreeModel();

  //region Questions
  //region Sex
  TestTreeModel question1 = TestTreeModel(
      body: "Были-ли у тебя когда либо секусальные отношения?", value: 0);
  TestTreeModel question2 = TestTreeModel(
      body: "Количество партнеров в сексе за последний год", value: 0);
  TestTreeModel question3 =
      TestTreeModel(body: "Я занимаюсь сексом за вонзаграждение", value: 0);
  TestTreeModel question4 =
      TestTreeModel(body: "Я практикую анальный секс", value: 0);
  TestTreeModel question5 = TestTreeModel(
      body:
          "Я использую стимуляторы или другие вещества, чтобы сделать секс интересней и ярче",
      value: 0);
  TestTreeModel question6 =
      TestTreeModel(body: "Я практикую анальный секс ", value: 0);
  TestTreeModel question7 = TestTreeModel(
      body: "У моего полового партнера (партнеров) бывают другие партнеры",
      value: 0);
  TestTreeModel question8 = TestTreeModel(
      body: "Мой партнер (партнеры) занимаются сексом за вознаграждение",
      value: 0);
  TestTreeModel question9 = TestTreeModel(
      body: "Я использую/требую от партнера использовать презерватив",
      value: 0);
  TestTreeModel question10 =
      TestTreeModel(body: "Мой половой партнер ВИЧ положительный", value: 0);
  TestTreeModel question11 = TestTreeModel(
      body: "Мой партнер регулярно принимает АРТ (терапию, сдерживающую ВИЧ)",
      value: 0);
  TestTreeModel question12 = TestTreeModel(
      body: "У меня были случаи секса с применением насилия", value: 0);

  //endregion

  //region Blood
  TestTreeModel bloodQuestion1 = TestTreeModel(
      body: "Были -ли хирургические вмешательства  или переливание крови",
      value: 0);
  TestTreeModel bloodQuestion2 =
      TestTreeModel(body: "Я употреблял наркотики через шприц", value: 0);
  TestTreeModel bloodQuestion3 = TestTreeModel(
      body:
          "Бывало, что я пользовался (лась) одной иглой или шприцем с другим человеком/людьми",
      value: 0);

  //endregion

  //region Symptoms
  TestTreeModel symptomsQuestion1 = TestTreeModel(
      body:
          "У меня бывают высыпания или выделения с неприятным запахом на половых органах",
      value: 0);
  TestTreeModel symptomsQuestion2 = TestTreeModel(
      body:
          "У меня бывает увеличение лимфатических узлов, длящееся более месяца",
      value: 0);
  TestTreeModel symptomsQuestion3 =
      TestTreeModel(body: "Я болею гепатитом и/или туберкулезом", value: 0);
  TestTreeModel symptomsQuestion4 = TestTreeModel(
      body: "В последний раз я проверялся(-лась) на ВИЧ", value: 0);

  //endregion
  //endregion

  // region Answer
  // region Sex
  var question1Answer1 = new TestTreeModel(
    body: "Да",
    value: 2,
  );
  var question1Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question2Answer1 = new TestTreeModel(
    body: "Один",
    value: 1,
  );
  var question2Answer2 = new TestTreeModel(
    body: "Больше одного",
    value: 2,
  );
  var question2Answer3 = new TestTreeModel(
    body: "Много",
    value: 5,
  );

  var question3Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question3Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question4Answer1 = new TestTreeModel(
    body: "Да",
    value: 5,
  );
  var question4Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var question5Answer1 = new TestTreeModel(
    body: "Да",
    value: 4,
  );
  var question5Answer2 = new TestTreeModel(
    body: "Нет",
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

  var question7Answer1 = new TestTreeModel(
    body: "Да",
    value: 3,
  );
  var question7Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question7Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 2,
  );

  var question8Answer1 = new TestTreeModel(
    body: "Да",
    value: 4,
  );
  var question8Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question8Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 3,
  );

  var question9Answer1 = new TestTreeModel(
    body: "Всегда",
    value: 1,
  );
  var question9Answer2 = new TestTreeModel(
    body: "Никогда",
    value: 4,
  );
  var question9Answer3 = new TestTreeModel(
    body: "Иногда",
    value: 3,
  );

  var question10Answer1 = new TestTreeModel(
    body: "Да",
    value: 7,
  );
  var question10Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question10Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 2,
  );

  var question11Answer1 = new TestTreeModel(
    body: "Да",
    value: 3,
  );
  var question11Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question11Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 2,
  );

  var question12Answer1 = new TestTreeModel(
    body: "Да",
    value: 3,
  );
  var question12Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var question12Answer3 = new TestTreeModel(
    body: "Не помню",
    value: 2,
  );

  //endregion
  //region Blood
  var bloodQuestion1Answer1 = new TestTreeModel(
    body: "Да",
    value: 3,
  );
  var bloodQuestion1Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var bloodQuestion2Answer1 = new TestTreeModel(
    body: "Пробовал 1-2 раза",
    value: 5,
  );
  var bloodQuestion2Answer2 = new TestTreeModel(
    body: "Нет",
    value: 10,
  );
  var bloodQuestion2Answer3 = new TestTreeModel(
    body: "Раньше да, \nсейчас нет",
    value: 7,
  );
  var bloodQuestion2Answer4 = new TestTreeModel(
    body: "Не употреблял никогда",
    value: 1,
  );

  var bloodQuestion3Answer1 = new TestTreeModel(
    body: "Да",
    value: 10,
  );
  var bloodQuestion3Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  //endregion
  //region Symptoms
  var symptomsQuestion1Answer1 = new TestTreeModel(
    body: "Да",
    value: 8,
  );
  var symptomsQuestion1Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var symptomsQuestion2Answer1 = new TestTreeModel(
    body: "Да",
    value: 6,
  );
  var symptomsQuestion2Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );
  var symptomsQuestion2Answer3 = new TestTreeModel(
    body: "Не знаю",
    value: 3,
  );

  var symptomsQuestion3Answer1 = new TestTreeModel(
    body: "Да",
    value: 8,
  );
  var symptomsQuestion3Answer2 = new TestTreeModel(
    body: "Нет",
    value: 1,
  );

  var symptomsQuestion4Answer1 = new TestTreeModel(
    body: "Больше 6 месяцев назад",
    value: 5,
  );
  var symptomsQuestion4Answer2 = new TestTreeModel(
    body: "Меньше 6 месяцев назад",
    value: 3,
  );
  var symptomsQuestion4Answer3 = new TestTreeModel(
    body: "Никогда",
    value: 7,
  );

  //endregion
  // endregion

  @override
  void initState() {
    //region Sex Init
    question1.answers = [question1Answer1, question1Answer2];
    question2.answers = [question2Answer1, question2Answer2, question2Answer3];
    question3.answers = [question3Answer1, question3Answer2];
    question4.answers = [question4Answer1, question4Answer2];
    question5.answers = [question5Answer1, question5Answer2];
    question6.answers = [question6Answer1, question6Answer2];
    question7.answers = [question7Answer1, question7Answer2, question7Answer3];
    question8.answers = [question8Answer1, question8Answer2, question8Answer3];
    question9.answers = [question9Answer1, question9Answer2, question9Answer3];
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
    //endregion
    //region Blood Init
    bloodQuestion1.answers = [bloodQuestion1Answer1, bloodQuestion1Answer2];
    bloodQuestion2.answers = [
      bloodQuestion2Answer1,
      bloodQuestion2Answer2,
      bloodQuestion2Answer4,
      bloodQuestion2Answer4
    ];
    bloodQuestion3.answers = [bloodQuestion3Answer1, bloodQuestion3Answer2];
    //endregion
    //region Blood Init
    symptomsQuestion1.answers = [
      symptomsQuestion1Answer1,
      symptomsQuestion1Answer2
    ];
    symptomsQuestion2.answers = [
      symptomsQuestion2Answer1,
      symptomsQuestion2Answer2,
      symptomsQuestion2Answer3
    ];
    symptomsQuestion3.answers = [
      symptomsQuestion3Answer1,
      symptomsQuestion3Answer2
    ];
    symptomsQuestion4.answers = [
      symptomsQuestion4Answer1,
      symptomsQuestion4Answer2,
      symptomsQuestion4Answer3
    ];
    //endregion

    question1Answer1.to = question2;
    question1Answer2.to = bloodQuestion1;

    model = question1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
          flex: 1,
          child: ListView.builder(
              itemCount: model.answers.length,
              itemBuilder: (context, index) {
                return Container(
                  child: CustomButton(
                    text: model.answers[index].body,
                    onPressed: (){
                      setState(() {
                      });
                    },
                  ),
                );
              }),
        )
      ],
    );
  }
}
