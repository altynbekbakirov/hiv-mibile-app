import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/components/square_button.dart';
import 'package:HIVApp/pages/my_state/result/results_tests.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'visit_and_taking_tests_doctor/visit_and_taking_tests_doctor_page.dart';

class MyHealth extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "consultation".tr().toUpperCase(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        color: kLightGrayishBlue,
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SquareButton(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.my_state);
                      },
                      text: "my_state".tr().toUpperCase(),
                      image: "assets/images/SectionHeart.png"),
                  SquareButton(
                      onTap: () async {
                        Navigator.pushNamed(context, Routes.take_medications);
                      },
                      text: "taking_medication".tr().toUpperCase(),
                      image: "assets/images/Sections/Section=Treatment.png"),
                ]),
            SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SquareButton(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VisitAndTakingTestDoctorView(),
                          ),
                        );
                      },
                      text: "visit_doctor".tr().toUpperCase(),
                      image: "assets/images/Sections/Section=Doctor.png"),
                  SquareButton(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsOfTests(),
                          ),
                        );
                      },
                      text: "test_results".tr().toUpperCase(),
                      image: "assets/images/Sections/Vector.png"),
                ]),
          ],
        ),
      ),
    );
  }
}
