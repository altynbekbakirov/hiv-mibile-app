import 'package:hiv/model/symptoms_model.dart';
import 'package:hiv/utils/constants.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DatePickerController _controller = DatePickerController();
  DateTime firstDate = DateTime.now().subtract(Duration(days: 30));

  // DateTime firstDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.animateToDate(DateTime.parse(Provider.of<Symptoms>(context, listen: false).dateTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWhite,
      child: Column(
        children: [
          Container(
            child: Consumer<Symptoms>(
              builder: (context, model, child) => DatePicker(
                firstDate,
                width: 60,
                height: 80,
                controller: _controller,
                daysCount: 31,
                monthTextStyle: TextStyle(color: Colors.transparent),
                dateTextStyle: TextStyle(color: kDarkGrayishBlue, fontSize: 20),
                initialSelectedDate: DateTime.parse(Provider.of<Symptoms>(context, listen: false).dateTime),
                selectionColor: kDesaturatedBlue,
                selectedTextColor: kColorWhite,
                onDateChange: (date) {
                  model.setDateTimeState(date.toString());
                },
                locale: "ru_RU",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
