import 'package:HIVApp/db/db_provider.dart';
import 'package:HIVApp/pages/basic_information/widgets/audio_category_widget.dart';
import 'package:HIVApp/pages/basic_information/widgets/text.dart';
import 'package:HIVApp/pages/basic_information/widgets/video_category_widget.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class BasicInformationPage extends StatefulWidget {
  @override
  _BasicInformationPageState createState() => _BasicInformationPageState();
}

class _BasicInformationPageState extends State<BasicInformationPage> {

  int _currentWidget = 0;

  List<bool> isSelected;

  Widget getWidget(int type){
    if(type == 0)
      return TextWidget();
    else if(type == 1)
      return VideoCategoryWidget();
    else
      return AudioCategoryWidget();
  }
  @override
  void initState() {
    isSelected = [true, false, false];
    super.initState();
    getUser();
  }

  getUser() async {
    DBProvider.db.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text('information_about_hiv'.tr()),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.width * 0.02,0,MediaQuery.of(context).size.height * 0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ToggleButtons(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      onPressed: (int index) {
                        setState(() {
                          _currentWidget = index;
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        });
                      },
                      focusColor: Color(0xff293A79),
                      highlightColor: Color(0xff293A79),
                      fillColor: Color(0xff293A79),
                      isSelected: isSelected,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              'text'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(fontSize: 20,color: isSelected[0] == true ? Colors.white : kColorPrimary),
                            ),
                          ),
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width * 0.30,
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              'video'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(fontSize: 20,color: isSelected[1] == true ? Colors.white : kColorPrimary),
                            ),
                          ),
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width * 0.30,
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              'audio'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(fontSize: 20,color: isSelected[2] == true ? Colors.white : kColorPrimary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
//            SizedBox(height: MediaQuery.of(context).size.height * 0,),
            getWidget(_currentWidget),
          ],
        ),
      );
  }
}
