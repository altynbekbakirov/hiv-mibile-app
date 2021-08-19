import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/user_mood.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants.dart';

class AddMoodForm extends StatefulWidget {
  String title;
  DateTime selectedDate;

  AddMoodForm({this.title, this.selectedDate});

  @override
  _AddMoodFormState createState() => _AddMoodFormState();
}

class _AddMoodFormState extends State<AddMoodForm> {
  DateTime _dateTime = new DateTime.now();
  final format = DateFormat("yyyy-MM-dd");
  String selectedSymptom = '';
  String selectedSymptomTitle = '';
  List<UserMood> _list = new List<UserMood>();
  String assetPath = "assets/images/moods/";
  bool isSelected = false;

  TextStyle emojiStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: kDarkModerateBlue);

  Widget dateTimePicker() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
//      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: DateTimeField(
        resetIcon: Icon(FontAwesomeIcons.calendarAlt),
        format: format,
        initialValue: DateTime.now(),
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now());
          if (date != null) {
            setState(() {
              _dateTime = DateTime(date.year, date.month, date.day);
            });
            return date;
          } else {
            return currentValue;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dateTime = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black)),
          titleSpacing: 0.0,
          elevation: 0.0,
          centerTitle: false,
          title: Text("set_mood".tr(), style: TextStyle(color: Colors.black))),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    assetPath + 'angry.png',
                                    height: 48,
                                  ),
                                  Text('angry'.tr(), style: emojiStyle),
                                ],
                              ),
                            onTap: () {
                              setState(() {
                                print("focus");

                                selectedSymptom = 'angry.png';
                                selectedSymptomTitle = 'angry';
                                // isSelected = true;
                              });
                            },
                            onTapCancel: (){
                              print("cancel");
                            },
                          ),
                          decoration: BoxDecoration(
                            color: selectedSymptomTitle == 'angry'
                                ? kDesaturatedBlue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    assetPath + 'angry-1.png',
                                    height: 48,
                                  ),
                                  Text('angry-1'.tr(), style: emojiStyle),
                                ],
                              ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'angry-1.png';
                                selectedSymptomTitle = 'angry-1';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'angry-1'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    assetPath + 'bored.png',
                                    height: 48,
                                  ),
                                  Text('bored'.tr(), style: emojiStyle),
                                ],
                              ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'bored.png';
                                selectedSymptomTitle = 'bored';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'bored'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    assetPath + 'crying.png',
                                    height: 48,
                                  ),
                                  Text('crying'.tr(), style: emojiStyle),
                                ],
                              ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'crying.png';
                                selectedSymptomTitle = 'crying';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'crying'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    assetPath + 'happy.png',
                                    height: 48,
                                  ),
                                  Text('happy'.tr(), style: emojiStyle),
                                ],
                              ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'happy.png';
                                selectedSymptomTitle = 'happy';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'happy'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    assetPath + 'embarrassed.png',
                                    height: 48,
                                  ),
                                  Text('embarrassed'.tr(), style: emojiStyle),
                                ],
                              ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'embarrassed.png';
                                selectedSymptomTitle = 'embarrassed';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'embarrassed'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  assetPath + 'happy-1.png',
                                  height: 48,
                                ),
                                Text('happy-1'.tr(), style: emojiStyle),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'happy-1.png';
                                selectedSymptomTitle = 'happy-1';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'happy-1'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  assetPath + 'ill.png',
                                  height: 48,
                                ),
                                Text('ill'.tr(), style: emojiStyle),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'ill.png';
                                selectedSymptomTitle = 'ill';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'ill'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  assetPath + 'sad.png',
                                  height: 48,
                                ),
                                Text('sad'.tr(), style: emojiStyle),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'sad.png';
                                selectedSymptomTitle = 'sad';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'sad'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  assetPath + 'unhappy.png',
                                  height: 48,
                                ),
                                Text('unhappy'.tr(), style: emojiStyle),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'unhappy.png';
                                selectedSymptomTitle = 'unhappy';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'unhappy'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  assetPath + 'in-love.png',
                                  height: 48,
                                ),
                                Text('in-love'.tr(), style: emojiStyle),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'in-love.png';
                                selectedSymptomTitle = 'in-love';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'in-love'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        Container(
                          height: 96,
                          width: 104,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(assetPath + 'smile.png',
                                    height: 48),
                                Text('smile'.tr(), style: emojiStyle),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedSymptom = 'smile.png';
                                selectedSymptomTitle = 'smile';
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: selectedSymptomTitle == 'smile'
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                      ],
                    ),
                  ])
                ],
              ),
            ),
            Container(
              height: 56,
              child: CustomButton(
                fillColor: kDesaturatedBlue,
                text: 'add_mood'.tr(),
                onPressed: () async {
                  DBProvider.db.getUserId().then((value) async {
                    UserMood userMood = new UserMood();
                    userMood.title = selectedSymptomTitle;
                    userMood.file_name = selectedSymptom;
                    userMood.date_time = _dateTime;
                    userMood.user_id = value;
                    await DBProvider.db.newUserMood(userMood);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.mood);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
