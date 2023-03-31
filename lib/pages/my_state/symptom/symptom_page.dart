import 'package:hiv/components/custom_button.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/pages/my_state/symptom/chronology_widget.dart';
import 'package:hiv/pages/my_state/symptom/total_widget.dart';
import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'add_form.dart';

class SymptomPage extends StatefulWidget {
  @override
  _SymptomPageState createState() => _SymptomPageState();
}

class _SymptomPageState extends State<SymptomPage> {
  bool logged = false;

  isLoggedIn() async {
    await DBProvider.db.getUserId().then((value) {
      if (value != null)
        setState(() {
          logged = true;
        });
    });
  }

  @override
  void initState() {
    isLoggedIn();
    super.initState();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => Center(
        child: AlertDialog(
          title: Text(''),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('back'.tr()),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            FlatButton(
              child: Text('continue'.tr()),
              onPressed: () {
                Navigator.of(ctx).popAndPushNamed(Routes.login);
              },
            )
          ],
        ),
      ),
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black)),
          titleSpacing: 0.0,
          elevation: 0.0,
          centerTitle: false,
          title: Text("symptoms".tr().toUpperCase(),
              style: TextStyle(color: Colors.black))),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: kLightGrayishBlue,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Container(
                height: 56,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? kDesaturatedBlue
                                    : kColorWhite,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Center(
                              child: Text(
                                "chronology".tr().toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: selectedIndex == 0
                                        ? kColorWhite
                                        : kVeryDarkGrayishBlue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 8),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? kDesaturatedBlue
                                    : kColorWhite,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Center(
                              child: Text(
                                "summary".tr().toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: selectedIndex == 1
                                        ? kColorWhite
                                        : kVeryDarkGrayishBlue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            selectedIndex == 0
                ? Expanded(child: SymptomChronolgy())
                : Expanded(child: SymptomTotalWidget()),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: CustomButton(
                    text: 'set_symptom'.tr().toUpperCase(),
                    fillColor: kDesaturatedBlue,
                    onPressed: () {
                      if (logged) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddSymptomForm(title: 'new_symptom'),
                            ));
                      } else {
                        _showErrorDialog('login_or_sign_up_to_add'.tr());
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
