import 'package:hiv/data/pref_manager.dart';
import 'package:hiv/db/db_provider.dart';
import 'package:hiv/db/model/user.dart';
import 'package:hiv/model/user.dart';
import 'package:hiv/pages/diary/diary_page.dart';
import 'package:hiv/pages/home/widgets/nav_bar_item_widget.dart';
import 'package:hiv/pages/map/map_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';
import '../settings/settings_page.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  int index;

  Home({this.index});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DbUser _user;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  int _selectedIndex = 0;

  var _isDark = Prefs.getBool(Prefs.DARKTHEME, def: false);
  Color _color;
  String image_file_path = 'assets/images/';
  DateTime currentBackPressTime;
  bool logged =false;

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

  @override
  void initState() {
    if(widget.index != null){
      _selectedIndex=widget.index;
      _selectPage(widget.index);
    }
    isLoggedIn();
    super.initState();
    _color = _isDark ? Colors.indigo[100] : Colors.grey[200];
    getUser();
  }

  getUser() async {
    await DBProvider.db.getUser().then((value) {
    setState(() {
      _user = value;
    });
    });
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _selectPage(int index) {
    if(index == 0)
      return HomePage();
    else if(index == 1)
      return DiaryPage();
    else if(index == 2)
      return MapPage();
    else
      return SettingsPage();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'click_once_to_exit'.tr());
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
//        HomePage(),
        ClipRRect(
          child: Scaffold(
//              backgroundColor: _color,
            appBar: AppBar(
              elevation: 0,
//                backgroundColor: Colors.indigo[100],
              leading: BackButton(onPressed: (){
                Navigator.of(context).popAndPushNamed(Routes.home_new);
              },),
              title: Text(
                _user == null ? 'guest'.tr() : _user.username.toString(),
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    if (Prefs.USER_ID != null)
                      _checkInternetConnection().then((value) {
                        if(value) {
                          Provider.of<User>(context, listen: false).logout();
                          Navigator.of(context)
                              .popAndPushNamed(Routes.login);
                        }
                        else
                          {
                          _showErrorDialog('connect_to_internet_to_logout'.tr());
                        }
                      });
                  },
                  child: FaIcon(FontAwesomeIcons.signOutAlt, color: Theme.of(context).focusColor,),
                ),
              ],
            ),
            body: WillPopScope(
              child: Container(
                child: _selectPage(_selectedIndex),
              ),
              onWillPop: onWillPop,
            ),
            floatingActionButton: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x202e83f8),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    if(logged){
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.of(context).pushNamed(Routes.add);
                    }
                    else{
                      _showErrorDialog('login_or_sign_up_to_add'.tr());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).buttonColor,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: ClipRect(
              child: BottomAppBar(
                color: Theme.of(context).bottomAppBarColor,
                elevation: 0,
                shape: CircularNotchedRectangle(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: NavBarItemWidget(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        iconData: Icons.home,
                        text: 'home'.tr(),
                        color: _selectedIndex == 0 ? kColorLightBlue : Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: NavBarItemWidget(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        iconData: Icons.account_box,
                        text: 'diary'.tr(),
                        color: _selectedIndex == 1 ? kColorLightBlue : Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 1,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: NavBarItemWidget(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        iconData: Icons.location_on,
                        text: 'map'.tr(),
                        color: _selectedIndex == 2 ? kColorLightBlue : Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: NavBarItemWidget(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                        },
                        iconData: Icons.more_horiz,
                        text: 'more'.tr(),
                        color: _selectedIndex == 3 ? kColorLightBlue : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
