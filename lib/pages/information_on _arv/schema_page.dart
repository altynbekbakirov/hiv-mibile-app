import 'package:HIVApp/model/arvp.dart';
import 'package:HIVApp/pages/information_on%20_arv/information_page.dart';
import 'package:HIVApp/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class SchemaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _widget(context);
  }

  Widget _widget(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('schemas'.tr()),
      ),
      body: InformationOnArvpPage(),
    );
  }
}



