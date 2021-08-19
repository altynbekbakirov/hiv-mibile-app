import 'package:HIVApp/components/custom_button.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../components/custom_button.dart';
import '../components/text_form_field.dart';
import '../utils/constants.dart';
import '../db/model/user.dart';
import '../db/db_provider.dart';

class PinCodeInputPage extends StatefulWidget {
  @override
  _PinCodeInputPageState createState() => _PinCodeInputPageState();
}

class _PinCodeInputPageState extends State<PinCodeInputPage> {
  DbUser _user;
  final _pinCodeController = TextEditingController();
  final _confirmPinCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    await DBProvider.db.getUser().then((value) {
      setState(() {
        _user = value;
      });
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Center(
        child: AlertDialog(
          title: Text('error'.tr()),
          content: Text('incorrect_pin_code'.tr()),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        Text(
                          'pin_code'.tr(),
                          style: kInputTextStyle,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomTextFormField(
                                controller: _pinCodeController,
                                hintText: '* * * * * *',
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'isEmptyError'.tr();
                                  }
                                },
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              ),
                              CustomButton(
                                padding: EdgeInsets.all(20),
                                onPressed: () {
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  }
                                  else{
                                    if(_user.pin_code == _pinCodeController.text){
                                      Navigator.of(context).popAndPushNamed(Routes.home_new);
                                    }
                                    else{
                                      _showErrorDialog();
                                    }
                                  }
                                },
                                text: 'continue'.tr(),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
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
