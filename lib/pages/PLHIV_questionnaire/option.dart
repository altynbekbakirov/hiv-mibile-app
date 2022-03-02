import 'package:HIVApp/model/questionnaire_provider.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class AnswerBuilder extends StatefulWidget {
  const AnswerBuilder(
      {Key key, this.onPressed, this.index, this.questionIndex})
      : super(key: key);
  final Function onPressed;
  final int index;
  final int questionIndex;

  @override
  _AnswerBuilderState createState() => _AnswerBuilderState();
}

class _AnswerBuilderState extends State<AnswerBuilder> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Questionnaire>(context, listen: true);
    var isSelected =
        provider.getSelectedAnswer(widget.questionIndex, widget.index);
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: kSoftCyan, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Text("${provider.questions[provider.questionIndex].options[widget.index].answer}".tr(),
                  style: TextStyle(
                      color: kModerateBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: isSelected ? kModerateBlue : null,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.done,
                  color: isSelected ? kColorWhite : Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
