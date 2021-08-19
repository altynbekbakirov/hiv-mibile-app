import 'package:easy_localization/easy_localization.dart';

import 'package:HIVApp/model/user_registrations.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

class QuestionDropDownList extends StatefulWidget {
  final UserQuestion question;
  final List<UserQuestion> questions;

  QuestionDropDownList({this.question, this.questions});

  @override
  _QuestionDropDownListState createState() => _QuestionDropDownListState();
}

class _QuestionDropDownListState extends State<QuestionDropDownList> {
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
              value: question,
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
                  question = newValue;
                });
              },
              items: questions != null
                  ? questions.map<DropdownMenuItem<UserQuestion>>(
                      (UserQuestion value) {
                      return DropdownMenuItem<UserQuestion>(
                        value: value,
                        child: Text(value.ru),
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
