import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/db/user_symptom.dart';
import 'package:HIVApp/model/symptoms_model.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../../utils/constants.dart';
import '../../../db/model/user.dart';
import 'horizontal_calendar.dart';

class SymptomViewModel {
  String fileName;
  String title;
  double rating;
  bool check;

  SymptomViewModel(
      {this.fileName, this.title, this.rating, this.check = false});

  @override
  String toString() {
    return 'SymptomViewModel{fileName: $fileName, title: $title, rating: $rating, check: $check}';
  }
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
  final assetPath = 'assets/images/symptoms/';
  List<SymptomViewModel> symptomsList = new List<SymptomViewModel>();
  DbUser dbUser = new DbUser();
  PageController _pageController = PageController();
  int pageIndex = 0;

  fillTheSymptomList() {
    SymptomViewModel model =
        SymptomViewModel(fileName: 'acne.png', title: 'acne', rating: 0.0);
    symptomsList.add(model);
    model = SymptomViewModel(
        fileName: 'dizziness.png', title: 'dizziness', rating: 0.0);
    symptomsList.add(model);
    model =
        SymptomViewModel(fileName: 'fever.png', title: 'fever', rating: 0.0);
    symptomsList.add(model);
    model = SymptomViewModel(
        fileName: 'frontal-headaches.png',
        title: 'frontal-headaches',
        rating: 0.0);
    symptomsList.add(model);
    model = SymptomViewModel(
        fileName: 'headache.png', title: 'headache', rating: 0.0);
    symptomsList.add(model);
    model = SymptomViewModel(
        fileName: 'inflammation.png', title: 'inflammation', rating: 0.0);
    symptomsList.add(model);
    model = SymptomViewModel(
        fileName: 'shoulder.png', title: 'shoulder', rating: 0.0);
    symptomsList.add(model);
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
    super.initState();
    fillTheSymptomList();
    getUser();
  }

  /// Карусель симптомов
  Widget buildCarousel() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceOut);
            },
            child: Container(
              child: Icon(Icons.arrow_back_ios_outlined, color: Colors.blue),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: symptomsList.length,
              itemBuilder: (context, i) {
                return Container(
                  width: 150,
                  height: 150,
                  child: Column(
                    children: [
                      Expanded(
                        child:
                            Image.asset(assetPath + symptomsList[i].fileName),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        symptomsList[i].title.tr().toUpperCase(),
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
              _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceOut);
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
      appBar: AppBar(title: Text(widget.title.tr())),
      body: Container(
        color: kLightGrayishBlue,
        child: Column(
          children: <Widget>[
            CalendarWidget(),
            Expanded(
              flex: 2,
              child:
                  Align(alignment: Alignment.topCenter, child: buildCarousel()),
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
                      child: RatingBar.builder(
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: kDesaturatedBlue,
                        ),
                        onRatingUpdate: (v) {
                          setState(() {
                            symptomsList[pageIndex].rating = v;
                          });
                        },
                        initialRating: symptomsList[pageIndex].rating,
                        minRating: 0,
                        updateOnDrag: true,
                        itemSize: 40,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                      /*SmoothStarRating(
                          allowHalfRating: false,
                          onRated: (v) {
                            setState(() {
                              symptomsList[pageIndex].rating = v;
                            });
                          },
                          rating: symptomsList[pageIndex].rating ?? 0,
                          color: kDesaturatedBlue,
                          filledIconData: Icons.star,
                          borderColor: kDesaturatedBlue,
                          spacing: 12,
                          size: 40,
                        ),*/
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
                          for (var i in symptomsList) {
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
