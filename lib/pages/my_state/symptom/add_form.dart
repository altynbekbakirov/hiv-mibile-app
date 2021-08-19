import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/user_symptom.dart';
import 'package:HIVApp/model/symptoms_model.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../utils/constants.dart';
import '../../../db/model/user.dart';
import 'horizontal_calendar.dart';

class SymptomViewModel {
  String fileName;
  String title;
  double rating;

  SymptomViewModel({this.fileName, this.title, this.rating});
}

class AddSymptomForm extends StatefulWidget {
  String title;

  AddSymptomForm({this.title});

  @override
  _AddSymptomFormState createState() => _AddSymptomFormState();
}

class _AddSymptomFormState extends State<AddSymptomForm> {
  DateTime _dateTime = new DateTime.now();
  final format = DateFormat("yyyy-MM-dd");
  String selectedSymptom = '';
  String selectedSymptomTitle = '';
  List<UserSymptom> _list = new List<UserSymptom>();
  double rating = 0;
  List<SymptomViewModel> _symtopList = new List<SymptomViewModel>();
  String asset_path = "assets/images/symptoms/";
  DbUser dbUser = new DbUser();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.bounceOut;
  PageController _pageController = PageController();
  int pageIndex = 0;

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

  fillTheSymptomList() {
    SymptomViewModel model =
        new SymptomViewModel(fileName: 'acne.png', title: 'acne', rating: 0.0);
    _symtopList.add(model);
    model = new SymptomViewModel(
        fileName: 'dizziness.png', title: 'dizziness', rating: 0.0);
    _symtopList.add(model);
    model = new SymptomViewModel(
        fileName: 'fever.png', title: 'fever', rating: 0.0);
    _symtopList.add(model);
    model = new SymptomViewModel(
        fileName: 'frontal-headaches.png',
        title: 'frontal-headaches',
        rating: 0.0);
    _symtopList.add(model);
    model = new SymptomViewModel(
        fileName: 'headache.png', title: 'headache', rating: 0.0);
    _symtopList.add(model);
    model = new SymptomViewModel(
        fileName: 'inflammation.png', title: 'inflammation', rating: 0.0);
    _symtopList.add(model);
    model = new SymptomViewModel(
        fileName: 'shoulder.png', title: 'shoulder', rating: 0.0);
    _symtopList.add(model);
  }

  getUser() async {
    DBProvider.db.getUser().then((value) {
      setState(() {
        dbUser = value;
      });
    });
  }

  @override
  void initState() {
    fillTheSymptomList();
    getUser();
    super.initState();
  }

  /// Карусель симптомов
  Widget _buildCarousel() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _pageController.previousPage(
                  duration: _kDuration, curve: _kCurve);
            },
            child: Container(
              child: Icon(Icons.arrow_back_ios_outlined, color: kModerateBlue),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _symtopList.length,
              itemBuilder: (context, i) {
                return Container(
                  width: 150,
                  height: 150,
                  child: Column(
                    children: [
                      Expanded(
                        child:
                            Image.asset(asset_path + _symtopList[i].fileName),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        _symtopList[i].title.tr().toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                );
              },
              onPageChanged: (page) {
                setState(() {
                  pageIndex = page;
                });
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              // setState(() {
              //   ratingIndex = _pageController.page.toInt();
              // });
              _pageController.nextPage(duration: _kDuration, curve: _kCurve);
            },
            child: Container(
              child:
                  Icon(Icons.arrow_forward_ios_outlined, color: kModerateBlue),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: kColorWhite,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(text: widget.title.tr()),
      body: Container(
        color: kLightGrayishBlue,
        child: Column(
          children: <Widget>[
            CalendarWidget(),
            Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topCenter, child: _buildCarousel()),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('which_symptoms'.tr(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center),
                    ),
                  Text('assess_needed_symptoms'.tr(),
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width,
                      child: SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v) {
                          setState(() {
                            _symtopList[pageIndex].rating = v;
                          });
                        },
                        starCount: 5,
                        rating: _symtopList[pageIndex].rating,
                        isReadOnly: false,
                        color: kDesaturatedBlue,
                        borderColor: kDesaturatedBlue,
                        spacing: 8,
                      ),
                      decoration: BoxDecoration(
                          color: kColorWhite,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Consumer<Symptoms>(
                      builder: (context, model, child) => CustomButton(
                        fillColor: kDesaturatedBlue,
                        text: 'set_symptom'.tr().toUpperCase(),
                        onPressed: () async {
                          for (var i in _symtopList) {
                            if (i.rating != 0.0) {
                              _dateTime = DateTime.parse(model.dateTime);
                              UserSymptom userSymptom = new UserSymptom();
                              userSymptom.title = i.title;
                              userSymptom.file_name = i.fileName;
                              userSymptom.date_time = _dateTime;
                              userSymptom.user_id = dbUser.id;
                              userSymptom.rating = i.rating;
                              await DBProvider.db.newUserSymptom(userSymptom);
                            }
                          }
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushNamed(context, Routes.symptom);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
