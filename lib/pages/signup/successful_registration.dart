import 'package:hiv/components/custom_outline_button.dart';
import 'package:hiv/components/next_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class SuccessfullRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _unnecessaryPinCodeButton() {
      return Container(
        height: 56.0,
        child: CustomOutlineButton(
          text: 'no_need_pin_code'.tr().toUpperCase(),
          color: kDesaturatedBlue,
          splashColor: kModerateBlue,
          textSize: 16,
          fontWeight: FontWeight.w500,
          borderRadius: 8.0,
          borderWidth: 2,
          onPressed: () {

            Navigator.of(context).popAndPushNamed(Routes.home);
          },
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Center(
                          child: Container(
                            height: 216,
                            child: Image.asset(
                                'assets/images/succes_registration.png'),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'congratulation'.tr(),
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: kDarkModerateBlue),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 20),
                                child: Text(
                                  'successful_registration_text'.tr(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: kDarkModerateBlue),
                                  maxLines: 5,
                                  softWrap: true,
                                ),
                              ),
                              NextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .popAndPushNamed(Routes.pin_code);
                                },
                                text: 'set_pin_code'.tr().toUpperCase(),
                                textSize: 16,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              _unnecessaryPinCodeButton(),
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: Text('pin_code_description'.tr(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromRGBO(104, 110, 135, 1)),
                                    maxLines: 5,
                                    softWrap: true,
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 20,
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
