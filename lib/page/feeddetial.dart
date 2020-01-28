import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/songresponse.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class PostDetials extends StatefulWidget {
  final Datum model;

  PostDetials({
    Key key,
    @required this.model,
  }) ;
  @override
  _PostDetialsPageState createState() => _PostDetialsPageState();
}

class _PostDetialsPageState extends State<PostDetials> {
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
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.transparent,
        title: Text(widget.model.title),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1280 / 720,
            child: IjkPlayer(
              mediaController: controller,
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