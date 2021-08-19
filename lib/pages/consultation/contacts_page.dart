import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  TextStyle tabStyle = TextStyle(fontSize: 16 ,color: kDarkGrayishBlue);

  @override
  void initState() {
    _nestedTabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  get space => SizedBox(height: 20);

  /// WhatsApp link
  Widget _whatsapp(String phoneNumber, String message) {
    return InkWell(
      onTap: () => launchWhatsApp(phone: phoneNumber, message: message.tr()),
      child: Container(
        decoration: BoxDecoration(
            color: kLightGrayishBlue,
            borderRadius: BorderRadius.circular(12.0)),
        height: 64,
        width: 216,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Container(
                child: FaIcon(FontAwesomeIcons.whatsapp,
                    color: kModerateBlue, size: 32),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  "Whatsapp",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Telegram
  Widget _telegram(String profileName) {
    return InkWell(
      onTap: () => launchTelegram(profileName: profileName),
      child: Container(
        decoration: BoxDecoration(
            color: kLightGrayishBlue, borderRadius: BorderRadius.circular(12.0)),
        height: 64,
        width: 216,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Container(
                child: FaIcon(FontAwesomeIcons.telegram,
                    size: 32, color: kModerateBlue),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("Telegram", style: TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Позвонить
  Widget _call(String phoneNumber) {
    return InkWell(
      onTap: () => launch('tel://$phoneNumber'),
      child: Container(
        decoration: BoxDecoration(
            color: kLightGrayishBlue,
            borderRadius: BorderRadius.circular(12.0)),
        height: 64,
        width: 216,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kModerateBlue),
                    child: Icon(Icons.phone, color: kColorWhite, size: 20),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("Позвонить", style: TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Запуск WhatsApp
  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      } else {
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  void launchTelegram({
    @required String profileName,
  }) async {
    var url = 'https://t.me/$profileName';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Content Of (Telegram, Whatsapp, Call)
  Widget contentBuilder(String phoneNumber, String profileName, String title, String message) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Text(
            title.tr(),
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          space,
          _whatsapp(phoneNumber, message),
          space,
          _telegram(profileName),
          space,
          _call(phoneNumber),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: kModerateBlue,
          labelColor: kModerateBlue,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text("Врач".toUpperCase(), style: tabStyle),
            ),
            Tab(
              child: Text("Равный консультант".toUpperCase(), style: tabStyle),
            ),
            Tab(
              child: Text("Психолог".toUpperCase(), style: tabStyle),
            ),
            Tab(
              child: Text("Юрист".toUpperCase(), style: tabStyle),
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.50,
          child: TabBarView(
            controller: _nestedTabController,
            children: [
              // TODO Add telegram Profile Name
              contentBuilder('996558558980', "", 'contact_to_doctor', "doctor_consultation"),
              contentBuilder('996558558981', "", 'contact_to_equal_consultant', 'equal_consultant'),
              contentBuilder('996558558982', "", 'contact_to_psychologist', 'Психолог'),
              contentBuilder('996558558983', "", 'contact_to_lawyer', 'Юрист'),
            ],
          ),
        ),
      ],
    );
  }
}
