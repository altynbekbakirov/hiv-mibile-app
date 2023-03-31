import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/components/next_button.dart';
import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PLHivResultPage extends StatelessWidget {

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var answerPercent = Prefs.getDouble("PL_HIV_TEST");
    return Scaffold(
        appBar: ArrowBackAppBar(
          text: "pl_hiv_test".tr().toUpperCase(),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Center(
              child: Column(
                children: [
                  Text(answerPercent < 80 ? "plhiv_result_info1".tr() : "plhiv_result_info2".tr(), style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  SizedBox(height: 50),
                  CircularPercentIndicator(
                    backgroundColor: kLightGrayishBlue,
                    radius: MediaQuery.of(context).size.width * 0.5,
                    lineWidth: 20.0,
                    percent: answerPercent/100,
                    center: new Text((answerPercent.round()).toString()+'%', style: TextStyle(color: kModerateBlue, fontSize: 24, fontWeight: FontWeight.w600),),
                    progressColor: kModerateBlue,
                  ),
                  SizedBox(height: 30),
                  Text("plhiv_result_info3".tr(), style: TextStyle(color: kModerateBlue, fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: NextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.home);
                      },
                      text: "plhiv_result_info4".tr().toUpperCase(),
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}
