import 'package:hiv/components/custom_button.dart';
import 'package:hiv/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../components/custom_button.dart';
import '../db/model/user.dart';
import '../db/db_provider.dart';

class PinCodeInputPage extends StatefulWidget {
  @override
  _PinCodeInputPageState createState() => _PinCodeInputPageState();
}

class _PinCodeInputPageState extends State<PinCodeInputPage> {
  DbUser _user;
  final _pinCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _pinCodeController,
                autofocus: true,
                maxLength: 4,
                decoration: InputDecoration(
                    hintText: '* * * * ',
                    labelText: 'pin_code'.tr(),
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: _passwordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )),
                obscureText: !_passwordVisible,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'isEmptyError'.tr();
                  } else {
                    return null;
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
                  } else {
                    if (_user.pin_code == _pinCodeController.text) {
                      Navigator.of(context).popAndPushNamed(Routes.home);
                    } else {
                      _showErrorDialog();
                    }
                  }
                },
                text: 'continue'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
