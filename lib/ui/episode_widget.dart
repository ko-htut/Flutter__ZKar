import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/episode_response.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:flutter_ebox/ui/dialog_list.dart';
import 'package:flutter_ebox/ui/episode_item_data.dart';
import 'package:flutter_ebox/util/share.dart';
import 'package:marquee_widget/marquee_widget.dart';

class EpisodeItem extends StatefulWidget {
  Datum episodemodel;
  final onplaytap;
  final ondownloadtap;
  final reporttap;
  EpisodeItem({Key key, @required this.episodemodel,@required this.onplaytap,@required this.ondownloadtap,@required this.reporttap}) : super(key: key);
  @override
  _EpisodeItemState createState() => _EpisodeItemState();
}

class _EpisodeItemState extends State<EpisodeItem> {
  bool episodebuy = true;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${widget.episodemodel.name}",
                    style: textTheme.title.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: (widget.episodemodel.points > 0)
                        ? (widget.episodemodel.bought == episodebuy)
                            ? Row(
                                children: <Widget>[
                                  MyEpdataBT(
                                    name: "Dwonload",
                                    icon: Icons.cloud_download,
                                    background: Colors.green[50],
                                    datacolor: Colors.green,
                                    tap: widget.ondownloadtap,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: MyEpdataBT(
                                        name: "Play",
                                        icon: Icons.play_arrow,
                                        background: Colors.green[50],
                                        datacolor: Colors.green,
                                        tap:widget.onplaytap,
                                      ))
                                ],
                              )
                            : MyEpdataBT(
                                name: "Buy",
                                icon: Icons.shopping_cart,
                                background: Colors.green[50],
                                datacolor: Colors.green,
                                tap: () {
                                  print(widget.episodemodel.id);
                                  logi(widget.episodemodel.id.toString());
                                },
                              )
                        : Row(
                            children: <Widget>[
                              MyEpdataBT(
                                name: "Dwonload",
                                icon: Icons.cloud_download,
                                background: Colors.green[50],
                                datacolor: Colors.green,
                                tap: widget.ondownloadtap,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: MyEpdataBT(
                                    name: "Play",
                                    icon: Icons.play_arrow,
                                    background: Colors.green[50],
                                    datacolor: Colors.green,
                                    tap: widget.onplaytap,
                                  ))
                            ],
                          ),
                  )
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: <Widget>[
            Container(
                child: (widget.episodemodel.points > 0)
                    ? (widget.episodemodel.bought == true)
                        ? Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Image(
                                        image:
                                            AssetImage('images/ic_point.png'),
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Marquee(
                                        child: Text(
                                          widget.episodemodel.points.toString(),
                                          style: textTheme.subtitle.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[50],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(" PURCHASE ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Image(
                                        image:
                                            AssetImage('images/ic_point.png'),
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Marquee(
                                        child: Text(
                                          widget.episodemodel.points.toString(),
                                          style: textTheme.subtitle.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red[50],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(" Buy ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            " Free ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ))
          ]),
        ),
        Divider(
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Download - ${widget.episodemodel.downloadCount.toString()}",
                    style: textTheme.subtitle.copyWith(color: Colors.redAccent),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "View - ${widget.episodemodel.viewCount.toString()}",
                      style: textTheme.subtitle.copyWith(color: Colors.red),
                    ),
                  )
                ],
              ),
              MyEpdataBT(
                name: "Report",
                icon: Icons.report,
                background: Colors.red[50],
                datacolor: Colors.red,
                tap: widget.reporttap,
              )
            ],
          ),
        ),
      ],
    ));
  }

  logi(String id) async {
    String token = await mytoken();
    print(id);
    final ressponse = await getepbuy(token, id);
    if (ressponse.status == true) {
      print("buy success");
      setState(() {
        episodebuy = false;
      });
    } else {
      print("buy error");
    }
  }
}
