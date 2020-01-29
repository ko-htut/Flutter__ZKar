import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ebox/model/songresponse.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class PostDetial extends StatefulWidget {
  final Datum model;
  
  PostDetial({
    Key key,
    @required this.model,
  });
  @override
  _PostDetialPageState createState() => _PostDetialPageState();
}

class _PostDetialPageState extends State<PostDetial> {
  IjkMediaController controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
    
    initIjkController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 230,
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: <Widget>[
              Container(
                color: Colors.black,
                child: AspectRatio(
                  aspectRatio: 1280 / 720,
                  child: IjkPlayer(
                    mediaController: controller,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  icon: Icon(
                    Icons.panorama_fish_eye,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    print(MediaQuery.of(context).size.height);
                  },
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: ListView(
                children: <Widget>[
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

  void initIjkController() async {
    print(widget.model.video);
    var option1 = IjkOption(IjkOptionCategory.format, "fflags", "fastseek");

    controller.setIjkPlayerOptions(
      [TargetPlatform.iOS, TargetPlatform.android],
      [option1].toSet(),
    );

    await controller.setDataSource(
      DataSource.network(widget.model.video),
      autoPlay: true,
    );
  }
}
