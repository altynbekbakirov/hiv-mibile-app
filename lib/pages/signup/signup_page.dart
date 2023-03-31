import 'package:hiv/components/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'package:hiv/components/sign_up_form.dart';
import 'package:hiv/components/custom_appbar.dart';


enum Gender { male, female }

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar("Account".tr())
      ),
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WidgetSignup(),
                        Expanded(child: SizedBox(height: 100)),
                        Center(
                          child: Text(
                            '${'already_a_member'.tr()}',
                            style: TextStyle(
                              color: Color(0xffbcbcbc),
                              fontSize: 12,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(2),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'SignIn'.tr(),
                                style:
                                    Theme.of(context).textTheme.button.copyWith(
                                          fontSize: 16,
                                          color: kBrightBlue,
                                        ),
                              ),
                            ),
                          ),
                        ),
                        Center(child: DotIndicator(dotsCount: 3, position: 0)),
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
