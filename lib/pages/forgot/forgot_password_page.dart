import 'package:HIVApp/components/custom_appbar.dart';
import 'package:HIVApp/model/user.dart';
import 'package:HIVApp/model/user_registrations.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../components/text_form_field.dart';
import '../../utils/constants.dart';
import 'fingerprint.dart';

/// Страница сброса пароля
class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar("reset_password".tr())),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 30, bottom: 72),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WidgetForgot(),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        Center(
                          child: Text(
                            'dont_have_an_account'.tr(),
                            style: TextStyle(
                              color: kGrayishBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: 'NunitoSans',
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(2),
                            onTap: () {
                              Navigator.of(context).pushNamed(Routes.signup);
                            },
                            child: Text(
                              'register_now'.tr(),
                              style: TextStyle(
                                  color: Color(0xFF2D9CDB),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
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
      ),
    );
  }
}

/// Проверка интернет соединения
Future<bool> _checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  }
  if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

void _showErrorDialog(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => Center(
      child: AlertDialog(
        title: Text('error'.tr()),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('okay'.tr()),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    ),
  );
}

class WidgetForgot extends StatefulWidget {
  @override
  _WidgetForgotState createState() => _WidgetForgotState();
}

class _WidgetForgotState extends State<WidgetForgot> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  User _user = new User();
  bool _isUserExists = true;

  @override
  void initState() {
    Provider.of<UserRegistration>(context, listen: false).getList();
    super.initState();
  }

  void getUserData (String name) async {
    await _user.getIdByUserName(name).then((value) {
      _user.pin_code = value.pin_code;
      _user.user_id = value.user_id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Focus(
            child: CustomTextFormField(
              controller: _emailController,
              fillColor: kLightGrayishBlue,
              hintText: 'login'.tr(),
              hintStyle: TextStyle(fontSize: 16, color: kGrayishBlue),
              contentPadding: EdgeInsets.all(10),
              validator: (value) {
                if (value.isEmpty) return 'fillThisField'.tr();
                if (!_isUserExists) return "login_not_exists_error".tr();
              },
            ),
            onFocusChange: (hasFocus) {
              if (!hasFocus) {
                _checkInternetConnection().then((value) async {
                  if (value) {
                    bool isUserExists =
                    await Provider.of<User>(context, listen: false)
                        .checkUsername(_emailController.text);
                    setState(() {
                      _isUserExists = isUserExists;
                    });
                    _formKey.currentState.validate();
                  } else {
                    _showErrorDialog('connect_to_internet'.tr(), context);
                  }
                });
              }
            },
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 56,
            child: CustomButton(
              fillColor: kDesaturatedBlue,
              onPressed: () async {
                if(_formKey.currentState.validate()) {
                  _user.username = _emailController.text;

                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => ResetPasswordPage(userName: _user.username, fromChangePassword: false),
                  await _user.getIdByUserName(_emailController.text).then((value) {
                    _user.pin_code = value.pin_code;
                    _user.user_id = value.user_id;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PinCode(userName: _emailController.text, pin: value.pin_code),
                    ));
                  });
                  // ));
                }
              },
              text: 'confirm'.tr().toUpperCase(),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Text('reset_password_description'.tr(),
                style: TextStyle(
                  color: kDarkGrayishBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 5,
                softWrap: true,
                textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
