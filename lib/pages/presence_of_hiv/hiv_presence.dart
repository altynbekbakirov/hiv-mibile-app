import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/components/button_with_chevron.dart';
import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'hiv_presence_screens/drugs_for_treatment_screen.dart';
import 'hiv_presence_screens/impact_ART.dart';
import 'hiv_presence_screens/impact_persons_life.dart';
import 'hiv_presence_screens/treatment_adherence.dart';

class PresenceOfHivPage extends StatefulWidget {
  const PresenceOfHivPage({Key key}) : super(key: key);

  @override
  _PresenceOfHivPageState createState() => _PresenceOfHivPageState();
}

class _PresenceOfHivPageState extends State<PresenceOfHivPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "do_you_have_hiv".tr().toUpperCase(),
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
                text: "if_you_have_hiv".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.hiv_actions);
                },
              ),
              SizedBox(height: 16),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "hiv_infection_treatment".tr(),
                onTap: () {
                  Navigator.pushNamed(context, Routes.hiv_treatment);
                },
              ),
              SizedBox(height: 16),
              ChevronButton(
                  height: 56,
                  fontSize: 18,
                  text: "hiv_drugs".tr(),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TreatmentDrugs()),
                      )),
              SizedBox(height: 16),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "treatment_adherence".tr(),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TreatmentAdherence()),
                ),
              ),
              SizedBox(height: 16),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "impact_ART".tr(),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImpactART()),
                ),
              ),
              SizedBox(height: 16),
              ChevronButton(
                height: 56,
                fontSize: 18,
                text: "impact_persons_life".tr(),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImpactARTForPersonLife()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
