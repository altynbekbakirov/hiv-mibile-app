import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/components/next_button.dart';
import 'package:HIVApp/components/text_form_field.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/model/user.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  bool fromChangePassword = true;
  String userName;

  ChangePasswordPage(this.fromChangePassword, {this.userName});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _passwordController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _oldPasswordIsSame = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _fromChangePassword = true;
  String userName = "";
  int userId;
  String prefsUserName = '';

  User _user = User();

  void _checkOldPassword(String oldPassword) {
    setState(() {
      _oldPasswordIsSame = oldPassword == Prefs.getString(Prefs.PASSWORD);
    });
  }

  @override
  void initState() {
    _fromChangePassword = widget.fromChangePassword;
    super.initState();
    prefsUserName = Prefs.getString("username");
    userName = prefsUserName != null ? prefsUserName : widget.userName;
    getUserId(userName);
  }

  void getUserId(String name) {
    _user.getIdByUserName(name).then((value) {
      setState(() {
        userId = value.user_id;
      });
    });
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = NextButton(
      text: "login_with_new_password".tr(),
      onPressed: () {
        Prefs.setBool(Prefs.WITH_REGISTRATION, true);
        Navigator.of(context).pushNamed(Routes.login);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Center(
        child: Text(
          "password_successfully_reset".tr(),
          style: TextStyle(
              color: kDesaturatedBlue,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: kColorWhite,
      content: Text("${'hello_user'.tr()}\n$userName", textAlign: TextAlign.center),
      actions: [
        Center(child: okButton),
        SizedBox(width: 15),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "password_change",
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          children: <Widget>[
                            _fromChangePassword
                                ? CustomTextFormField(
                                    fillColor: kLightGrayishBlue,
                                    focusedBorderColor: kDesaturatedBlue,
                                    controller: _oldPasswordController,
                                    hintText: 'old_password1'.tr(),
                                    hintStyle: TextStyle(
                                      color: kGrayishBlue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    obscureText: true,
                                    contentPadding: EdgeInsets.only(left: 15),
                                    validator: (value) {
                                      _checkOldPassword(value);
                                      if (value.isEmpty) {
                                        return 'passwordIsEmptyError'.tr();
                                      } else if (!_oldPasswordIsSame) {
                                        return 'confirm_password_does_not_match'
                                            .tr();
                                      }
                                    },
                                  )
                                : Container(),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: _passwordController,
                              fillColor: kLightGrayishBlue,
                              focusedBorderColor: kDesaturatedBlue,
                              hintText: 'password_dot'.tr(),
                              hintStyle: TextStyle(
                                  color: kGrayishBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              obscureText: true,
                              contentPadding: EdgeInsets.only(left: 15),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'passwordIsEmptyError'.tr();
                                } else if (value.length < 5) {
                                  return 'passwordIsShortError'.tr();
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: _confirmPasswordController,
                              fillColor: kLightGrayishBlue,
                              focusedBorderColor: kDesaturatedBlue,
                              hintText: 'confirm_password_dot'.tr(),
                              hintStyle: TextStyle(
                                  color: kGrayishBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              obscureText: true,
                              contentPadding: EdgeInsets.only(left: 15),
                              validator: (value) {
                                if (value.isEmpty)
                                  return "confirm_password_dot".tr();

                                if (_passwordController.text !=
                                    _confirmPasswordController.text) {
                                  return 'confirm_password_does_not_match'.tr();
                                }
                              },
                            ),
                            SizedBox(height: 50),
                            NextButton(
                              fillColor: kDesaturatedBlue,
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                } else {
                                  Prefs.setString(
                                      Prefs.PASSWORD, _passwordController.text);
                                  Provider.of<User>(context, listen: false)
                                      .setPassword(_passwordController.text, widget.fromChangePassword, userId)
                                      .then((value) {
                                    if (_fromChangePassword)
                                      Navigator.of(context).pop();
                                    print(_fromChangePassword);
                                    if (!_fromChangePassword) {
                                      showAlertDialog(context);
                                    }
                                  });
                                }
                              },
                              text: "password_change".tr().toUpperCase(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
