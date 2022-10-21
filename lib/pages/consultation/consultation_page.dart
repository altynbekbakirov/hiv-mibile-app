import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/pages/consultation/contacts_page.dart';
import 'package:HIVApp/pages/map/map_page.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key key}) : super(key: key);

  @override
  _ConsultationPageState createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "my_condition".tr().toUpperCase(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: kLightGrayishBlue,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Container(
                height: 56,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? kDesaturatedBlue
                                    : kColorWhite,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Center(
                              child: Text(
                                "Контакты".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: selectedIndex == 0
                                        ? kColorWhite
                                        : kVeryDarkGrayishBlue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 8),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? kDesaturatedBlue
                                    : kColorWhite,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Center(
                              child: Text(
                                "Карта".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: selectedIndex == 1
                                        ? kColorWhite
                                        : kVeryDarkGrayishBlue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            selectedIndex == 0 ? ContactsPage() : Expanded(child: MapPage())
          ],
        ),
      ),
    );
  }
}
