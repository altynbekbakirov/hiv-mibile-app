import 'package:hiv/model/user_registrations.dart';
import 'package:hiv/pages/settings/widgets/change_password.dart';
import 'package:hiv/pages/settings/widgets/reset_password.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class PinCode extends StatefulWidget {
  const PinCode({Key key, this.userName, this.pin}) : super(key: key);

  final String userName;
  final String pin;

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: OTPScreen(userName: widget.userName, pin: widget.pin),
      ),
    );
  }
}

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key key, this.userName, this.pin}) : super(key: key);
  final String userName;
  final String pin;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextStyle headStyle = TextStyle(
    color: kDarkModerateBlue,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authorized';
  int pinIndex = 0;
  bool fingerprintPressed = false;
  bool deletePressed = false;
  String pin;

  @override
  void initState() {
    super.initState();
    Provider.of<UserRegistration>(context, listen: false).getList();
    pin = widget.pin;
    _checkBiometrics();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              child: Text("pin_code_enter".tr(), style: headStyle),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              color: kColorWhite,
              child: buildPinRow(),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: kColorWhite,
              child: buildNumberPad(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(
                        userName: widget.userName,
                        fromChangePassword: false,
                      ),
                    ),
                  );
                },
                child: Text(
                  "forgot_pin_code".tr(),
                  style: TextStyle(
                      color: kBrightBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _checkBiometrics() async {
    try {
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
    });
  }

  Future<void> _getAvailableBiometrics() async {
    try {
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'fingerprint_scan'.tr(),
          androidAuthStrings: AndroidAuthMessages(
            signInTitle: "fingerprint_auth".tr(),
            fingerprintHint: "",
            cancelButton: "cancel".tr(),
          ),
          iOSAuthStrings: IOSAuthMessages(
            cancelButton: "cancel".tr(),
          ),
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }


  buildNumberPad() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                  number: 1,
                  onPressed: () {
                    pinIndexSetup("1");
                  },
                ),
                KeyboardNumber(
                  number: 2,
                  onPressed: () {
                    pinIndexSetup("2");
                  },
                ),
                KeyboardNumber(
                  number: 3,
                  onPressed: () {
                    pinIndexSetup("3");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                  number: 4,
                  onPressed: () {
                    pinIndexSetup("4");
                  },
                ),
                KeyboardNumber(
                  number: 5,
                  onPressed: () {
                    pinIndexSetup("5");
                  },
                ),
                KeyboardNumber(
                  number: 6,
                  onPressed: () {
                    pinIndexSetup("6");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeyboardNumber(
                  number: 7,
                  onPressed: () {
                    pinIndexSetup("7");
                  },
                ),
                KeyboardNumber(
                  number: 8,
                  onPressed: () {
                    pinIndexSetup("8");
                  },
                ),
                KeyboardNumber(
                  number: 9,
                  onPressed: () {
                    pinIndexSetup("9");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _iconsWidget(
                  path: 'assets/images/Touch ID.png',
                  onPressed: () {
                    _authenticate().then((value) {
                      print(pin);
                      if (_authorized == 'Authorized') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePasswordPage(
                                false,
                                userName: widget.userName,
                              ),
                            ));
                      }
                    });
                  },
                  height: 49,
                  width: 49,
                  boxColor: fingerprintPressed ? kModerateBlue : kColorWhite,
                  imageColor: fingerprintPressed ? kColorWhite : null,
                  selectWidget: 0,
                ),
                KeyboardNumber(
                  number: 0,
                  onPressed: () {
                    pinIndexSetup("0");
                  },
                ),
                _iconsWidget(
                  path: deletePressed
                      ? 'assets/images/DeleteDark.png'
                      : 'assets/images/Delete.png',
                  onPressed: () {
                    clearPin();
                  },
                  height: 20,
                  width: 30,
                  boxColor: deletePressed ? kModerateBlue : kColorWhite,
                  selectWidget: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _iconsWidget(
      {String path,
      Function onPressed,
      double height,
      double width,
      Color boxColor,
      Color imageColor,
      int selectWidget}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectWidget == 0
              ? fingerprintPressed = false
              : deletePressed = false;
        });
        onPressed();
      },
      onTapDown: (value) {
        setState(() {
          selectWidget == 0 ? fingerprintPressed = true : deletePressed = true;
        });
      },
      onTapCancel: () {
        setState(() {
          selectWidget == 0
              ? fingerprintPressed = false
              : deletePressed = false;
        });
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 90.0,
          child: Image.asset(
            path,
            cacheHeight: height.toInt(),
            cacheWidth: width.toInt(),
            color: imageColor,
          ),
        ),
      ),
    );
  }

  clearPin() {
    setState(() {
      if (pinIndex == 0)
        pinIndex = 0;
      else if (pinIndex == 4) {
        setPin(pinIndex, "");

        currentPin[pinIndex - 1] = "";
        pinIndex--;
      } else {
        setPin(pinIndex, "");
        currentPin[pinIndex - 1] = "";
        pinIndex--;
      }
    });
  }

  pinIndexSetup(String text) {
    setState(() {
      if (pinIndex == 0)
        pinIndex = 1;
      else if (pinIndex < 4) pinIndex++;
      setPin(pinIndex, text);
      currentPin[pinIndex - 1] = text;
      String strPin = '';
      currentPin.forEach((e) {
        strPin += e;
      });
      if (pinIndex == 4 && pin != null) {
        currentPin.join() == pin
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChangePasswordPage(false, userName: widget.userName),
                ))
            : _clearRow();
      } else {
        _clearRow();
      }
    });
  }

  _clearRow() {
    setState(() {
      pinIndex = 0;
      pinOneController.text = "";
      pinTwoController.text = "";
      pinThreeController.text = "";
      pinFourController.text = "";
    });
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PINNumber(
          textEditingController: pinOneController,
        ),
        SizedBox(width: 16),
        PINNumber(
          textEditingController: pinTwoController,
        ),
        SizedBox(width: 16),
        PINNumber(
          textEditingController: pinThreeController,
        ),
        SizedBox(width: 16),
        PINNumber(
          textEditingController: pinFourController,
        ),
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  const PINNumber({Key key, this.textEditingController}) : super(key: key);
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16.0,
      height: 16.0,
      decoration: BoxDecoration(
        color: textEditingController.text.isNotEmpty
            ? kModerateBlue
            : kLightGrayishBlue,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

class KeyboardNumber extends StatefulWidget {
  const KeyboardNumber({Key key, this.number, this.onPressed})
      : super(key: key);
  final int number;
  final Function onPressed;

  @override
  _KeyboardNumberState createState() => _KeyboardNumberState();
}

class _KeyboardNumberState extends State<KeyboardNumber> {
  bool _flag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          setState(() => _flag = false);
          widget.onPressed();
        },
        onTapDown: (value) {
          setState(() => _flag = true);
        },
        onTapCancel: () {
          setState(() => _flag = false);
        },
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              color: _flag ? kModerateBlue : kColorWhite,
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "${widget.number}",
                style: TextStyle(
                  color: _flag ? kColorWhite : kModerateBlue,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // style: ElevatedButton.styleFrom(
          //   primary: _flag ? kColorWhite : kModerateBlue, // This is what you need!
          // ),
        ),
      ),
    );
  }
}
