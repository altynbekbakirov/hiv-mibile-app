import 'package:HIVApp/model/consultation.dart';
import 'package:HIVApp/pages/consultation/consultant_contacts.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class ConsultationPage extends StatefulWidget {
  @override
  _ConsultationPageState createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {

  List<ConsultantModel> _list = new List<ConsultantModel>();

  @override
  void initState() {
    super.initState();
    _list = Provider.of<Consultation>(context, listen: false).list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('receive_consultation'.tr()),
      ),
      body: Container(
        alignment: Alignment(-0.3,-1.0),
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(
                  _list[index].theme.ky,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ConsultantContactPage(model: _list[index]),
                ),)
            );
          },
        ),
      ),
    );
  }
}


