class Question {
  final int id;
  final String question;
  final List<String> correctAnswers;
  final List<String> incorrectAnswers;
  final List<Option> options;

  Question(
      {this.id,
      this.question,
      this.correctAnswers,
      this.incorrectAnswers,
      this.options});
}

class Option {
  bool selected;
  String answer;

  Option({this.selected, this.answer});
}

List<Question> data = [
  Question(
    id: 0,
    question: "Что такое  ВИЧ (отметьте один правильный ответ)",
    correctAnswers: ["ВИЧ – это вирус иммунодефицита человека"],
    incorrectAnswers: [
      "ВИЧ – это конечная стадия ВИЧ-инфекции",
      "ВИЧ – это заболевание, вызванное вирусом иммунодефицита человека",
      "Все перечисленное",
      "Не знаю"
    ],
    options: [
      Option(
          selected: false, answer: "ВИЧ – это вирус иммунодефицита человека"),
      Option(selected: false, answer: "ВИЧ – это конечная стадия ВИЧ-инфекции"),
      Option(
          selected: false,
          answer:
              "ВИЧ – это заболевание, вызванное вирусом иммунодефицита человека"),
      Option(selected: false, answer: "Все перечисленное"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 1,
    question: "Что такое СПИД (отметьте один правильный ответ)",
    correctAnswers: [
      "Это конечная стадия ВИЧ-инфекции, которая наступает при тяжелом поражении иммунной системы"
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Это заболевание, вызванное вирусом иммунодефицита человека"),
      Option(
          selected: false,
          answer:
              "Это конечная стадия ВИЧ-инфекции, которая наступает при тяжелом поражении иммунной системы"),
      Option(
          selected: false,
          answer: "Это инфекционное заболевание, вызванное вирусом"),
      Option(selected: false, answer: "Все перечисленное"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 2,
    question: "Какие Вы знаете  пути передачи ВИЧ (Отметьте все возможные варианты)",
    correctAnswers: [
      "ВИЧ передается через кровь",
      "ВИЧ передается от инфицированной матери ребенку",
      "ВИЧ передается при половом контакте",
      "ВИЧ передается при совместном потреблении наркотиков через шприц",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "ВИЧ передается через кровь"),
      Option(
          selected: false,
          answer:
              "ВИЧ передается при укусе комара"),
      Option(
          selected: false,
          answer: "ВИЧ передается от инфицированной матери ребенку"),
      Option(selected: false, answer: "ВИЧ передается при половом контакте"),
      Option(selected: false, answer: "ВИЧ передается при совместном потреблении наркотиков через шприц"),
      Option(selected: false, answer: "ВИЧ передается через пищу"),
      Option(selected: false, answer: "Все перечисленное"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 3,
    question: "Как можно снизить риск передачи ВИЧ половым путем (Отметьте все возможные варианты)",
    correctAnswers: [
      "Если не вступать в половые контакты ",
      "Если иметь половые контакты с одним неинфицированным партнером",
      "Если всегда и правильно использовать презерватив",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Если не вступать в половые контакты "),
      Option(
          selected: false,
          answer:
              "Если хорошо помыться перед сексом"),
      Option(
          selected: false,
          answer: "Если иметь половые контакты с одним неинфицированным партнером"),
      Option(selected: false, answer: "Если всегда и правильно использовать презерватив"),
      Option(selected: false, answer: "Все перечисленное"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 4,
    question: "Меры профилактики передачи ВИЧ  (Отметьте все возможные варианты)",
    correctAnswers: [
      "Всегда использовать презерватив",
      "При проведении медицинских манипуляций использовать только стерильные инструменты",
      "Прием АРТ для снижения риска передачи ВИЧ",
      "Назначение АРТ беременным ВИЧ-позитивным женщинам для снижения риска передачи ВИЧ ребенку",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Всегда использовать презерватив"),
      Option(
          selected: false,
          answer:
              "При проведении медицинских манипуляций использовать только стерильные инструменты"),
      Option(
          selected: false,
          answer: "Бороться с кровососущими насекомыми (комары, москиты и др.)"),
      Option(selected: false, answer: "Прием АРТ для снижения риска передачи ВИЧ "),
      Option(selected: false, answer: "Назначение АРТ беременным ВИЧ-позитивным женщинам для снижения риска передачи ВИЧ ребенку"),
    ],
  ),
  Question(
    id: 5,
    question: "Какие проявления инфекций, передаваемых половым путем (ИППП), Вы знаете (Отметьте все возможные варианты)",
    correctAnswers: [
      "Зуд в области половых органов ",
      "Необычные выделения из половых органов",
      "Язвы на половых органах",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Зуд в области половых органов "),
      Option(
          selected: false,
          answer:
              "Необычные выделения из половых органов"),
      Option(
          selected: false,
          answer: "Язвы на половых органах"),
      Option(selected: false, answer: "Ничего из вышеперечисленного"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 6,
    question: "Как следует действовать при ИППП (Отметьте все возможные варианты)",
    correctAnswers: [
      "Следует обратиться к врачу и выполнить все назначения",
      "Нужно сообщить своему половому партнеру / партнерше о своих проблемах и совместно пройти лечение",
      "Следует воздержаться от половых контактов во время лечения",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Нужно посоветоваться с подругой /другом и узнать, как он/она лечились, когда у них были такие проявления"),
      Option(
          selected: false,
          answer:
              "Нужно сходить в аптеку и спросить, какие лекарства следует принимать"),
      Option(
          selected: false,
          answer: "Следует обратиться к врачу и выполнить все назначения"),
      Option(selected: false, answer: "Не нужно говорить своему половому партнеру / партнерше, а то он/она будут плохо думать о Вас"),
      Option(selected: false, answer: "Нужно подождать, возможно, все само пройдет"),
      Option(selected: false, answer: "Нужно сообщить своему половому партнеру / партнерше о своих проблемах и совместно пройти лечение"),
      Option(selected: false, answer: "Следует воздержаться от половых контактов во время лечения"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 7,
    question: "Как действует АРТ на организм (Отметьте все возможные варианты)",
    correctAnswers: [
      "Снижает количества вируса в крови (снижает вирусную нагрузку)",
      "Улучшает общее состояние здоровья",
      "Снижает риск передачи ВИЧ при половом контакте",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Излечивает от ВИЧ-инфекции"),
      Option(
          selected: false,
          answer:
          "Снижает количества вируса в крови (снижает вирусную нагрузку)"),
      Option(
          selected: false,
          answer: "Позволяет предотвратить заражение гепатитом "),
      Option(selected: false, answer: "Улучшает общее состояние здоровья"),
      Option(selected: false, answer: "Снижает риск передачи ВИЧ при половом контакте"),
      Option(selected: false, answer: "Защищает от заражения сифилисом"),
      Option(selected: false, answer: "Все вышеперечисленное"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 8,
    question: "Как следует принимать АРТ (Отметьте один правильный ответ)",
    correctAnswers: [
      "Нужно принимать лекарство (АРТ) по назначению врача строго в назначенное время",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Можно принимать АРТ по назначению врача в любое удобное время"),
      Option(
          selected: false,
          answer:
          "Если я пропущу прием препаратов, то я выпью в следующий раз 2 таблетки вместо одной"),
      Option(
          selected: false,
          answer: "Если мое состояние здоровья улучшится я могу прекратить прием таблеток "),
      Option(selected: false, answer: "Нужно принимать лекарство (АРТ) по назначению врача строго в назначенное время"),
      Option(selected: false, answer: "Если у меня закончатся таблетки, я попрошу их у своих друзей"),
      Option(selected: false, answer: "Не знаю"),
      Option(selected: false, answer: "Все вышеперечисленное"),
      Option(selected: false, answer: "Ничего из вышеперечисленного"),
    ],
  ),
  Question(
    id: 9,
    question: "Оппортунистические заболевания или инфекции (Отметьте один правильный ответ)",
    correctAnswers: [
      "Развиваться только у людей с пониженным иммунитетом",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Развиваются при КОВИД"),
      Option(
          selected: false,
          answer:
          "Развиваться только у людей с пониженным иммунитетом"),
      Option(
          selected: false,
          answer: "Развиваются у людей, которые занимаются профессиональным спортом"),
      Option(selected: false, answer: "Все вышеперечисленное"),
      Option(selected: false, answer: "Ничего из вышеперечисленного"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 10,
    question: "Человек с ВИЧ опасен для окружающих, поэтому все должны знать о его ВИЧ статусе (Отметьте один правильный ответ)",
    correctAnswers: [
      "Нет",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Да"),
      Option(
          selected: false,
          answer:
          "Нет"),
      Option(
          selected: false,
          answer: "Может быть"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 11,
    question: "Какие права ЛЖВ могут быть ограничены в связи с ВИЧ (Отметьте все возможные варианты)",
    correctAnswers: [
      "Право быть донором крови, спермы, почки",
      "Право на работу по некоторым медицинским специальностям, установленным Правительством",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Право на труд"),
      Option(
          selected: false,
          answer:
          "Право создавать семью"),
      Option(
          selected: false,
          answer: "Право иметь детей"),
      Option(selected: false, answer: "Право быть донором крови, спермы, почки"),
      Option(selected: false, answer: "Право на работу по некоторым медицинским специальностям, установленным Правительством"),
      Option(selected: false, answer: "Право на отдых на Иссык-Куле"),
      Option(selected: false, answer: "Все вышеперечисленное"),
      Option(selected: false, answer: "Ничего из вышеперечисленного"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 12,
    question: "Каковы позитивные моменты раскрытия Вашего ВИЧ статуса близким людям (Отметьте все возможные варианты)",
    correctAnswers: [
      "Они окажут Вам помощь и поддержку",
      "Они помогут Вам справиться с принятием статуса и наладить прием АРТ",
      "Ваши супруг/супруга смогут сами принять решение о продолжении сексуальных отношений и о их безопасности",
      "Вы сможете планировать рождение здорового ребенка",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Они окажут Вам помощь и поддержку"),
      Option(
          selected: false,
          answer:
          "Они перестанут с Вами общаться"),
      Option(
          selected: false,
          answer: "Они помогут Вам справиться с принятием статуса и наладить прием АРТ"),
      Option(selected: false, answer: "Ваши супруг/супруга смогут сами принять решение о продолжении сексуальных отношений и о их безопасности"),
      Option(selected: false, answer: "Вы сможете планировать рождение здорового ребенка"),
      Option(selected: false, answer: "Они не будут с Вами обедать за одним столом"),
      Option(selected: false, answer: "Все вышеперечисленное"),
      Option(selected: false, answer: "Ничего из вышеперечисленного"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
  Question(
    id: 13,
    question: "Если у Вашего ребенка ВИЧ (Отметьте один правильный ответ)",
    correctAnswers: [
      "Воспитание и образование ребенка с ВИЧ не отличается от здорового ребенка, только он должен всегда и правильно принимать АРТ",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "Надо оградить его от помощи по дому – он же больной"),
      Option(
          selected: false,
          answer:
          "Ему нельзя посещать школу"),
      Option(
          selected: false,
          answer: "Ему не нужно дружить с другими детьми"),
      Option(selected: false, answer: "Ему не нужно принимать АРТ – это вредно для его здоровья"),
      Option(selected: false, answer: "Воспитание и образование ребенка с ВИЧ не отличается от здорового ребенка, только он должен всегда и правильно принимать АРТ"),
      Option(selected: false, answer: "Все вышеперечисленное"),
      Option(selected: false, answer: "Ничего из вышеперечисленного"),
      Option(selected: false, answer: "Не знаю"),
    ],
  ),
];
