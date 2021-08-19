import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TestingPlace extends StatelessWidget {
  const TestingPlace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("where_can_testing".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: Image.asset(
        "assets/images/place_where_can_test_hiv.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
