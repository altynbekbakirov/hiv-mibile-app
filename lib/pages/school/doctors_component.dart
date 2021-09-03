import 'package:HIVApp/components/next_button.dart';
import 'package:HIVApp/model/questionnaire_provider.dart';
import 'package:HIVApp/pages/PLHIV_questionnaire/plhiv_result_page.dart';
import 'package:HIVApp/pages/PLHIV_questionnaire/plhiv_test_page.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

enum Doctors {
  Azamat,
  Nadezhda,
}

/// Речь докторов
Widget thinkingDialog(Doctors doctor, String text, {double fontSize}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
            doctor == Doctors.Azamat ? rightSideDialog : leftSideDialog),
        fit: BoxFit.fill,
        matchTextDirection: true,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 40, top: 10, left: 10, right: 10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

/// Кнопка ОК
Widget okButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context, false),
    child: Container(
      height: 56,
      width: 104,
      decoration: BoxDecoration(
        color: kDesaturatedBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "OK",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

/// Доктор Азамат И Надежда
_doctor(String image) {
  return Container(
    child: Image.asset(
      image,
      height: 200,
      width: 148,
    ),
  );
}

String drNadezhda = 'assets/images/Dr Nadezhda.png';
String drAzamat = 'assets/images/Dr Azamat.png';
String leftSideDialog = 'assets/images/background-left.png';
String rightSideDialog = 'assets/images/background-right.png';
var paddingRight = const EdgeInsets.only(right: 80, bottom: 30);
var paddingLeft = const EdgeInsets.only(left: 80, bottom: 30);

class Doctor {
  ///Dialog
  static Future showDialogFunc({
    BuildContext context,
    String text,
    Doctors doctor,
    double fontSize,
  }) async {
    return showDialog(
      context: context,
      builder: (_) => Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: doctor == Doctors.Nadezhda
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    doctor == Doctors.Nadezhda ? paddingRight : paddingLeft,
                child: thinkingDialog(
                  doctor,
                  text,
                  fontSize: fontSize,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  doctor == Doctors.Nadezhda
                      ? okButton(context)
                      : _doctor(drAzamat),
                  doctor == Doctors.Nadezhda
                      ? _doctor(drNadezhda)
                      : okButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showDialogs(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: NextButton(
                          onPressed: () {
                            var provider = Provider.of<Questionnaire>(context, listen: false);
                            provider.setDefault();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PLHIV_Test()));
                          },
                          text: 'get_tested'.tr().toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[okButton(context), _doctor(drNadezhda)],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
