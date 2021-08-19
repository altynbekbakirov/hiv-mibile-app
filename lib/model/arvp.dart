import 'package:flutter/cupertino.dart';

enum PageType {schema,info}

class ARVP extends ChangeNotifier{
  String name;
  PageType page = PageType.schema;

  void setName(String new_name){
    name = new_name;
    notifyListeners();
  }

  void changePage(){
    page = PageType.info;
    notifyListeners();
  }

  PageType getPage(){
    return page;
  }

}