import 'package:easy_localization/easy_localization.dart';
import 'package:HIVApp/model/user_registrations.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

class QuestionDropDownList extends StatefulWidget {
  final UserQuestion question;
  final List<UserQuestion> questions;
  Function(UserQuestion) callback;

  QuestionDropDownList({this.question, this.questions, this.callback});

  @override
  _QuestionDropDownListState createState() => _QuestionDropDownListState();
}

class _QuestionDropDownListState extends State<QuestionDropDownList> {
  UserQuestion userQuestion;

  @override
  initState(){
    super.initState();
    userQuestion = widget.question;
  }

  /// Выпадающий список
  Widget _questionDropDownList(
      UserQuestion question, List<UserQuestion> questions) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: kLightGrayishBlue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DropdownButton<UserQuestion>(
              value: userQuestion,
              hint: Text(
                "first_question".tr(),
              ),
              style: TextStyle(color: kDarkGrayishBlue, fontSize: 16),
              isExpanded: true,
              underline: SizedBox(),
              dropdownColor: kLightGrayishBlue,
              icon: Icon(Icons.arrow_drop_down_outlined),
              onChanged: (newValue) {
                setState(() {
                  widget.callback(newValue);
                  userQuestion = newValue;
                });
              },
              items: questions != null
                  ? questions.map<DropdownMenuItem<UserQuestion>>(
                      (UserQuestion value) {
                      return DropdownMenuItem<UserQuestion>(
                        value: value,
                        child: Text(context.locale.toString().split('_')[0] == 'ky' ? value.ky : value.ru),
                      );
                    }).toList()
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _questionDropDownList(widget.question, widget.questions),
    );
  }
}
