import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/page/poster.dart';
import 'package:flutter_ebox/ui/ebox_logo.dart';
import 'package:flutter_ebox/ui/episode_item_data.dart';
import 'package:flutter_ebox/ui/mywidget.dart';
import 'package:marquee_widget/marquee_widget.dart';

class EboxDetailsHeader extends StatelessWidget {
  final Datum model;

  EboxDetailsHeader({Key key, @required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    bool bought = false;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 135),
      child: Container(
        child: Stack(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Card(
                elevation: 0,
                child: Container(
                  height: 165,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.vertical(
                      top: new Radius.circular(15.0),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Poster(model.poster, height: 200),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 35),
                    child: Container(
                      height: 165,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: double.infinity,
                              child: Marquee(
                                child: Text(
                                  model.title,
                                  maxLines: 1,
                                  style: textTheme.title.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: double.infinity,
                              child: Marquee(
                                child: Text(
                                  model.originalTitle,
                                  maxLines: 1,
                                  style: textTheme.subtitle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          (model.points > 0)
                              ? (model.bought != bought)
                                  ? MyEpdataBT(
                                      name: "Buy",
                                      icon: Icons.shopping_cart,
                                      background: Colors.lightBlue,
                                      datacolor: Colors.white,
                                      tap: () {},
                                    )
                                  : Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: MyEpdataBT(
                                            name: "watch",
                                            icon: Icons.play_arrow,
                                            background: Colors.lightBlue,
                                            datacolor: Colors.white,
                                            tap: () {},
                                          ),
                                        ),
                                        MyEpdataBT(
                                          name: "Dwonload",
                                          icon: Icons.cloud_download,
                                          background: Colors.lightBlue,
                                          datacolor: Colors.white,
                                          tap: () {},
                                        )
                                      ],
                                    )
                              : Expanded(
                                flex: 2,
                                                              child: Row(
                                 
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                                                          child: MyEpdataBT(
                                        name: "watch",
                                        icon: Icons.play_arrow,
                                        background: Colors.lightBlue,
                                        datacolor: Colors.white,
                                        tap: () {},
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                                                          child: MyEpdataBT(
                                        name: "Dwonload",
                                        icon: Icons.cloud_download,
                                        background: Colors.lightBlue,
                                        datacolor: Colors.white,
                                        tap: () {},
                                      ),
                                    )
                                  ],
                                ),
                              )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 14),
                child: Container(
                    width: 135,
                    child: MyCustonListTitle(
                      data: model.runtime,
                      ontap: () {},
                      icon: Icons.timeline,
                    )),
              ))
        ]),
      ),
    );
  }
}
