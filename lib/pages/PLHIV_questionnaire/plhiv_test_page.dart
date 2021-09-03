import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/components/next_button.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/model/plhiv_question_model.dart';
import 'package:HIVApp/model/questionnaire_provider.dart';
import 'package:HIVApp/model/test_model.dart';
import 'package:HIVApp/pages/PLHIV_questionnaire/plhiv_result_page.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'option.dart';

// ignore: camel_case_types
class PLHIV_Test extends StatefulWidget {
  const PLHIV_Test({Key key}) : super(key: key);

  @override
  _PLHIV_TestState createState() => _PLHIV_TestState();
}

// ignore: camel_case_types
class _PLHIV_TestState extends State<PLHIV_Test> {
  TestTreeModel model = new TestTreeModel();

  List<Question> questions;
  List<Question> correctAnswers;
  List<Question> incorrectAnswers;

  bool isAnswerSelected = false;

  @override
  void initState() {
    super.initState();
  }

  void _getQuestions() {
    var provider = Provider.of<Questionnaire>(context);
    questions = provider.questions;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Questionnaire>(context);
    _getQuestions();
    var questionIndex = provider.questionIndex;
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "pl_hiv_test".tr().toUpperCase(),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("${questions[questionIndex].question}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: questions[questionIndex].options.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: AnswerBuilder(
                    questionIndex: questionIndex,
                    index: index,
                    onPressed: () =>
                        provider.selectButton(questionIndex, index),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: NextButton(
                text: "next".tr().toUpperCase(),
                onPressed: () => updateQuestion(questionIndex),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void updateQuestion(int questionIndex) {
    var provider = Provider.of<Questionnaire>(context, listen: false);
    provider.checkAnswers(questionIndex);
    didAnswerQuestion(questionIndex);
  }

  void didAnswerQuestion(int questionIndex) {
    var provider = Provider.of<Questionnaire>(context, listen: false);
    if (!provider.isAnswered) {
      showAlertDialog(questionIndex);
    } else {
      provider.setAnsweredDefault();
      provider.nextQuestion();
      if (provider.questionIndex == questions.length - 1) {
        Prefs.setDouble("PL_HIV_TEST", provider.correctPercent);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PLHivResultPage(),
            ));
      }
    }
  }

  void showAlertDialog(int questionIndex) {
    var correctQuestionCount = questions[questionIndex].correctAnswers.length;
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(correctQuestionCount == 1
            ? 'check_answer'.tr()
            : "check_answers".tr()),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
