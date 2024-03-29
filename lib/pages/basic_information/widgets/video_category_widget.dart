import 'package:hiv/pages/basic_information/widgets/ex_audio.dart';
import 'package:hiv/pages/school/better_player/better_player_list.dart';
import 'package:hiv/pages/school/new_video_player/portrait_landscape_player_page.dart';
import 'package:hiv/pages/school/video/hiv_channel_model.dart';
import 'package:hiv/pages/school/video/video_api_service.dart';
import 'package:hiv/pages/school/youtube/video_player.dart';
import 'package:hiv/utils/constants.dart';
import 'package:hiv/utils/keys.dart';
import 'package:flutter/material.dart';

import 'video.dart';

class VideoCategoryWidget extends StatefulWidget {
  @override
  _VideoCategoryWidgetState createState() => _VideoCategoryWidgetState();
}

class _VideoCategoryWidgetState extends State<VideoCategoryWidget> {
  List<VideoCategoryModel> _list = new List<VideoCategoryModel>();
  List<VideoFileModel> _videos = List<VideoFileModel>();
  bool showVideos = false;
  int index;
  List<YoutubeVideoModel> videos = List<YoutubeVideoModel>();

  getListOfVideos() async {
    await VideoFileModel.getList().then((value) {
      setState(() {
        _list.addAll(value);
        for(var i in value){
          for(var k in i.videos) {
              _videos.add(k);
          }
        }
      });
    });
  }

  @override
  void initState() {
    getListOfVideos();
    // _initChannel();
    super.initState();
  }

  // _initChannel() async {
  //   Channel channel = await APIService.instance
  //       .fetchChannel(channelId: REPUBLICAN_AIDS_CENTER_ID);
  //   for (var i in channel.videos) {
  //     videos.add(YoutubeVideoModel(id: i.id, title: i.title));
  //   }
  //   setState(() {
  //     _channel = channel;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _list != null
          ? BetterPlayerVideosWidget(list: _videos)
      // PortraitLandscapePlayerPage(videos: videos)
      // VideoPlayerWidget(videos: videos)
          : Center(
            child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kModerateBlue),
      ),
          ),
    //   showVideos
    //       ? Column(
    //           children: [
    //             Container(
    //               padding: EdgeInsets.fromLTRB(
    //                   MediaQuery.of(context).size.width * 0.04,
    //                   MediaQuery.of(context).size.width * 0.04,
    //                   0,
    //                   0),
    //               alignment: Alignment.topLeft,
    //               child: InkWell(
    //                 child: Text(
    //                   'back'.tr(),
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 onTap: () {
    //                   setState(() {
    //                     showVideos = false;
    //                   });
    //                 },
    //               ),
    //             ),
    //
    //             // VideoWidget(list: _list[index].videos),
    //           ],
    //         )
    //       : Container(
    //           padding: EdgeInsets.fromLTRB(
    //               0, MediaQuery.of(context).size.width * 0.04, 0, 0),
    //           child: ListView.separated(
    //               shrinkWrap: true,
    //               itemBuilder: (context, index) {
    //                 return ListTile(
    //                     title: Text(
    //                       _list[index].category_name,
    //                       style: TextStyle(
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     trailing: Icon(
    //                       Icons.chevron_right,
    //                       color: Colors.grey,
    //                     ),
    //                     onTap: () {
    //                       setState(() {
    //                         showVideos = true;
    //                         this.index = index;
    //                       });
    //                     });
    //               },
    //               separatorBuilder: (context, index) {
    //                 return Divider();
    //               },
    //               itemCount: _list.length),
    //         ),
    );
  }
}
