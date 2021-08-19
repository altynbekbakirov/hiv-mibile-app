import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:HIVApp/components/next_button.dart';
import 'package:HIVApp/components/custom_appbar.dart';
import 'package:HIVApp/model/user.dart';
import 'package:HIVApp/routes/routes.dart';
import '../../components/text_form_field.dart';
import '../../utils/constants.dart';

/// Страница установки ПИН-КОДа
class PinCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar("pin_code".tr())),
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
                      SizedBox(
                        height: 30,
                      ),
                      PinCode(),
                      Expanded(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
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

class PinCode extends StatefulWidget {
  @override
  PinCodeState createState() => PinCodeState();
}

class PinCodeState extends State<PinCode> {

  bool isButtonActive = false;

  /// Метод для установки Пин-кода
  void _pinCodeFunc(){
    if (!_formKey.currentState.validate()) {
      return;
    }
    else {
      Provider.of<User>(context, listen: false).setPinCode(
          _pinCodeController.text).then((value) =>
          Navigator.of(context).pushNamed(Routes.home));
    }
  }

  /// Форма для установки Пин-кода
  Widget _form(){
    return Focus(
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            controller: _pinCodeController,
            hintText: "pin_code".tr(),
            hintStyle: TextStyle(color: kGrayishBlue, fontSize: 16, fontWeight: FontWeight.w400),
            obscureText: true,
            fillColor: kLightGrayishBlue,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'fillThisField'.tr();
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: _confirmPinCodeController,
            fillColor: kLightGrayishBlue,
            hintText: 'confirm_pin_code'.tr(),
            hintStyle: TextStyle(color: kGrayishBlue, fontSize: 16, fontWeight: FontWeight.w400),
            obscureText: true,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'fillThisField'.tr();
              }
              else if (value != _pinCodeController.text) {
                return 'pinCodeNotSameError'.tr();
              }
            },
          ),
          SizedBox(
            height: 35,
          ),
          NextButton(
            fillColor: !isButtonActive ? kGrayishBlue : null,
            onPressed: isButtonActive ? _pinCodeFunc : null,
            text: 'set_pin_code'.tr().toUpperCase(),
            textSize: 16,
          ),
        ],
      ),
      onFocusChange: (hasFocus){
        if(!hasFocus){
          isButtonActive = _formKey.currentState.validate() ? true : false;
        }
      },
    );
  }

  final _pinCodeController = TextEditingController();
  final _confirmPinCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _form(),
          ],
        ),
      ),
    );
  }
}
