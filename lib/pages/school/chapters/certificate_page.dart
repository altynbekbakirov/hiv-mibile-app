import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "patient_school".tr().toUpperCase(),
      ),
      backgroundColor: kBrightRed,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 20,   bottom: 50),
          child: Image.asset("assets/images/Certificate.png"),
        ),
      ),
    );
  }
}
