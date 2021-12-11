import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/components/square_button.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyStatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: kLightGrayishBlue,
    //   appBar: ArrowBackAppBar(text: "my_condition".tr().toUpperCase()),
    //   body: Column(
    //     children: [
    //       SizedBox(height: 20),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SquareButton(
    //               text: 'symptoms'.tr().toUpperCase(),
    //               image: "assets/images/Beat.png",
    //               onTap: () => Navigator.pushNamed(context, Routes.symptom)),
    //           SquareButton(
    //               text: 'mood'.tr().toUpperCase(),
    //               image: "assets/images/emoji.png",
    //               onTap: () => Navigator.pushNamed(context, Routes.mood)),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
