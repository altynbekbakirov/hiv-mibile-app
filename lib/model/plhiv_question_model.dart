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
    question: "test_hiv_question0",
    correctAnswers: ["test_hiv_answer1"],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false, answer: "test_hiv_answer1"),
      Option(selected: false, answer: "test_hiv_0answer2"),
      Option(
          selected: false,
          answer:"test_hiv_0answer3"),
      Option(selected: false, answer:"test_hiv_0answer4"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 1,
    question: "test_hiv_question1",
    correctAnswers: [
      "test_hiv_1answer1"
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_1answer2"),
      Option(
          selected: false,
          answer:
          "test_hiv_1answer1"),
      Option(
          selected: false,
          answer: "test_hiv_1answer3"),
      Option(selected: false, answer: "test_hiv_1answer4"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 2,
    question: "test_hiv_question2",
    correctAnswers: [
      "test_hiv_2answer1",
      "test_hiv_2answer3",
      "test_hiv_2answer4",
      "test_hiv_2answer5",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_2answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_2answer2"),
      Option(
          selected: false,
          answer: "test_hiv_2answer3"),
      Option(selected: false, answer: "test_hiv_2answer4"),
      Option(selected: false, answer: "test_hiv_2answer5"),
      Option(selected: false, answer: "test_hiv_2answer6"),
      Option(selected: false, answer: "test_hiv_2answer7"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 3,
    question: "test_hiv_question3",
    correctAnswers: [
      "test_hiv_3answer1",
      "test_hiv_3answer3",
      "test_hiv_3answer4",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_3answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_3answer2"),
      Option(
          selected: false,
          answer: "test_hiv_3answer3"),
      Option(selected: false, answer: "test_hiv_3answer4"),
      Option(selected: false, answer: "test_hiv_3answer5"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 4,
    question: "test_hiv_question4",
    correctAnswers: [
      "test_hiv_4answer1",
      "test_hiv_4answer2",
      "test_hiv_4answer4",
      "test_hiv_4answer5"
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_4answer1"),
      Option(
          selected: false,
          answer:"test_hiv_4answer2"),
      Option(
          selected: false,
          answer: "test_hiv_4answer3"),
      Option(selected: false, answer:"test_hiv_4answer4"),
      Option(selected: false, answer:"test_hiv_4answer5"),
    ],
  ),
  Question(
    id: 5,
    question: "test_hiv_question5",
    correctAnswers: [
      "test_hiv_5answer1",
      "test_hiv_5answer2",
      "test_hiv_5answer3",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_5answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_5answer2"),
      Option(
          selected: false,
          answer: "test_hiv_5answer3"),
      Option(selected: false, answer: "test_hiv_5answer4"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 6,
    question: "test_hiv_question6",
    correctAnswers: [
      "test_hiv_6answer3",
      "test_hiv_6answer6",
      "test_hiv_6answer7",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_6answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_6answer2"),
      Option(
          selected: false,
          answer: "test_hiv_6answer3"),
      Option(selected: false, answer: "test_hiv_6answer4"),
      Option(selected: false, answer: "test_hiv_6answer5"),
      Option(selected: false, answer: "test_hiv_6answer6"),
      Option(selected: false, answer: "test_hiv_6answer1"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 7,
    question: "test_hiv_question7",
    correctAnswers: [
      "test_hiv_7answer2",
      "test_hiv_7answer4",
      "test_hiv_7answer5",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_7answer1"),
      Option(
          selected: false,
          answer:"test_hiv_7answer2"),
      Option(
          selected: false,
          answer: "test_hiv_7answer3"),
      Option(selected: false, answer: "test_hiv_7answer4"),
      Option(selected: false, answer: "test_hiv_7answer5"),
      Option(selected: false, answer: "test_hiv_7answer6"),
      Option(selected: false, answer: "test_hiv_7answer7"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 8,
    question: "test_hiv_question8",
    correctAnswers: [
      "test_hiv_8answer4",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_8answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_8answer2"),
      Option(
          selected: false,
          answer: "test_hiv_8answer3"),
      Option(selected: false, answer: "test_hiv_8answer4"),
      Option(selected: false, answer: "test_hiv_8answer5"),
      Option(selected: false, answer: "answer0" ),
      Option(selected: false, answer: "test_hiv_8answer6"),
      Option(selected: false, answer: "test_hiv_8answer7"),
    ],
  ),
  Question(
    id: 9,
    question: "test_hiv_question9",
    correctAnswers: [
      "test_hiv_9answer2",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_9answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_9answer2"),
      Option(
          selected: false,
          answer: "test_hiv_9answer3"),
      Option(selected: false, answer: "test_hiv_8answer6"),
      Option(selected: false, answer: "test_hiv_8answer7"),
      Option(selected: false, answer: "answer0" ),
    ],
  ),
  Question(
    id: 10,
    question: "test_hiv_question10",
    correctAnswers: [
      "test_hiv_10answer2",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_10answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_10answer2"),
      Option(
          selected: false,
          answer: "test_hiv_10answer3"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 11,
    question: "test_hiv_question11",
    correctAnswers: [
      "test_hiv_11answer4",
      "test_hiv_11answer5",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_11answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_11answer2"),
      Option(
          selected: false,
          answer: "test_hiv_11answer3"),
      Option(selected: false, answer: "test_hiv_11answer4"),
      Option(selected: false, answer: "test_hiv_11answer5"),
      Option(selected: false, answer: "test_hiv_11answer6"),
      Option(selected: false, answer: "test_hiv_8answer6"),
      Option(selected: false, answer: "test_hiv_8answer7"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 12,
    question: "test_hiv_question12",
    correctAnswers: [
      "test_hiv_12answer1",
      "test_hiv_12answer3",
      "test_hiv_12answer4",
      "test_hiv_12answer5",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_12answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_12answer2"),
      Option(
          selected: false,
          answer: "test_hiv_12answer3"),
      Option(selected: false, answer: "test_hiv_12answer4"),
      Option(selected: false, answer: "test_hiv_12answer5"),
      Option(selected: false, answer: "test_hiv_12answer6"),
      Option(selected: false, answer: "test_hiv_8answer6"),
      Option(selected: false, answer: "test_hiv_8answer7"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
  Question(
    id: 13,
    question: "test_hiv_question13",
    correctAnswers: [
      "test_hiv_13answer5",
    ],
    incorrectAnswers: [],
    options: [
      Option(
          selected: false,
          answer: "test_hiv_13answer1"),
      Option(
          selected: false,
          answer:
          "test_hiv_13answer2"),
      Option(
          selected: false,
          answer: "test_hiv_13answer3"),
      Option(selected: false, answer: "test_hiv_13answer4"),
      Option(selected: false, answer: "test_hiv_13answer5"),
      Option(selected: false, answer: "test_hiv_8answer6"),
      Option(selected: false, answer: "test_hiv_8answer7"),
      Option(selected: false, answer: "answer0"),
    ],
  ),
];
