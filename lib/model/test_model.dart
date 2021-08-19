class TestModel{
  int id;
  String body;
  List<TestAnswer> answers;
  int tab;
  TestModel({this.id, this.body, this.tab, this.answers});
}
class TestAnswer{
  int id;
  String body;
  TestModel next_model;
  double value;

  TestAnswer({this.id, this.body, this.next_model, this.value});
}

class TestTreeModel{
  String body;
  int value;
  TestTreeModel to;
  List<TestTreeModel> answers;


  TestTreeModel({this.body, this.value, this.answers, this.to});

  /*createTree(){
    var question1 = new TestTreeModel(body: "Я", value: 0,);
    var question2 = new TestTreeModel(body: "В сексе я предпочитаю", value: 0, );
    var question3 = new TestTreeModel(body: "Количество партнеров в сексе за последний год", value: 0, );
    var question4 = new TestTreeModel(body: "Я занимаюсь с сексом за вознаграждение", value: 0, );
    var question5 = new TestTreeModel(body: "Я знаю, что у моего партнера по сексу ВИЧ", value: 0, );
    var question6 = new TestTreeModel(body: "Мой партнер регулярно принимает АРТ(терапию, сдерживающую ВИЧ)", value: 0, );
    var question7 = new TestTreeModel(body: "Мой половой партнер ВИЧ положительный)", value: 0, );
    var question8 = new TestTreeModel(body: "Я использую стимуляторы или другие вещества, чтобы сделать секс интересней и ярче", value: 0, );
    var question9 = new TestTreeModel(body: "Я практикую анальный секс", value: 0, );
    var question10 = new TestTreeModel(body: "У моего полового партнера (партнеров) бывают другие партнеры", value: 0, );
    var question11 = new TestTreeModel(body: "Я использую/требую от партнера использовать презерватив", value: 0, );
    var question12 = new TestTreeModel(body: "Мой партнер (партнеры) занимаются сексом за вознаграждение", value: 0, );
    var question13 = new TestTreeModel(body: "У меня случаются рискованные половые контакты, которые могут привести к инфицированию ВИЧ", value: 0, );
    var question14 = new TestTreeModel(body: "У меня был секс с мужчиной за последние 6 месяцев", value: 0, );
    var question15 = new TestTreeModel(body: "Мы использовали презерватив", value: 0, );
    var question16 = new TestTreeModel(body: "Мы практиковали анальный секс", value: 0, );
    var question17 = new TestTreeModel(body: "я использую презерватив, когда занимаюсь сексом", value: 0, );


    var question1Answer1 = new TestTreeModel(body: "Мужчина", value: 0, to: question2);
    var question1Answer2 = new TestTreeModel(body: "Женщина", value: 0, to: question2);
    var question1Answer3 = new TestTreeModel(body: "Трансгендерный мужчина", value: 0, to: question2);
    var question1Answer4 = new TestTreeModel(body: "Трансгендерная женщина", value: 0, to: question2);
    question1.answers = [question1Answer1, question1Answer2, question1Answer3,question1Answer4];

    var question2Answer1 = new TestTreeModel(body: "Не важно", value: 0, to: question3);
    var question2Answer2 = new TestTreeModel(body: "Мужчин", value: 0, to: question3);
    var question2Answer3 = new TestTreeModel(body: "Женщин", value: 0, to: question3);
    question2.answers = [question2Answer1, question2Answer2, question2Answer3];

    var question3Answer1 = new TestTreeModel(body: "1", value: 0, to: question4);
    var question3Answer2 = new TestTreeModel(body: ">1", value: 0, to: question4);
    var question3Answer3 = new TestTreeModel(body: "Много", value: 0, to: question4);
    var question3Answer4 = new TestTreeModel(body: "Нет", value: 0, to: question4);
    question3.answers = [question3Answer1, question3Answer2, question3Answer3, question3Answer4];

    var question4Answer1 = new TestTreeModel(body: "Да", value: 0, to: question5);
    var question4Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question5);
    question4.answers = [question4Answer1, question4Answer2];

    var question5Answer1 = new TestTreeModel(body: "Да", value: 0, to: question6);
    var question5Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question9);
    var question5Answer3 = new TestTreeModel(body: "Затрудняюсь ответить", value: 0, to: question8);
    question5.answers = [question5Answer1, question5Answer2, question5Answer3];

    var question6Answer1 = new TestTreeModel(body: "Да", value: 0, to: question8);
    var question6Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question8);
    var question6Answer3 = new TestTreeModel(body: "Не знаю", value: 0, to: question8);
    question6.answers = [question6Answer1, question6Answer2, question6Answer3];

    var question7Answer1 = new TestTreeModel(body: "Да", value: 0, to: question8);
    var question7Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question8);
    var question7Answer3 = new TestTreeModel(body: "Не знаю", value: 0, to: question8);
    question7.answers = [question7Answer1, question7Answer2, question7Answer3];

    var question8Answer1 = new TestTreeModel(body: "Да", value: 0, to: question5);
    var question8Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question5);
    question8.answers = [question8Answer1, question8Answer2];

    var question9Answer1 = new TestTreeModel(body: "Да", value: 0, to: question5);
    var question9Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question5);
    question9.answers = [question9Answer1, question9Answer2];

    var question10Answer1 = new TestTreeModel(body: "Да", value: 0, to: question8);
    var question10Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question8);
    var question10Answer3 = new TestTreeModel(body: "Не знаю", value: 0, to: question8);
    question10.answers = [question10Answer1, question10Answer2, question10Answer3];

    var question11Answer1 = new TestTreeModel(body: "Всегда", value: 0, to: question8);
    var question11Answer2 = new TestTreeModel(body: "Никогда", value: 0, to: question8);
    var question11Answer3 = new TestTreeModel(body: "Иногда", value: 0, to: question8);
    question11.answers = [question11Answer1, question11Answer2, question11Answer3];

    var question12Answer1 = new TestTreeModel(body: "Да", value: 0, to: question8);
    var question12Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question8);
    var question12Answer3 = new TestTreeModel(body: "Не знаю", value: 0, to: question8);
    question12.answers = [question12Answer1, question12Answer2, question12Answer3];

    var question13Answer1 = new TestTreeModel(body: "Бывает", value: 0, to: question8);
    var question13Answer2 = new TestTreeModel(body: "Никогда", value: 0, to: question8);
    question13.answers = [question13Answer1, question13Answer2];

    var question14Answer1 = new TestTreeModel(body: "Да", value: 0, to: question5);
    var question14Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question5);
    question14.answers = [question14Answer1, question14Answer2];

    var question15Answer1 = new TestTreeModel(body: "Да", value: 0, to: question5);
    var question15Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question5);
    question15.answers = [question15Answer1, question15Answer2];

    var question16Answer1 = new TestTreeModel(body: "Да", value: 0, to: question5);
    var question16Answer2 = new TestTreeModel(body: "Нет", value: 0, to: question5);
    question16.answers = [question16Answer1, question16Answer2];

    var question17Answer1 = new TestTreeModel(body: "Всегда", value: 0, to: question8);
    var question17Answer2 = new TestTreeModel(body: "Никогда", value: 0, to: question8);
    var question17Answer3 = new TestTreeModel(body: "Не всегда", value: 0, to: question8);
    question17.answers = [question17Answer1, question17Answer2, question17Answer3];
  }*/
}