import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/components/button_with_chevron.dart';
import 'package:hiv/components/next_button.dart';
import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class HivTestPage extends StatefulWidget {
  const HivTestPage({Key key}) : super(key: key);

  @override
  _HivTestPageState createState() => _HivTestPageState();
}

class _HivTestPageState extends State<HivTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "hiv_test".tr().toUpperCase(),
      ),
      body: Container(
        color: kLightGrayishBlue,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "hiv_testing".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.hiv_testing_screen);
                },
              ),
              SizedBox(height: 20),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "information_about_rapid_test".tr(),
                onTap: () async {
                  const url = "https://youtu.be/EL1YV-mnFpM";
                  await launch(url);
                },
              ),
              SizedBox(height: 20),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "where_can_testing".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.hiv_testing_place_screen);
                },
              ),
              SizedBox(height: 20),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "hiv_self_test".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.hiv_self_test);
                },
              ),
              SizedBox(height: 20),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "test_results".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.testsResults);
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: NextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.screeningResult);
                  },
                  text: 'get_tested'.tr().toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
