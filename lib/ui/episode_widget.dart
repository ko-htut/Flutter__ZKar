import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/episode_response.dart';

class EpisodeItem extends StatelessWidget {
  Datum episodemodel;
  EpisodeItem({Key key, @required this.episodemodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(episodemodel.name),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Container(
                child: (episodemodel.points > 0)
                    ? (episodemodel.bought == true)
                        ? Row(
                            children: <Widget>[
                              Text("ponit ${episodemodel.points}"),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(" PURCHASE "),
                              )
                            ],
                          )
                        : Row(
                            children: <Widget>[
                              Text("ponit ${episodemodel.points}"),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(" Buy "),
                              )
                            ],
                          )
                    : Text("Free"))
          ]),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text("Download - ${episodemodel.downloadCount.toString()}"),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("View - ${episodemodel.viewCount.toString()}"),
              )
            ],
          ),
        )
      ],
    ));
  }
}
