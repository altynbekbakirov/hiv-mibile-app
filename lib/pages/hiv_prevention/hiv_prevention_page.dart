import 'package:HIVApp/components/button_with_chevron.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HivPreventionPage extends StatefulWidget {
  const HivPreventionPage({Key key}) : super(key: key);

  @override
  _HivPreventionPageState createState() => _HivPreventionPageState();
}

class _HivPreventionPageState extends State<HivPreventionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                text: "how_to_protect_yourself".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.selfProtectScreen);
                },
              ),
              SizedBox(height: 16),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "methadone_therapy".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.methadoneTherapy);
                },
              ),
              SizedBox(height: 16),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "pre_post_exposure_therapy".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.prePostExposureTherapyScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
