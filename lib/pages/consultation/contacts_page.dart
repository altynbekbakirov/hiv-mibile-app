import 'dart:convert';
import 'dart:io';
import 'package:hiv/data/configs.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/model/user.dart';
import 'package:hiv/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hiv/model/rating_model.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;
  DbUser user;
  bool logged = false;
  double consultant1 = 0;
  double consultant2 = 0;
  double consultant3 = 0;
  double consultant4 = 0;

  getUser() async {
    await DBProvider.db.getUser().then((value) {
      if (value != null) {
        setState(() {
          logged = true;
          user = value;
        });
        getRatings();
      }
    });
  }

  getRatings() async {
    await DBProvider.db.getRatingsByUser(user.id).then((value) {
      for (RatingModel model in value) {
        if (model.consultantId == 1) {
          setState(() {
            consultant1 = model.rating;
          });
        } else if (model.consultantId == 2) {
          setState(() {
            consultant2 = model.rating;
          });
        } else if (model.consultantId == 3) {
          setState(() {
            consultant3 = model.rating;
          });
        } else {
          setState(() {
            consultant4 = model.rating;
          });
        }
      }
    });
  }

  TextStyle tabStyle = TextStyle(fontSize: 16, color: kDarkGrayishBlue);

  @override
  void initState() {
    _nestedTabController = TabController(length: 4, vsync: this);
    super.initState();
    getUser();
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
            color: kLightGrayishBlue,
            borderRadius: BorderRadius.circular(12.0)),
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

    await launch(url());
    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  void launchTelegram({
    @required String profileName,
  }) async {
    //TODO Set profile name
    var url = 'https://t.me/$profileName';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Content Of (Telegram, Whatsapp, Call)
  Widget contentBuilder(String phoneNumber, String profileName, String title,
      String message, int consultant) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
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
            space,
            space,
            _rating(consultant),
          ],
        ),
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
          height: screenHeight * 0.60,
          child: TabBarView(
            controller: _nestedTabController,
            children: [
              // TODO Add telegram Profile Name
              contentBuilder('+996558558980', "996558558980",
                  'contact_to_doctor', 'Врач', 1),
              contentBuilder('+996558558981', "996558558981",
                  'contact_to_equal_consultant', 'Равный консультант', 2),
              contentBuilder('+996555558982', "996555558982",
                  'contact_to_psychologist', 'Психолог', 3),
              contentBuilder('+996558558983', "996558558983",
                  'contact_to_lawyer', 'Юрист', 4),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rating(int consultant) {
    return Column(
      children: [
        Text('rate_the_consultant'.tr(),
            style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: kLightGrayishBlue, borderRadius: BorderRadius.circular(8)),
          child: RatingBar.builder(
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: logged ? kDesaturatedBlue : kDarkGrayishBlue,
            ),
            unratedColor: kDarkGrayishBlue,
            onRatingUpdate: (v) async {
              if (!logged) {
                _showErrorDialog('login_or_sign_up_to_add'.tr());
              } else {
                final consultantName = consultant == 1
                    ? 'Врач'
                    : consultant == 2
                        ? 'Равный консультант'
                        : consultant == 3
                            ? 'Психолог'
                            : 'Юрист';
                RatingModel rating = RatingModel(
                    consultantId: consultant,
                    consultantName: consultantName,
                    userId: user.id,
                    userName: user.username,
                    rating: v);
                final resultRating = await checkRating(rating);
                if (resultRating.id != null) {
                  resultRating.rating = v;
                  await updateRating(resultRating);
                  consultant == 1 ? setState(() {consultant1 = v;}) : consultant == 2 ? setState(() {consultant2 = v;}) : consultant == 3 ? setState(() {consultant3 = v;}) : setState(() {consultant4 = v;});
                } else {
                  RatingModel resultModel = await insertRating(rating);
                  consultant == 1 ? setState(() {consultant1 = v;}) : consultant == 2 ? setState(() {consultant2 = v;}) : consultant == 3 ? setState(() {consultant3 = v;}) : setState(() {consultant4 = v;});
                }
              }
            },
            initialRating: consultant == 1 ? consultant1 : consultant == 2 ? consultant2 : consultant == 3 ? consultant3 : consultant4,
            minRating: 0,
            updateOnDrag: true,
            itemSize: 40,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 5),
          ),
        ),
      ],
    );
  }

  _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => Center(
        child: AlertDialog(
          title: Text(''),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('back'.tr()),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            FlatButton(
              child: Text('continue'.tr()),
              onPressed: () {
                Navigator.of(ctx).popAndPushNamed(Routes.login);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<RatingModel> checkRating(RatingModel rating) async {
    final url = Configs.ip + 'api/consultants_ratings/ratingexist';
    try {
      final headers = {"Content-type": "application/json"};
      final body = jsonEncode(rating.toJson());
      Response response =
          await post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        final result = await jsonDecode(utf8.decode(response.bodyBytes));
        return RatingModel.fromJson(result);
      } else if (response.statusCode == 404) {
        return RatingModel(id: null);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<RatingModel> updateRating(RatingModel rating) async {
    final url = Configs.ip + 'api/consultants_ratings/update';
    try {
      final headers = {"Content-type": "application/json"};
      Response response =
          await post(url, headers: headers, body: jsonEncode(rating.toJson()));
      if (response.statusCode == 200) {
        final result = await jsonDecode(utf8.decode(response.bodyBytes));
        await DBProvider.db.updateRating(RatingModel.fromJson(result));
        return RatingModel.fromJson(result);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<RatingModel> insertRating(RatingModel rating) async {
    final url = Configs.ip + 'api/consultants_ratings';
    try {
      final headers = {"Content-type": "application/json"};
      Response response =
          await post(url, headers: headers, body: jsonEncode(rating.toJson()));
      if (response.statusCode == 201) {
        final result = await jsonDecode(utf8.decode(response.bodyBytes));
        await DBProvider.db.insertRating(RatingModel.fromJson(result));
        return RatingModel.fromJson(result);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      throw error;
    }
  }
}
