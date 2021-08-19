import 'package:HIVApp/model/consultation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:http/http.dart" as http;
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultantContactPage extends StatefulWidget {
  ConsultantModel model;


  ConsultantContactPage({this.model});

  @override
  _ConsultantContactPageState createState() => _ConsultantContactPageState();
}

class _ConsultantContactPageState extends State<ConsultantContactPage> {

  String _platformVersion = 'Unknown';
  ConsultantModel model = new ConsultantModel();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    model = widget.model;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  _callMe(String num) async {
    // Android
    var uri = 'tel:'+num;
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      uri = 'tel:'+num;
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  writeToWhatsApp(String num) async{
    final response =
    await http.get('https://api.whatsapp.com/send?phone='+num);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return response;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  _telegramMe(String username) async {
    var uri = 'https://telegram.me/'+ username;
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      uri = 'https://telegram.me/'+ username;
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _facebookMe(String facebook) async {
    var uri = 'fb://profile/'+facebook;
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      uri = 'fb://page/'+facebook;
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('receive_consultation'.tr()),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                'contact_consultant_through'.tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'WhatsApp',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 40,),
              onTap: () => FlutterOpenWhatsapp.sendSingleMessage(model.whatsapp, ""),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Telegram',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.telegram, color: Colors.lightBlue, size: 40,),
              onTap: () => _telegramMe(model.telegram),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Facebook',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 40,),
              onTap: () => _facebookMe(model.facebook),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'call_to_phone'.tr(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.phoneSquareAlt, color: Colors.lightGreen, size: 40,),
              onTap: () => _callMe(model.phone_number),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'consultant_on_map'.tr(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen
                ),
              ),
              leading: FaIcon(FontAwesomeIcons.mapMarked, color: Colors.lightGreen, size: 40,),
              onTap: () => MapsLauncher.launchCoordinates(model.location.latitude, model.location.longitude),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
