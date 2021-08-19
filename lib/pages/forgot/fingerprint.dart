import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class PinCode extends StatefulWidget {
  const PinCode({Key key}) : super(key: key);

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: OTPScreen(),
      ),
    );
  }
}

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key key}) : super(key: key);

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
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  int pinIndex = 0;
  bool fingerprintPressed = false;
  bool deletePressed = false;

  @override
  void initState() {
    super.initState();
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
              child: Text("Введите ПИН-КОД", style: headStyle),
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
              child: Text(
                "Забыли Пин-Код?",
                style: TextStyle(
                    color: kBrightBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
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

  void _cancelAuthentication() {
    auth.stopAuthentication();
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

                    // _checkBiometrics();
                    // _getAvailableBiometrics();
                    _authenticate();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(_isAuthenticating ? "Hello" : "yeas")
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
      if (pinIndex == 4) print(pinIndex);
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
