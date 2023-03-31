import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/components/next_button.dart';
import 'package:hiv/components/question_dropdownlist.dart';
import 'package:hiv/components/text_form_field.dart';
import 'package:hiv/model/user_registrations.dart';
import 'package:hiv/model/user.dart';
import 'package:hiv/pages/settings/widgets/change_password.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:connectivity/connectivity.dart';

class ResetPasswordPage extends StatefulWidget {
  final String userName;
  final bool fromChangePassword;

  const ResetPasswordPage({Key key, this.userName, this.fromChangePassword})
      : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _firstQuestionAnswerController = TextEditingController();
  final _secondQuestionAnswerController = TextEditingController();
  final _usernameController = TextEditingController();
  UserQuestion _question1 = new UserQuestion();
  UserQuestion _question2 = new UserQuestion();
  List<UserQuestion> _questions = new List<UserQuestion>();
  User _user = new User();

  final GlobalKey<FormState> _formKey = GlobalKey();

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

  @override
  void initState() {
    super.initState();
    _questions =
        Provider.of<UserRegistration>(context, listen: false).userQuestions;
    _question1 = _questions.first;
    _question2 = _questions[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "password_reset",
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    //   child: Text(
                    //     'questions'.tr(),
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 28,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: [
                                    // CustomTextFormField(
                                    //   fillColor: kLightGrayishBlue,
                                    //   focusedBorderColor: kDesaturatedBlue,
                                    //   controller: _usernameController,
                                    //   hintText: 'login'.tr(),
                                    //   hintStyle: TextStyle(
                                    //     color: kGrayishBlue,
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.w400,
                                    //   ),
                                    //   contentPadding: EdgeInsets.only(left: 15),
                                    //   validator: (value) {
                                    //     if (value.isEmpty) {
                                    //       return 'fillThisFieldError'.tr();
                                    //     }
                                    //   },
                                    //   onSaved: (value) {
                                    //     _user.username = value;
                                    //   },
                                    // ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    QuestionDropDownList(
                                      question: _question1,
                                      questions: _questions,
                                      callback: (value) {
                                        setState(() {
                                          _question1 = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                CustomTextFormField(
                                  fillColor: kLightGrayishBlue,
                                  focusedBorderColor: kDesaturatedBlue,
                                  controller: _firstQuestionAnswerController,
                                  hintText: 'answer'.tr(),
                                  hintStyle: TextStyle(
                                      color: kGrayishBlue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'fillThisFieldError'.tr();
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                QuestionDropDownList(
                                  question: _question2,
                                  questions: _questions,
                                  callback: (value){
                                    setState(() {
                                      _question2 = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 20),
                                CustomTextFormField(
                                  fillColor: kLightGrayishBlue,
                                  focusedBorderColor: kDesaturatedBlue,
                                  controller: _secondQuestionAnswerController,
                                  hintText: 'answer'.tr(),
                                  hintStyle: TextStyle(
                                      color: kGrayishBlue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'fillThisFieldError'.tr();
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                NextButton(
                                  onPressed: () {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    } else {
                                      _checkInternetConnection().then((value) {
                                        if (value) {
                                          _user.first_question = _question1.id;
                                          _user.username = widget.userName;
                                          _user.second_question = _question2.id;
                                          _user.first_question_answer =
                                              _firstQuestionAnswerController
                                                  .text;
                                          _user.second_question_answer =
                                              _secondQuestionAnswerController
                                                  .text;
                                          try {
                                            _user
                                                .resetPassword(_user)
                                                .then((value) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangePasswordPage(
                                                          widget
                                                              .fromChangePassword,
                                                          userName:
                                                              _user.username),
                                                ),
                                              );
                                            });
                                          } catch (error) {
                                            _showErrorDialog(error);
                                          }
                                        } else {
                                          _showErrorDialog(
                                              'connect_to_internet'.tr());
                                        }
                                      });
                                    }
                                  },
                                  text: 'reset_password'.tr().toUpperCase(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
