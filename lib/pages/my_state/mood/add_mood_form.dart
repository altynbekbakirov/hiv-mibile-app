import 'package:HIVApp/components/custom_button.dart';
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
  String assetPath = "assets/images/moods/";
  List<MoodModel> _moodList = List();

  TextStyle emojiStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: kDarkModerateBlue);

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
    getList(format.format(_dateTime));
  }

  getList([String currentDate]) async {
    await DBProvider.db.getAllUserMoodsByDate(currentDate).then((value) {
      setState(() {
        if (value != null) {
          for (var i in value) {
            setState(() {
              _moodList.add(MoodModel(title: i.title, symptom: i.file_name));
            });
          }
        }
      });
    });
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 96,
                          width: 104,
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'angry')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "angry"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'angry', symptom: 'angry.png'));
                                }
                                // isSelected = true;
                              });
                            },
                            onTapCancel: () {
                              print("cancel");
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'angry')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'angry-1')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "angry-1"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'angry-1',
                                      symptom: 'angry-1.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'angry-1')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'bored')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "bored"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'bored', symptom: 'bored.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'bored')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'crying')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "crying"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'crying', symptom: 'crying.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'crying')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'happy')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "happy"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'happy', symptom: 'happy.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'happy')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'embarrassed')) {
                                  _moodList.removeAt(
                                      getMood(_moodList, "embarrassed"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'embarrassed',
                                      symptom: 'embarrassed.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'embarrassed')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'happy-1')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "happy-1"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'happy-1',
                                      symptom: 'happy-1.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'happy-1')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'ill')) {
                                  _moodList.removeAt(getMood(_moodList, "ill"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'ill', symptom: 'ill.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'ill')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'sad')) {
                                  _moodList.removeAt(getMood(_moodList, "sad"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'sad', symptom: 'sad.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'sad')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'unhappy')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "unhappy"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'unhappy',
                                      symptom: 'unhappy.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'unhappy')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'in-love')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "in-love"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'in-love',
                                      symptom: 'in-love.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'in-love')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
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
                                if (moodExists(_moodList, 'smile')) {
                                  _moodList
                                      .removeAt(getMood(_moodList, "smile"));
                                } else {
                                  _moodList.add(MoodModel(
                                      title: 'smile', symptom: 'smile.png'));
                                }
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                              color: moodExists(_moodList, 'smile')
                                  ? kDesaturatedBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ],
                    ),
                  ])
                ],
              ),
            ),
            CustomButton(
              fillColor: kDesaturatedBlue,
              text: 'add_mood'.tr(),
              onPressed: () async {
                await DBProvider.db
                    .deleteUserMoodByDate(format.format(_dateTime));
                await DBProvider.db.getUserId().then((value) async {
                  for (int i = 0; i < _moodList.length; i++) {
                    UserMood userMood = new UserMood();
                    userMood.title = _moodList[i].title;
                    userMood.file_name = _moodList[i].symptom;
                    userMood.date_time = _dateTime;
                    userMood.user_id = value;
                    await DBProvider.db.newUserMood(userMood);
                  }
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.mood);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  bool moodExists(List<MoodModel> list, String mood) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].title == mood) {
        return true;
      }
    }
    return false;
  }

  int getMood(List<MoodModel> list, String mood) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].title == mood) {
        return i;
      }
    }
    return -1;
  }
}

class MoodModel {
  String title;
  String symptom;

  MoodModel({this.title, this.symptom});
}
