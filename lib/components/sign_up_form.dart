import 'package:HIVApp/components/text_form_field.dart';
import 'package:HIVApp/model/user.dart';
import 'package:HIVApp/model/user_registrations.dart';
import 'package:HIVApp/pages/signup/questionnaire.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'custom_button.dart';

class WidgetSignup extends StatefulWidget {
  @override
  _WidgetSignupState createState() => _WidgetSignupState();
}

class _WidgetSignupState extends State<WidgetSignup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final User _user = new User();
  bool _isUserExists = true;
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  bool _enableBtn = false;
  bool _isConfirmPasswordCorrect = false;

  @override
  void initState() {
    super.initState();
    Provider.of<UserRegistration>(context, listen: false).getList();
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

  void _showErrorDialog(String message) {
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

  Widget _input(Icon icon, String hint, TextEditingController controller,
      bool isObscure) {
    return Focus(
      child: CustomTextFormField(
        controller: controller,
        obscureText: isObscure,
        hintText: hint,
        fillColor: kLightGrayishBlue,
        focusedBorderColor: kDesaturatedBlue,
        borderRadius: 8.0,
        contentPadding: EdgeInsets.only(left: 10, top: 10),
        suffixIcon: IconButton(
          onPressed: (){},
          icon: _isUserExists
              ? Icon(null)
              : controller.text.isEmpty || controller.text.length < 5
                  ? Icon(null)
                  : icon,
        ),
        validator: (String value) {
          if (value.isEmpty) return "fillThisFieldError".tr();

          if (value.length < 5) return 'passwordIsShortError'.tr();

          if (_isUserExists) return "usernameExists".tr();
        },
      ),
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          _checkInternetConnection().then((value) async {
            if (value) {
              bool isUserExists =
                  await Provider.of<User>(context, listen: false)
                      .checkUsername(controller.text);
              setState(() {
                _isUserExists = isUserExists;
              });
              _formKey.currentState.validate()
                  ? _buttonEnable(true)
                  : _buttonEnable(false);
            } else {
              _showErrorDialog('connect_to_internet'.tr());
            }
          });
        }
      },
    );
  }

  /// Текстовое поле для пароля
  Widget _passwordInput(
      String hint, TextEditingController controller, bool isObscure) {
    return Focus(
      child: CustomTextFormField(
        controller: controller,
        obscureText: isObscure,
        hintText: hint,
        fillColor: kLightGrayishBlue,
        focusedBorderColor: kDesaturatedBlue,
        borderRadius: 8.0,
        contentPadding: EdgeInsets.only(left: 10, top: 10),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isHiddenPassword = !_isHiddenPassword;
            });
          },
        ),
        validator: (String value) {
          if (value.isEmpty) return "passwordIsEmptyError".tr();

          if (value.length < 5) return "passwordIsShortError".tr();
        },
      ),
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          _formKey.currentState.validate()
              ? _buttonEnable(true)
              : _buttonEnable(false);
          _formKey.currentState.validate();
        }
      },
    );
  }

  /// Текстовое поле для подтверждения пароля
  Widget _confirmPasswordInput(
      String hint, TextEditingController controller, bool isObscure) {
    return Focus(
      child: CustomTextFormField(
        controller: controller,
        obscureText: isObscure,
        hintText: hint,
        fillColor: kLightGrayishBlue,
        enabledBorderColor: _isConfirmPasswordCorrect ? Colors.green : null,
        focusedBorderColor: kDesaturatedBlue,
        borderRadius: 8.0,
        contentPadding: EdgeInsets.only(left: 10, top: 10),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isHiddenPassword = !_isHiddenPassword;
            });
          },
        ),
        validator: (value) {
          if (value.isEmpty) return "confirm_password_dot".tr();

          if (_passwordController.text != _confirmPasswordController.text) {
            return 'confirm_password_does_not_match'.tr();
          } else {
            setState(() {
              _isConfirmPasswordCorrect = true;
            });
          }
        },
      ),
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          _formKey.currentState.validate()
              ? _buttonEnable(true)
              : _buttonEnable(false);
        }
      },
    );
  }
  /// Метод для активации кнопки
  void _buttonEnable(bool isEnable) {
    setState(() {
      _enableBtn = isEnable;
    });
  }

  /// Форма регистрации
  Widget _form() {
    return Container(
      child: Column(
        children: <Widget>[
         Padding(
           padding: const EdgeInsets.only(bottom: 10),
           child: _input(Icon(Icons.check, color: kLimeGreen), "login".tr(),
                  _usernameController, false),
         ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'remember_login_text'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: _passwordInput(
                "password_dot".tr(), _passwordController, _isHiddenPassword),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _confirmPasswordInput("confirm_password_dot".tr(),
                _confirmPasswordController, _isHiddenConfirmPassword),
          ),
          Container(
            height: 56.0,
            child: CustomButton(
                borderRadius: 8.0,
                fillColor: _enableBtn ? kDesaturatedBlue : kGrayishBlue,
                text: "next".tr().toUpperCase(),
                onPressed: _enableBtn
                    ? () async {
                        if (_formKey.currentState.validate() && _enableBtn) {
                          _user.username = _usernameController.text;
                          _user.password = _passwordController.text;

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuestionnairePage(user: _user),
                          ),);
                        }
                      }
                    : null),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _form(),
        ],
      ),
    );
  }
}
