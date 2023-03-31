import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../data/pref_manager.dart';
import '../Enums/language-type.dart';
import 'package:hiv/components/radio_button.dart';
import 'package:hiv/model/radio_model.dart';

class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({Key key}) : super(key: key);

  @override
  _ChangeLanguageButtonState createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  List<RadioModel> _sampleData = List<RadioModel>();

  var _language;
  @override
  void initState() {
    super.initState();
    _sampleData.add(new RadioModel(false, "Русский"));
    _sampleData.add(new RadioModel(false, "Кыргызча"));

    if(Prefs.getString('language', def: null) == null)
      Prefs.setLanguage('ru');


    switch (Prefs.getString('language', def: null)) {
      case 'ky':
        _language = Language.kyrgyz;
        _sampleData[1].isSelected = true;
        break;

      case 'ru':
        _language = Language.russian;
        _sampleData[0].isSelected = true;
        break;

      default:
        break;
    }
  }

  _changeLanguage(int index) {
    switch (index) {
      case 0:
        _sampleData.forEach((element) => element.isSelected = false);
        _sampleData[1].isSelected = true;

        _language = Language.kyrgyz;
        Prefs.setLanguage('ky');
        break;

      case 1:
        _sampleData.forEach((element) => element.isSelected = false);
        _sampleData[0].isSelected = true;

        _language = Language.russian;
        Prefs.setLanguage('ru');
        break;
    }
    EasyLocalization.of(context).locale = EasyLocalization.of(context).supportedLocales[index];
  }

  @override
  Widget build(BuildContext context) {
    Color languageBackground = Color.fromRGBO(242, 244, 249, 1);
    return Container(
      height: 32.0,
      width: 183.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: RadioItem(_sampleData[0]),
            onTap: () {
              _changeLanguage(1);
            },
          ),
          GestureDetector(
            child: RadioItem(_sampleData[1]),
            onTap: () {
              _changeLanguage(0);
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: languageBackground,
          borderRadius: BorderRadius.all(Radius.circular(100.0))
      ),
    );
  }
}