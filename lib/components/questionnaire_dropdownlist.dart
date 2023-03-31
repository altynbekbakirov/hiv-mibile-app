import 'package:hiv/model/user_registrations.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class QuestionnaireDropDownList extends StatefulWidget {
  final UserQuestion question;
  final List<UserQuestion> questions;
  final onChanged;

  const QuestionnaireDropDownList({Key key,
        this.question,
        this.questions,
        this.onChanged,
  }): super(key: key);

  @override
  _QuestionnaireDropDownListState createState() => _QuestionnaireDropDownListState();
}

class _QuestionnaireDropDownListState extends State<QuestionnaireDropDownList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: kLightGrayishBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<UserQuestion>(
                value: widget.question,
                hint: Text(
                  "first_question".tr(),
                ),
                style: TextStyle(color: kDarkGrayishBlue, fontSize: 16),
                isExpanded: true,
                underline: SizedBox(),
                dropdownColor: kLightGrayishBlue,
                icon: Icon(Icons.arrow_drop_down_outlined),
                onChanged: widget.onChanged,
                items: widget.questions
                    .map<DropdownMenuItem<UserQuestion>>((UserQuestion value) {
                  return DropdownMenuItem<UserQuestion>(
                    value: value,
                    child: Text(value.ru),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
