import 'package:HIVApp/model/plhiv_question_model.dart';
import 'package:flutter/cupertino.dart';

class Questionnaire extends ChangeNotifier {
  List<Question> _questions = data;
  int _questionIndex = 0;
  bool _isAnswered = false;
  double _correctAnswerPercent;
  int _correctAnswerCount;

  List<Question> get questions => _questions;

  double get correctPercent =>
      _correctAnswerPercent == null ? 0.0 : _correctAnswerPercent;

  int get questionIndex => _questionIndex == null ? 0 : _questionIndex;

  bool get isAnswered => _isAnswered;

  void setDefault() {
    _questionIndex = 0;
    _correctAnswerCount = 0;
    _correctAnswerPercent = 0;

    setQuestionsDefault();
    _isAnswered = false;
    notifyListeners();
  }

  void setQuestionsDefault() {
    _questions
        .map((e) => {
              for (var i in e.options) {i.selected = false}
            })
        .toList();
  }

  bool getSelectedAnswer(int questionIndex, int answerIndex) =>
      _questions[questionIndex].options[answerIndex].selected;

  void selectButton(int questionIndex, int index) {
    var isSelected = _questions[questionIndex].options[index].selected;
    _questions[questionIndex].options[index].selected = !isSelected;
    notifyListeners();
  }

  void nextQuestion() {
    _questionIndex = _questionIndex + 1;
    notifyListeners();
  }

  void setAnsweredDefault() {
    _isAnswered = false;
    notifyListeners();
  }

  void checkAnswers(int questionIndex) {
    int countOfAllCorrectAnswers = 32;
    List<Option> selectedOption = List<Option>();
    _questions[questionIndex].options.forEach((option) {
      if (option.selected) {
        _isAnswered = true;
        selectedOption.add(Option(
          selected: option.selected,
          answer: option.answer,
        ));
      }
    });

    List<String> correctAnswers = _questions[questionIndex].correctAnswers;
    var correctAnswerCount =
        _correctAnswerCount == null ? 0 : _correctAnswerCount;
    for (var selectedAnswer in selectedOption) {
      if (correctAnswers.contains(selectedAnswer.answer))
        correctAnswerCount != countOfAllCorrectAnswers ? correctAnswerCount = correctAnswerCount + 1 : correctAnswerCount;
    }
    _correctAnswerCount = correctAnswerCount;
    _correctAnswerPercent = correctAnswerCount * 100 / countOfAllCorrectAnswers;
    notifyListeners();
  }
}
