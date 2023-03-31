import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: 'about_app'.tr(),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Text('about_app_text1'.tr(),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text('about_app_text2'.tr(),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text('about_app_text3'.tr(),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text('about_app_text4'.tr(), style: TextStyle(fontSize: 18, color: Colors.black)),
            SizedBox(height: 10),
            Container(
              child: Image.asset("assets/images/logo_about.png"),
            ),
          ],
        ),
      ),
    );
  }
}
