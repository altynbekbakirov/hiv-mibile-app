import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hiv/components/dots_indicator.dart';
import 'package:hiv/components/next_button.dart';
import 'package:hiv/components/custom_appbar.dart';
import 'package:hiv/model/user.dart';
import 'package:hiv/model/user_registrations.dart';
import 'package:hiv/routes/routes.dart';
import '../../components/text_form_field.dart';
import '../../utils/constants.dart';
//enum Gender { male, female }

class Questionary extends StatefulWidget {
  final User user;

  Questionary({this.user});

  @override
  _QuestionaryState createState() => _QuestionaryState();
}

class _QuestionaryState extends State<Questionary> {
  final _birthYearController = TextEditingController();
  Gender _gender = new Gender();
  Sex _sex = new Sex();
  List<Gender> _genders = new List<Gender>();
  List<Sex> _sexes = new List<Sex>();
  User _user;
  final GlobalKey<FormState> _formKey = GlobalKey();
  var selectedImg = 'assets/images/selected-icon.png';
  var unselectedImg = 'assets/images/unselected-icon.png';

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _sexes = Provider.of<UserRegistration>(context, listen: false).sexes;
    _genders = Provider.of<UserRegistration>(context, listen: false).genders;
    _sex = _sexes.first;
    _gender = _genders.first;
  }

  bool isChecked = false;
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  /// Выпадающий список для Sex
  Widget _sexDropDownList(Sex sex, List<Sex> sexes) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: kLightGrayishBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<Sex>(
                value: sex,
                hint: Text(
                  "first_question".tr(),
                ),
                style: TextStyle(color: kDarkGrayishBlue, fontSize: 16),
                isExpanded: true,
                underline: SizedBox(),
                dropdownColor: kLightGrayishBlue,
                icon: Icon(Icons.arrow_drop_down_outlined),
                onChanged: (newValue) {
                  setState(() {
                    _sex = newValue;
                  });
                },
                items: sexes.map<DropdownMenuItem<Sex>>((Sex value) {
                  return DropdownMenuItem<Sex>(
                    value: value,
                    child: Text(value.ru),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Выпадающий список для Gender
  Widget _genderDropDownList(Gender gender, List<Gender> genders) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: kLightGrayishBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<Gender>(
                value: gender,
                hint: Text(
                  "first_question".tr(),
                ),
                style: TextStyle(color: kDarkGrayishBlue, fontSize: 16),
                isExpanded: true,
                underline: SizedBox(),
                dropdownColor: kLightGrayishBlue,
                icon: Icon(Icons.arrow_drop_down_outlined),
                onChanged: (newValue) {
                  setState(() {
                    _gender = newValue;
                  });
                },
                items: genders.map<DropdownMenuItem<Gender>>((Gender value) {
                  return DropdownMenuItem<Gender>(
                    value: value,
                    child: Text(value.ru),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Check box для Интерсекс
  Widget _interSex() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Image.asset(
              isChecked ? selectedImg : unselectedImg,
              width: 16,
            ),
          ),
          Text(
            'intersex'.tr(),
            style: TextStyle(fontSize: 16, color: kDarkGrayishBlue),
          ),
        ],
      ),
    );
  }

  /// Форма для анкеты
  Widget _questionaryForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: _genderDropDownList(_gender, _genders),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: _interSex(),
          ),
          _sexDropDownList(_sex, _sexes),
          Padding(
            padding: const EdgeInsets.only(left: 36, top: 20, bottom: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "birth_year".tr(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kDarkGrayishBlue),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: CustomTextFormField(
              controller: _birthYearController,
              keyboardType: TextInputType.number,
              fillColor: kLightGrayishBlue,
              focusedBorderColor: kDesaturatedBlue,
              borderRadius: 8.0,
              hintText: '2000',
              validator: (value) {
                if (value.isEmpty || value.length != 4) {
                  return 'fillThisField'.tr();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Методя для сохраниения данных пользователя и переход на след. страницу
  void _nextButtonFunc() {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _user.gender = _gender.id;
      _user.sex = _sex.id;
      _user.intersex = rememberMe;
      _user.birth_year = int.parse(_birthYearController.text);

      _user.create().then((value) {
        Navigator.pushNamed(context, Routes.successfull_registration);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar("questionary".tr())),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _questionaryForm(),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: NextButton(
                            onPressed: _nextButtonFunc, text: 'next'.tr(), fillColor: kDesaturatedBlue,),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Text('questionnaire_description'.tr(),
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(104, 110, 135, 1)),
                            maxLines: 5,
                            softWrap: true,
                            textAlign: TextAlign.center),
                      ),
                      Expanded(child: SizedBox(height: 10)),
                      Center(child: DotIndicator(dotsCount: 3, position: 2)),
                    ],
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
