import 'dart:async';
import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';
import 'package:hiv/data/pref_manager.dart';
import '../../model/organization.dart';
import '../../model/user.dart';

class PinInformation {
  String pinPath;
  String avatarPath;

//  LatLng location;
  String locationName;
  Color labelColor;

  PinInformation(
      {this.pinPath,
      this.avatarPath,
//    this.location,
      this.locationName,
      this.labelColor});
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var bitmapImage;
  double pinPillPosition = -1000;
  String pinTitle = '';
  String pinName = '';
  MapController mapController;
  List<OrganizationType> _orgList = [];
  List<OrganizationType1> _orgList1 = [];
  List<Marker> _markers = new List<Marker>();
  int type_id = 0;

  int selected_index = -1;

  void onMarkerTapped(int markerId, double lat, double lng,
      {Organization organization}) async {
    String locationType;
    String locationName;
    /*if(markerId == 2){
      locationType = 'г. Бишкек Респ. центр "СПИД"';
      locationName = '+996 (312) 30-054';
    }
    else if(markerId == 1){
      locationType = 'г. Бишкек ул. Токтогула. 62А';
      locationName = '+996 (312) 43-40-76, 48-66-17';
    }
    else if(markerId == 3){
      locationType = 'г. Токмок Чуйский центр "СПИД"';
      locationName = '03138-3-35-26, 7-40-18';
    }
    else if(markerId == 4){
      locationType = 'г. Каракол ул. Пролетарская. 118';
      locationName = '59-75-9, 51-66-4';
    }
    else if(markerId == 5){
      locationType = 'г. Нарын Раззакова. 1';
      locationName = '51-94-2, 53-05-4';
    }
    else if(markerId == 6){
      locationType = 'г. Джала-Абад ул. Курортная. 37';
      locationName = '60-34-2, 23-15-9';
    }
    else if(markerId == 7){
      locationType = 'г. Ош пер. Моминова. 10';
      locationName = '57-13-4, 74-72-6';
    }
    else if(markerId == 8){
      locationType = 'г. Баткен ул. Раззакова. 13';
      locationName = '50-48-9, 50-87-7';
    }
    else if(markerId == 9){
      locationType = 'г. Талас ул. Ленина. 257';
      locationName = '55-23-6, 29-60-91';
    }*/
    if (markerId == 10) {
      locationType =
          "${organization.organization_name}\n${organization.city}. ${organization.street}.";
      locationName =
          "${organization.working_hours}."; /*${organization.working_hours}*/
    }
    setState(() {
      pinTitle = locationName;
      pinName = locationType;
      pinPillPosition =
          MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.height * 0.07
              : MediaQuery.of(context).size.height * 0.07;
      mapController.move(new LatLng(lat, lng), 15);
    });
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    getTypeList();
    getList();
    initMarkers();
    super.initState();
    mapController = new MapController();
    sendMap();
  }

  sendMap() async {
    await _checkInternetConnection().then((value) {
      User.sendMapTestView('map');
    });
  }

  String markerByOrgType(String type) {
    if (type == "Клиники")
      return 'marker';
    else if (type == "Группа самопомощи") return 'marker1';
  }

  String asset_path = "assets/images/";

  void _showFilterDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text('organization_types'.tr()),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 1,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        selected: index == selected_index,
                        selectedTileColor: kColorBlue,
                        leading: Image.asset(
                          asset_path + 'marker' + index.toString() + '.png',
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        title: Text(
                          Prefs.getString(Prefs.LANGUAGE) == 'ky'
                              ? _orgList1[index].ky
                              : _orgList1[index].ru,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selected_index = index;
                            type_id = _orgList1[index].id;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: _orgList1.length),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('back'.tr()),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
                FlatButton(
                  child: Text('search'.tr()),
                  onPressed: () {
                    getList();
                    mapController.move(mapController.center, 10);
                    pinPillPosition = -1000;
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            );
          });
        });
  }

  mapFromOrganizationsList() {
    List<Marker> list = [];
    for (int i = 0; i < _orgList.length; i++) {
      for (var j in _orgList[i].list) {
        if (j.location.latitude != null) {
          var d = Marker(
            width: 40.0,
            height: 50.0,
            point: new LatLng(j.location.latitude, j.location.longitude),
            builder: (ctx) => new Container(
              child: InkWell(
                child: i < 7
                    ? Image.asset(
                        "assets/images/marker" + i.toString() + ".png",
                      )
                    : Image.asset(
                        "assets/images/marker6.png",
                      ),
                onTap: () => onMarkerTapped(
                    10, j.location.latitude, j.location.longitude,
                    organization: j),
              ),
            ),
          );
          list.add(d);
        }
      }
    }
    setState(() {
      _markers.clear();
      _markers.addAll(list);
    });
  }

  initMarkers() async {
    setState(() {
      _markers.addAll([
        /*Marker(
          width: 200.0,
          height: 250.0,
          point: new LatLng(42.871406, 74.619950),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(2,42.871406, 74.619950),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(42.865216, 74.597695),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(1, 42.865216, 74.597695),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(42.830901, 75.293157),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(3, 42.830901, 75.293157),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(42.479976, 78.397745),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(4, 42.479976, 78.397745),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(41.423498, 76.019460),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(5, 41.423498, 76.019460),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(40.930903920543, 73.012453429583),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(6, 40.930903920543, 73.012453429583),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(40.527083, 72.795963),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(7, 40.527083, 72.795963),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(40.077585, 70.804748),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(8, 40.077585, 70.804748),
            ),
          ),
        ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(42.531484, 72.205452),
          builder: (ctx) =>
          new Container(
            child:
            InkWell(
              child: Image.asset("assets/images/ribbon3.png",),
              onTap: () => onMarkerTapped(9, 42.531484, 72.205452),
            ),
          ),
        ),*/
      ]);
    });
  }

  getList() async {
    await Organization.get(this.type_id).then((value) {
      setState(() {
        _orgList.clear();
        _orgList.addAll(value);
      });
      mapFromOrganizationsList();
    });
  }

  getTypeList() async {
    await Organization.getTypes().then((value) {
      setState(() {
        _orgList1.addAll(value);
      });
      mapFromOrganizationsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(
              context,
              Routes.home,
            );
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 18,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text('where_can_testing'.tr()),
      ),
      body: Stack(children: [
        FlutterMap(
          mapController: mapController,
          options: new MapOptions(
              center: LatLng(41.842258, 74.451749),
              zoom: 5.8,
              onTap: (value) {
                setState(() {
                  pinPillPosition = -1000;
                });
              }),
          layers: [
            new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            new MarkerLayerOptions(
              markers: _markers,
            ),
          ],
        ),
        SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                child: FloatingActionButton(
                  backgroundColor: kColorBlue,
                  onPressed: () {
                    mapController.move(
                        mapController.center, mapController.zoom - 1);
                  },
                  child: Icon(FontAwesomeIcons.minusCircle),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                child: FloatingActionButton(
                  backgroundColor: kColorBlue,
                  onPressed: () {
                    mapController.move(
                        mapController.center, mapController.zoom + 1);
                  },
                  child: Icon(FontAwesomeIcons.plusCircle),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.1,
                child: FloatingActionButton(
                  backgroundColor: kColorBlue,
                  onPressed: () {
                    _showFilterDialog();
                  },
                  child: Icon(FontAwesomeIcons.filter),
                ),
              ),
            ],
          ),
        ),
        AnimatedPositioned(
            bottom: pinPillPosition,
            right: 0,
            left: 0,
            duration: Duration(milliseconds: 200),
            child: Container(
              margin: EdgeInsets.all(5),
              height:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.height * 0.40
                      : MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(pinName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).buttonColor, fontSize: 21)),
                  Text(pinTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).buttonColor, fontSize: 21)),
                ],
              ),
            ) // end of Align
            ),
      ]),
    );
  }
}
