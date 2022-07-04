import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/pages/test/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WarningPage extends StatelessWidget {
  double value;
  double total;

  WarningPage({this.value, this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                height: 60,
                child: Image.asset('assets/images/warning.png'),
              ),
              SizedBox(height: 20),
              Text(
                "test_warning".tr(),
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'test_result_warning'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
              Container(
                height: 56,
                child: CustomButton(
                  text: 'result'.tr().toUpperCase(),
                  textSize: 16,
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => TestResultPage(
                          value: value,
                          total: total,
                        ));
                    Navigator.push(context, route);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
