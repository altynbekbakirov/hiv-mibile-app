import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/components/button_with_chevron.dart';
import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HivInformationPage extends StatefulWidget {
  final bool showAppBar;

  HivInformationPage({this.showAppBar});

  @override
  _HivInformationPageState createState() => _HivInformationPageState();
}

class _HivInformationPageState extends State<HivInformationPage> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? ArrowBackAppBar(
              text: "what_is_HIV".tr().toUpperCase(),
            )
          : null,
      body: Container(
        color: kLightGrayishBlue,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: ListView(
            children: [
              ChevronButton(
                height: 56,
                text: "what_is_hiv_and_AIDS".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.hiv_AIDS_info);
                },
              ),
              SizedBox(height: 20),
              ChevronButton(
                height: 56,
                text: "hiv_transmission_routes".tr(),
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.hiv_transmission_routes_info);
                },
              ),
              SizedBox(height: 20),
              ChevronButton(
                height: 56,
                text: "how_is_HIV_not_transmitted".tr(),
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.hiv_not_transmitted_screen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
