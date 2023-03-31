import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../db/notification.dart';
import '../../db/db_provider.dart';
import '../../components/custom_button.dart';
import 'package:hiv/routes/routes.dart';

class VisitPage extends StatefulWidget {
  @override
  _VisitPageState createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {

  List<NotificationDb> _list = new List<NotificationDb>();
  bool logged = false;

  isLoggedIn() async {
    await DBProvider.db.getUserId().then((value) {
      if(value != null)
        setState(() {
          logged = true;
        });
    });
  }
  void _showErrorDialog(String message) {
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

  _getListOfNotifications() async{
    await DBProvider.db.getAllNotifications().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  void initState() {
    isLoggedIn();
    _getListOfNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('doctor_visit'.tr()),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Text('notes'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
//                      separatorBuilder: (context, index) => Divider(),
                      padding: const EdgeInsets.all(8),
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Text(
                            '${_list[index].datetime.year}-${_list[index]
                                .datetime.month}-${_list[index].datetime
                                .day}\n${_list[index].datetime
                                .hour}:${_list[index].datetime.minute}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text('${_list[index].description}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                  ),
                ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomButton(
                  text: 'add'.tr(),
                  onPressed: (){
                    if(logged){
                      Navigator.pushNamed(context, Routes.visit_add);
                    }
                    else{
                      _showErrorDialog('login_or_sign_up_to_add'.tr());
                    }
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
