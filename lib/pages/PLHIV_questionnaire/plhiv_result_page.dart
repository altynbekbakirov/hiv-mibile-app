import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/model/questionnaire_provider.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

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
                  Text(answerPercent < 80 ? 'Вы к сожалению не прошли тест'.tr() : 'Вы успешно прошли тест'.tr(), style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  SizedBox(height: 20),
                  CircularPercentIndicator(
                    backgroundColor: kLightGrayishBlue,
                    radius: MediaQuery.of(context).size.width * 0.6,
                    lineWidth: 20.0,
                    percent: answerPercent/100,
                    center: new Text((answerPercent.round()).toString()+'%', style: TextStyle(color: kModerateBlue, fontSize: 24, fontWeight: FontWeight.w600),),
                    progressColor: kModerateBlue,
                  ),
                  SizedBox(height: 20),
                  Text("Процент правильных ответов", style: TextStyle(color: kModerateBlue, fontSize: 18, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                ],
              ),
            )
        ));
  }
}
