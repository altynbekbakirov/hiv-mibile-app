import 'dart:convert';
import 'package:hiv/data/configs.dart';
import 'package:http/http.dart' as http;

import '../db/db_provider.dart';
import '../db/model/user.dart';

class Organization{
  String organization_name;
  String city;
  String street;
  String phone_number;
  String working_hours;
  OrganizationLocation location;

  static Future<List<OrganizationType>> get(int type_id) async {

    final url = Configs.ip + 'api/organizations/'+type_id.toString();
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.get(
        url,
        headers: headers,
      );
      return responseToObjectList(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }

  static Future<List<OrganizationType1>> getTypes() async {

    final url = Configs.ip + 'api/organizationtypes';
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.get(
        url,
        headers: headers,
      );
      return responseToObjectTypeList(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }
  static List<OrganizationType> responseToObjectList(var responseBody){
    List<OrganizationType> list = new List<OrganizationType>();
    for(var j in responseBody) {
      OrganizationType type = new OrganizationType();
      List<Organization> orgList = new List<Organization>();
      var orgType = j[0]['organizationtype'];
      type.ky = orgType['ky'];
      type.ru = orgType['ru'];
      var c=0;
      for (var i in j) {
        if(c != 0)
          orgList.add(responseToObjects(i));
        c++;
      }
      type.list = orgList;
      list.add(type);
    }
    return list;
  }

  static List<OrganizationType1> responseToObjectTypeList(var responseBody){
    List<OrganizationType1> list = new List<OrganizationType1>();
    for(var j in responseBody) {
      OrganizationType1 type = new OrganizationType1();
      var orgType = j['organizationtype'];
      type.ky = orgType['ky'];
      type.ru = orgType['ru'];
      type.id = j['id'];
      list.add(type);
    }
    return list;
  }

  static Organization responseToObjects(var i){
    OrganizationLocation organizationLocation = new OrganizationLocation();
    organizationLocation.longitude = i['location']['longitude'];
    organizationLocation.latitude = i['location']['latitude'];
    Organization model = new Organization();
    model.organization_name = i['organization_name'];
    model.city = i['city'];
    model.street = i['street'];
    model.phone_number = i['phone_number'];
    model.working_hours = i['working_hours'];
    model.location = organizationLocation;
    return model;
  }
}

class OrganizationLocation{
  double longitude;
  double latitude;
}
class OrganizationType{
  String ky;
  String ru;
  List<Organization> list;
}

class OrganizationType1{
  int id;
  String ky;
  String ru;
}
