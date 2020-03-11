import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/songresponse.dart';
import 'package:flutter_ebox/ui/ebox_logo.dart';

class PostDetial extends StatefulWidget {
  final Datum model;
  final trans;

  PostDetial({
    Key key,
    @required this.model,
    @required this.trans,
  });
  @override
  _PostDetialPageState createState() => _PostDetialPageState();
}

class _PostDetialPageState extends State<PostDetial> {
  String mainSubtitles = "主字幕";
  String subSubtitles = "辅字幕";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: 1280 / 720,
                child: AwsomeVideoPlayer(
                  widget.model.video,

                  playOptions: VideoPlayOptions(
                      seekSeconds: 30,
                      aspectRatio: 16 / 9,
                      loop: true,
                      autoplay: true,
                      allowScrubbing: true,
                      startPosition: Duration(seconds: 0)),
                  videoStyle: VideoStyle(
                    playIcon: Icon(
                      Icons.play_circle_outline,
                      size: 100,
                      color: Colors.white,
                    ),
                    showPlayIcon: true,
                    videoControlBarStyle: VideoControlBarStyle(
                      //barBackgroundColor: Colors.blue,

                      progressStyle: VideoProgressStyle(
                          playedColor: Colors.red,
                          bufferedColor: Colors.yellow,
                          backgroundColor: Colors.green,
                          dragBarColor: Colors.white,
                          progressRadius: 2,
                          dragHeight: 5),

                      playIcon:
                          Icon(Icons.play_arrow, color: Colors.white, size: 16),

                      pauseIcon: Icon(
                        Icons.pause,
                        color: Colors.red,
                        size: 16,
                      ),

                      rewindIcon: Icon(
                        Icons.replay_30,
                        size: 16,
                        color: Colors.white,
                      ),

                      forwardIcon: Icon(
                        Icons.forward_30,
                        size: 16,
                        color: Colors.white,
                      ),

                      fullscreenIcon: Icon(
                        Icons.fullscreen,
                        size: 16,
                        color: Colors.white,
                      ),

                      fullscreenExitIcon: Icon(
                        Icons.fullscreen_exit,
                        size: 16,
                        color: Colors.red,
                      ),

                      itemList: [
                        "rewind",
                        "play",
                        "forward",
                        "position-time", //当前播放时间
                        "progress", //线形进度条
                        //"basic-progress",//矩形进度条
                        "duration-time", //视频总时长
                        // "time", //格式：当前时间/视频总时长
                        "fullscreen"
                      ],
                    ),
                    // videoSubtitlesStyle: VideoSubtitles(
                    //   mianTitle: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: Container(
                    //       padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                    //       child: Text(mainSubtitles,
                    //           maxLines: 2,
                    //           textAlign: TextAlign.center,
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 14)),
                    //     ),
                    //   ),
                    //   subTitle: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: Container(
                    //       padding: EdgeInsets.all(10),
                    //       child: Text(subSubtitles,
                    //           maxLines: 2,
                    //           textAlign: TextAlign.center,
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 14)),
                    //     ),
                    //   ),
                    // ),
                  ),

                  children: [
                    /// 这个将会覆盖的视频内容，因为这个层级是最高级，因此手势会失效(慎用)
                    /// 这个可以用来做视频广告
                    // Positioned(
                    //   top: 0,
                    //   left: 0,
                    //   bottom: 0,
                    //   right: 0,
                    //   child: Text("data", style: TextStyle(color: Colors.white),),
                    // ),
                  ],

                  oninit: (val) {
                    print("video oninit");
                  },

                  onplay: (value) {
                    print("video played");
                  },

                  onpause: (value) {
                    print("video paused");
                  },

                  onended: (value) {
                    print("video ended");
                  },

                  ontimeupdate: (value) {
                    print("timeupdate $value");
                    var position = value.position.inMilliseconds / 1000;
                
                  },

                  /// 声音变化回调
                  onvolume: (value) {
                    print("onvolume $value");
                  },

                  /// 亮度变化回调
                  onbrightness: (value) {
                    print("onbrightness $value");
                  },

                  /// 网络变化回调
                  onnetwork: (value) {
                    print("onbrightness $value");
                  },

                  onpop: (value) {
                    print("返回上一页");
                  },
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: IconButton(
            //     padding:
            //         EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            //     icon: Icon(
            //       Icons.keyboard_arrow_left,
            //       color: Colors.white,
            //       size: 32,
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 20),
                  child: EBoxLogo(
                    size: 20,
                  ),
                )),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: ListView(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    title: Text(
                      widget.model.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      widget.model.type,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.cloud_download,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.model.content),
                  ),
                  Divider(),
                  Image(
                    image: NetworkImage(widget.model.image),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
