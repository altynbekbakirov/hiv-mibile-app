import 'dart:io';
import 'dart:ui';
import 'package:hiv/components/app_bar_arrow_back.dart';
import 'package:hiv/utils/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: "patient_school".tr().toUpperCase(),
        action: IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SendEmail()));
          },
        ),
      ),
      backgroundColor: kBrightRed,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: Image.asset(
            "assets/images/Certificate.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SendEmail extends StatefulWidget {
  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final subjectController = TextEditingController(text: 'email_body'.tr());
  List<String> attachment = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("share_certificate".tr()),
          centerTitle: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  validator: (value) {
                    if (value.isEmpty || !EmailValidator.validate(value)) {
                      return "email_validator_invalid".tr();
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'email_to'.tr(),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                  ),
                  maxLength: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: subjectController,
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  maxLength: 100,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "email_subject_invalid".tr();
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'email_subject'.tr(),
                    prefixIcon: Icon(Icons.subject),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        subjectController.clear();
                      },
                    ),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text("email_send".tr()),
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      FocusScope.of(context).unfocus();
                      try {
                        await sendEmail(emailTo: emailController.text, subject: subjectController.text).then((value) {
                          Navigator.of(context).pop();
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString()),
                        ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                )
              ],
            ),
          ),
        ));
  }

  Future sendEmail({String emailTo, String subject}) async {
    final bytes = await rootBundle.load('assets/images/Certificate.png');
    final list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/Certificate.png').create(recursive: true);
    file.writeAsBytesSync(list);

    String result = "<img src=\"${file.path}\" alt=\"image\" />";

    final Email email = Email(
      body: result,
      subject: subject,
      recipients: [emailTo],
      // attachmentPaths: ['${file.path}'],
      isHTML: true,
    );
    await FlutterEmailSender.send(email);
  }

  void _openImagePicker() async {
    File pick = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      attachment.add(pick.path);
    });
    print(pick.path);
  }
}
