import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/model/user.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TestResultPage extends StatelessWidget {
  double value;
  double total;

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

  sendMap() async{
    await _checkInternetConnection().then((value) {
      User.sendMapTestView('test');
    });
  }

  TestResultPage({this.value, this.total});

  @override
  Widget build(BuildContext context) {
    sendMap();
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text('risk_result'.tr()),
        ),
        body: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2,),
          child: Center(
            child: Column(
              children: [
                CircularPercentIndicator(
                  backgroundColor: kLightGrayishBlue,
                  radius: MediaQuery.of(context).size.width * 0.6,
                  lineWidth: 20.0,
                  percent: value / 115,/*((value*100)/total)/100*/
                  center: new Text((value*100~/115).toString()+'%'),/*new Text(((value*100/total).toInt()).toString()+'%'),*/
                  progressColor: kModerateBlue,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(value <=10 ? 'minimal_risk'.tr() : value <=40 ? 'norm_risk'.tr() : value <=70 ? 'high_risk'.tr() : 'danger_risk'.tr(), style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    text: 'map'.tr(),
                    onPressed: (){
                      Navigator.of(context)
                          .popUntil((route) => route.isFirst);
                      Navigator.of(context).pop();
                      Navigator.pushNamed(
                        context,
                        Routes.map_page,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ));
  }
}
