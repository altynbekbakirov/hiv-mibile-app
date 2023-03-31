import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/model/consultation.dart';
import 'package:hiv/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {

  String image_file_path = 'assets/images/';
  var dark = Prefs.getBool(Prefs.DARKTHEME, def: false) ? '1.png':'.png';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Enter home page');
    super.build(context);
    Provider.of<Consultation>(context, listen: false).getConsultants();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
//              color: Colors.indigo[200],
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    image_file_path + 'school'+dark,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  'patient_school'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).cursorColor,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.school),
              ),
            ),
            Card(
//              color: Colors.indigo[200],
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    image_file_path + 'info'+dark,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  'information_about_hiv'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).cursorColor,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.basic_information),
              ),
            ),
            Card(
//              color: Colors.indigo[200],
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    image_file_path + 'test'+dark,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  'get_tested_to_hiv'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).cursorColor,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.test_information),
              ),
            ),
            Card(
//              color: Colors.indigo[200],
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    image_file_path + 'medicine'+dark,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  'hiv_treatment'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).cursorColor,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.treatment),
              ),
            ),
            Card(
//              color: Colors.indigo[200],
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    image_file_path + 'chat'+dark,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  'receive_consultation'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).cursorColor,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.consultation),
              ),
            ),
            Card(
//              color: Colors.indigo[200],
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    image_file_path + 'health'+dark,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  'my_condition'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).cursorColor,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.my_state),
              ),
            ),
            Card(
//              color: Colors.indigo[200],
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    image_file_path + 'doctor'+dark,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                'doctor_visit'.tr(),
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).cursorColor,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.visit_doctor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
