import 'package:HIVApp/components/change_language_button.dart';
import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/components/custom_outline_button.dart';
import 'package:HIVApp/data/configs.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  var url = Configs.ip + "/hiv_instruction.pdf";

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Логотип
  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Align(
          child: Image.asset(
            'assets/images/hiv-logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  /// Button для входа (Авторизация)
  Widget _signIn() {
    return CustomButton(
      padding: EdgeInsets.all(20),
      textSize: 16,
      fontWeight: FontWeight.w500,
      onPressed: () {
        Prefs.setBool(Prefs.WITH_REGISTRATION, true);
        Navigator.of(context).pushNamed(Routes.login);
      },
      text: 'sign_in'.tr().toUpperCase(),
    );
  }

  /// Button для входа как ГОСТЬ
  Widget _withoutAuth() {
    return CustomOutlineButton(
      color: kDesaturatedBlue,
      splashColor: kModerateBlue,
      textSize: 16,
      fontWeight: FontWeight.w500,
      onPressed: () {
        Prefs.setBool(Prefs.WITH_REGISTRATION, false);
        Navigator.of(context).popAndPushNamed(Routes.home);
      },
      text: 'without_registration'.tr(),
    );
  }

  /// Текст рекомендации
  Widget _recommendationText() {
    return Container(
      child: Text(
        'recommend_registration_text'.tr(),
        style: TextStyle(fontSize: 12, color: Color.fromRGBO(104, 110, 135, 1)),
        maxLines: 5,
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Всплывающее окно регистрации
  _showRegistrationDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Center(
        child: AlertDialog(
          title: Text(
            'Уважаемый пользователь, \n'
            'Спасибо, что установил наше мобильное приложение.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text("- Регистрация дает тебе возможность пользоваться всем функционалом приложения: "
                "пройти Школу пациентов, получить сертификат, вести свой дневник, записывать состояние, устанавливать "
                "напоминания о приеме лекарств, загружать анализы и формировать электронную медицинскую карту.\n"
                "- Ты можешь пользоваться приложением без регистрации, но тогда его функционал будет значительно ограничен. \n"
                "- При регистрации ты можешь не указывать свои реальные данные, а указать только свой НИК или неофициальную электронную почту. \n"
                "Все полученные данные строго конфиденциальны, хранятся в соответствие с Законом КР «Об информации персонального характера», "
                "не передаются и не обрабатываются третьими лицами.",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),

          actions: <Widget>[
            FlatButton(
              child: Text('back'.tr()),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
            FlatButton(
              child: Text('continue'.tr()),
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(ctx).pushNamed(Routes.signup);
              },
            )
          ],
        ),
      ),
    );
  }

  /// Button для Регистрации
  Widget _register() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            'dont_have_an_account'.tr(),
            style: TextStyle(
              color: Color(0xffbcbcbc),
              fontSize: 12,
              fontFamily: 'NunitoSans',
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(2),
          onTap: () => _showRegistrationDialog(),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              'register_now'.tr(),
              style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(45, 156, 219, 1),
                  ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.85),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      ChangeLanguageButton(),
                      _logo(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Center(
                        child: Text(
                          'Welcome'.tr(),
                          style: TextStyle(
                              color: Color.fromRGBO(80, 102, 188, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _signIn(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      _withoutAuth(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      _recommendationText(),
                      GestureDetector(
                        onTap: _launchURL,
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'instructions_to_app'.tr(),
                            style: TextStyle(
                              color: Color.fromRGBO(45, 156, 219, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      _register(),
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
