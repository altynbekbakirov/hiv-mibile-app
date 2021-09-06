import 'package:HIVApp/data/configs.dart';
import 'package:HIVApp/pages/basic_information/widgets/video.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

import 'better_player_widget.dart';

class BetterPlayerVideosWidget extends StatefulWidget {
  const BetterPlayerVideosWidget({Key key, this.list}) : super(key: key);

  final List<VideoFileModel> list;


  @override
  _BetterPlayerVideosWidgetState createState() => _BetterPlayerVideosWidgetState();
}

class _BetterPlayerVideosWidgetState extends State<BetterPlayerVideosWidget> {
  List<VideoFileModel> _list;

  @override
  void initState() {
    _list = widget.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGrayishBlue,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Container(
            child: BetterPlayerWidget(
              title: "${_list[index].title}",
              path: "${Configs.file_ip}${_list[index].name}",
            ),
          );
        },
      )
    );
  }
}
