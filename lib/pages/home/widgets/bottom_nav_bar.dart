import 'package:hiv/routes/routes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  int selectedIndex;

  Function(int) callback;

  BottomNavBar({this.selectedIndex, this.callback});

  String mainActive = "assets/images/icons/Main/Active.png";
  String schoolActive = "assets/images/icons/School/Active.png";
  String addActive = "assets/images/icons/Add/Active.png";
  String diaryActive = "assets/images/icons/Diary/Active.png";
  String notificationActive = "assets/images/icons/Notification/Active/No.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 44,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Image.asset(
              selectedIndex == 0
                  ? mainActive
                  : 'assets/images/icons/Main/Regular.png',
              height: 32,
              width: 32,
            ),
            onTap: () {
                selectedIndex = 0;
                callback(0);
            },
          ),
          InkWell(
            child: Image.asset(
              selectedIndex == 1
                  ? schoolActive
                  : 'assets/images/icons/School/Regular.png',
              height: 32,
              width: 32,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.patientSchool);
            },
          ),
          InkWell(
            child: Image.asset(
              selectedIndex == 2
                  ? addActive
                  : 'assets/images/icons/Add/Regular.png',
              height: 32,
              width: 32,
            ),
            onTap: () {
                selectedIndex = 2;
                callback(2);
            },
          ),
          InkWell(
            child: Image.asset(
              selectedIndex == 5
                  ? diaryActive
                  : 'assets/images/icons/Diary/Regular.png',
              height: 32,
              width: 32,
            ),
            onTap: () {
                selectedIndex = 5;
                callback(5);
            },
          ),
          InkWell(
            child: Image.asset(
              selectedIndex == 4
                  ? notificationActive
                  : 'assets/images/icons/Notification/Regular/No.png',
              height: 32,
              width: 32,
            ),
            onTap: () {
                selectedIndex = 4;
                callback(4);
            },
          ),
        ],
      ),
    );
  }
}
