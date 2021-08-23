import 'package:HIVApp/components/next_button.dart';
import 'package:HIVApp/components/dots_indicator.dart';
import 'package:HIVApp/components/question_dropdownlist.dart';
import 'package:HIVApp/components/custom_appbar.dart';
import 'package:HIVApp/model/user.dart';
import 'package:HIVApp/model/user_registrations.dart';
import 'package:HIVApp/pages/signup/questionary.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/text_form_field.dart';
import '../../utils/constants.dart';

enum Gender { male, female }

class QuestionnairePage extends StatefulWidget {
  final User user;

  QuestionnairePage({this.user});

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final User user;
  final _firstQuestionAnswerController = TextEditingController();
  final _secondQuestionAnswerController = TextEditingController();
  UserQuestion _question1 = new UserQuestion();
  UserQuestion _question2 = new UserQuestion();
  List<UserQuestion> _questions = new List<UserQuestion>();
  User _user;

  final GlobalKey<FormState> _formKey = GlobalKey();

  _QuestionnairePageState({this.user});

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _questions =
        Provider.of<UserRegistration>(context, listen: false).userQuestions;
    _question1 = _questions.first;
    _question2 = _questions[1];
  }

  void _nextButtonFunc() {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _user.first_question = _question1.id;
      _user.second_question = _question2.id;
      _user.first_question_answer = _firstQuestionAnswerController.text;
      _user.second_question_answer = _secondQuestionAnswerController.text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Questionary(user: _user),
        ),
      );
    }
  }

  /// Текстовое поле для ответа
  Widget _answerInput(String hint, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Focus(
        child: CustomTextFormField(
          controller: controller,
          hintText: hint,
          fillColor: kLightGrayishBlue,
          focusedBorderColor: kDesaturatedBlue,
          borderRadius: 8.0,
          contentPadding: EdgeInsets.only(left: 10, top: 10),
          validator: (value) {
            if (value.isEmpty) return 'fillThisField'.tr();
          },
        ),
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            _formKey.currentState.validate();
          }
        },
      ),
    );
  }

  /// Форма анкеты
  Widget _questionnaireForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: QuestionDropDownList(
              question: _question1,
              questions: _questions,
              callback: (value) {
                setState(() {
                  _question1 = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: _answerInput('answer'.tr(), _firstQuestionAnswerController),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: QuestionDropDownList(
              question: _question2,
              questions: _questions,
              callback: (value){
                setState(() {
                  _question2 = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: _answerInput('answer'.tr(), _secondQuestionAnswerController),
          ),
          NextButton(onPressed: _nextButtonFunc, text: 'next'.tr()),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'question_page_description'.tr(),
              style: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(104, 110, 135, 1)),
              maxLines: 5,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar("question".tr())),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _questionnaireForm(),
                        Expanded(child: SizedBox(height: 40)),
                        Center(child: DotIndicator(dotsCount: 3, position: 1)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
