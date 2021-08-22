import 'dart:io';
import 'package:HIVApp/pages/home/home_new.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/text_form_field.dart';
import '../../routes/routes.dart';
import '../../utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:HIVApp/components/next_button.dart';
import 'package:HIVApp/model/user.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
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
                        top: 30, left: 16, right: 16, bottom: 72),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        WidgetSignIn(),
                        Center(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.forgotPassword);
                            },
                            child: Text(
                              'forgot_yout_password'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(
                                      fontSize: 16, color: Color(0xFF2D9CDB)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(height: 100),
                        ),
                        SafeArea(
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  'dont_have_an_account'.tr(),
                                  style: TextStyle(
                                    color: kGrayishBlue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: 'NunitoSans',
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(2),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.signup);
                                  },
                                  child: Text(
                                    'register_now'.tr(),
                                    style: TextStyle(
                                        color: Color(0xFF2D9CDB),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
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

/// Виджет для входа (login, password)
class WidgetSignIn extends StatefulWidget {
  @override
  _WidgetSignInState createState() => _WidgetSignInState();
}

class _WidgetSignInState extends State<WidgetSignIn> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  bool isButtonActive = false;

  Map<String, String> _authData = {
    'username': '',
    'password': '',
  };

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _submit(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }

    _checkInternetConnection().then((value) async {
      if (value) {
        _formKey.currentState.save();
        setState(() {
          _isLoading = true;
        });
        try {
          await Provider.of<User>(context, listen: false)
              .login(
                _authData['username'],
                _authData['password'],
              )
              .then((value) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomeNew(index: 0),
            ));
          });
        } on HttpException catch (error) {
          var errorMessage = 'Аутентификация не выполнено!';
          if (error.toString().contains('INVALID_EMAIL')) {
            errorMessage = 'Не првильный логин';
          } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
            errorMessage = 'Логин не существует';
          } else if (error.toString().contains('INVALID_PASSWORD')) {
            errorMessage = 'Не правильный пароль';
          }
          _showErrorDialog(errorMessage);
        } catch (error) {
          var errorMessage = "notAuthenticatedError".tr();
          if (error.message == 999.toString()) {
            errorMessage = "wrongPasswordError".tr();
          } else if (error.message == 888.toString()) {
            errorMessage = "wrongUsernameError".tr();
          }
          _showErrorDialog(errorMessage);
        }
        setState(() {
          _isLoading = false;
        });
      } else {
        _showErrorDialog('connect_to_internet'.tr());
      }
    });
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

  /// Форма для входа
  Widget _signInForm() {
    return Focus(
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            fillColor: kLightGrayishBlue,
            focusedBorderColor: kDesaturatedBlue,
            controller: _usernameController,
            hintText: 'login'.tr(),
            hintStyle: TextStyle(
                color: kGrayishBlue, fontSize: 16, fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.only(left: 15),
            validator: (value) {
              if (value.isEmpty) {
                return 'fillThisFieldError'.tr();
              }
            },
            onSaved: (value) {
              _authData['username'] = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: _passwordController,
            fillColor: kLightGrayishBlue,
            focusedBorderColor: kDesaturatedBlue,
            hintText: 'password_dot'.tr(),
            hintStyle: TextStyle(
                color: kGrayishBlue, fontSize: 16, fontWeight: FontWeight.w400),
            obscureText: true,
            contentPadding: EdgeInsets.only(left: 15),
            validator: (value) {
              if (value.isEmpty) {
                return 'passwordIsEmptyError'.tr();
              } else if (value.length < 5) {
                return 'passwordIsShortError'.tr();
              }
            },
            onSaved: (value) {
              _authData['password'] = value;
            },
          ),
        ],
      ),
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          isButtonActive = _formKey.currentState.validate();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          _signInForm(),
          SizedBox(
            height: 35,
          ),
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else
            NextButton(
              text: "SignIn".tr().toUpperCase(),
              textSize: 14,
              fillColor: isButtonActive ? kDesaturatedBlue : kGrayishBlue,
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (isButtonActive) _submit(context);
              },
            ),
        ],
      ),
    );
  }
}
