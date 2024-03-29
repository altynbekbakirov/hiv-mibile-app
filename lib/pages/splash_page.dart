import 'dart:async';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/pref_manager.dart';
import '../routes/routes.dart';
import '../utils/app_themes.dart';
import '../utils/constants.dart';
import '../utils/themebloc/theme_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  DbUser user;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    getUser();
    _timer = Timer(const Duration(seconds: 5), () => {
      _loadScreen()});
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future getUser() async {
    await DBProvider.db.getUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  Future _loadScreen() async {
    await Prefs.load().then((value) {
      context.bloc<ThemeBloc>().add(ThemeChanged(
          theme: Prefs.getBool(Prefs.DARKTHEME, def: false)
              ? AppTheme.DarkTheme
              : AppTheme.LightTheme));
      Prefs.setString('ribbon',
          Prefs.getBool(Prefs.DARKTHEME, def: false) ? 'ribbon11' : 'ribbon');
      if (Prefs.getString('language') == null)
        Navigator.of(context).pushReplacementNamed(Routes.auth);
      else {
        if (user != null) {
          if (user.pin_code != null)
            Navigator.of(context).pushReplacementNamed(Routes.pin_code_screen);
          else
            Navigator.of(context).pushReplacementNamed(Routes.home);
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.chooseRegistration);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kBrightRed,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo-animation.gif',
                    height: 104,
                    width: 104,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text('Республиканский \nцентр «СПИД»'.toUpperCase(),
                      style:
                        TextStyle(
                            fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                        ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
