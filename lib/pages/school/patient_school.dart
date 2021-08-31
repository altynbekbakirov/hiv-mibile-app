import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/model/videoUI_provider.dart';
import 'package:HIVApp/pages/basic_information/widgets/audio_category_widget.dart';
import 'package:HIVApp/pages/basic_information/widgets/video.dart';
import 'package:HIVApp/pages/basic_information/widgets/video_category_widget.dart';
import 'package:HIVApp/pages/school/school_patient_content.dart';
import 'package:HIVApp/pages/school/video/school_video_page.dart';
import 'package:HIVApp/pages/school/youtube/youtube_video.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Страница Школы Пациентов
class PatientSchoolPage extends StatefulWidget {
  @override
  _PatientSchoolPageState createState() => _PatientSchoolPageState();
}

class _PatientSchoolPageState extends State<PatientSchoolPage> {
  int selectedIndex = 0;
  String appBarName = '';

  List<VideoCategoryModel> _list = new List<VideoCategoryModel>();

  getListOfVideos() async {
    await VideoFileModel.getList().then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
  }

  @override
  void initState() {
    appBarName = "patient_school";
    getListOfVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VideoUI>(context, listen: true);
    var isShowAppbar = provider.isShowAppbar;
    return Scaffold(
      appBar: isShowAppbar
          ? ArrowBackAppBar(
              text: appBarName.tr().toUpperCase(),
            )
          : null,
      body: Container(
        color: kLightGrayishBlue,
        child: Column(
          children: <Widget>[
            isShowAppbar
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 86,
                        color: Colors.white,
                      ),
                      Container(
                        color: kColorWhite,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: kLightGrayishBlue,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      appBarName = "patient_school";
                                      selectedIndex = 0;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 4),
                                    child: Container(
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 0
                                              ? kDesaturatedBlue
                                              : kColorWhite,
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.format_align_left,
                                              color: selectedIndex == 0
                                                  ? kColorWhite
                                                  : kDarkGrayishBlue),
                                          Text(
                                            "Текст",
                                            style: TextStyle(
                                                color: selectedIndex == 0
                                                    ? kColorWhite
                                                    : kDarkGrayishBlue),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      appBarName = "information_about_hiv";
                                      selectedIndex = 1;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4),
                                    child: Container(
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 1
                                              ? kDesaturatedBlue
                                              : kColorWhite,
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.play_circle_outline,
                                              color: selectedIndex == 1
                                                  ? kColorWhite
                                                  : kDarkGrayishBlue),
                                          Text(
                                            "Видео",
                                            style: TextStyle(
                                                color: selectedIndex == 1
                                                    ? kColorWhite
                                                    : kDarkGrayishBlue),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      appBarName = "information_about_hiv";
                                      selectedIndex = 2;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 8),
                                    child: Container(
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 2
                                              ? kDesaturatedBlue
                                              : kColorWhite,
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.headset_outlined,
                                              color: selectedIndex == 2
                                                  ? Colors.white
                                                  : kDarkGrayishBlue),
                                          Text(
                                            "Аудио",
                                            style: TextStyle(
                                                color: selectedIndex == 2
                                                    ? Colors.white
                                                    : kDarkGrayishBlue),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),

            /// Контент (Текст, Видео, Аудио)
            Expanded(
              child: selectedIndex == 0
                  ? SchoolPatientContent()
                  : selectedIndex == 1
                      ? VideoCategoryWidget()
                      : AudioCategoryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
