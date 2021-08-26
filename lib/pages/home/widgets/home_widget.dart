import 'package:HIVApp/pages/home/widgets/home_card.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeWidget extends StatefulWidget {

  Function(int) callback;

  HomeWidget({this.callback});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  children: [
                    HomeMenuCard(
                      height: 104,
                      imagePath: "assets/images/icons/School/card_regular.png",
                      imageHeight: 40,
                      imageWidth: 40,
                      cardName: "patient_school".tr().toUpperCase(),
                      fontSize: 16,
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.patientSchool);
                      },
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: HomeMenuCard(
                              height: 104,
                              imagePath:
                                  "assets/images/Sections/Section=Info.png",
                              imageHeight: 40,
                              imageWidth: 40,
                              cardName: "what_is_HIV".tr().toUpperCase(),
                              onTap: (){
                                widget.callback(5);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: HomeMenuCard(
                              height: 104,
                              imagePath:
                              "assets/images/Sections/Section=Test.png",
                              imageHeight: 40,
                              imageWidth: 40,
                              cardName: "hiv_test".tr().toUpperCase(),
                              onTap: (){
                                widget.callback(6);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HomeMenuCard(
                              height: 104,
                              imagePath:
                              "assets/images/Sections/Section=Treatment.png",
                              imageHeight: 40,
                              imageWidth: 40,
                              cardName: "hiv_prevention".tr().toUpperCase(),
                              onTap: (){
                                widget.callback(7);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: HomeMenuCard(
                              height: 104,
                              imagePath:
                              "assets/images/Sections/Section=HIV.png",
                              imageHeight: 40,
                              imageWidth: 40,
                              cardName: "do_you_have_hiv".tr().toUpperCase(),
                              onTap: (){
                                widget.callback(8);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HomeMenuCard(
                              height: 104,
                              imagePath:
                              "assets/images/Sections/Section=Consultation.png",
                              imageHeight: 40,
                              imageWidth: 40,
                              cardName: "consultation".tr().toUpperCase(),
                              onTap: (){
                                widget.callback(9);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: HomeMenuCard(
                              height: 104,
                              imagePath:
                                  "assets/images/Sections/Section=My health.png",
                              imageHeight: 40,
                              imageWidth: 40,
                              cardName: "my_condition".tr().toUpperCase(),
                              onTap: (){
                                widget.callback(10);
                                print("TODO");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
