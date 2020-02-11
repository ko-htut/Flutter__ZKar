//import 'dart:html';

import 'dart:ui';

import 'package:flutter/material.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ebox/model/seriesresponse.dart';
import 'package:flutter_ebox/page/season_ui.dart';
import 'package:flutter_ebox/ui/decription_widget.dart';
import 'package:flutter_ebox/ui/ebox_details_header.dart';
import 'package:flutter_ebox/ui/story_line.dart';

class SeriesDetails extends StatefulWidget {
  final Datum model;
  SeriesDetails({Key key, @required this.model});

  @override
  _SeriesDetailsState createState() => _SeriesDetailsState();
}

class _SeriesDetailsState extends State<SeriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: img.Stack(
          children: <Widget>[
            img.Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Color.fromARGB(41, 41, 41, 41),
                  ),
                ),
                height: 260,
                decoration: img.BoxDecoration(
                    image: DecorationImage(
                  fit: img.BoxFit.fill,
                  image: NetworkImage(widget.model.cover),
                ))),
            SingleChildScrollView(
              child: img.Container(
             //   color: Color.fromARGB(150, 41, 41, 41),
                child: img.Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: img.Column(
                    children: <Widget>[
                      EboxDetailsHeader(
                        model: widget.model,
                      ),
                      img.Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: img.Container(
                          color: Color.fromARGB(150, 41, 41, 41),
                          child: img.TabBar(
                            tabs: [
                              Tab(
                                text: "About",
                              ),
                              Tab(
                                text: "Series",
                              ),
                            ],
                          ),
                        ),
                      ),
                      img.Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                        ),
                        child: img.Container(
                            height: MediaQuery.of(context).size.height - 75,
                            color: Color.fromARGB(150, 41, 41, 41),
                            child: Card(
                              child: img.Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: img.TabBarView(
                                    children: [
                                      ListView(
                                          physics: img
                                              .NeverScrollableScrollPhysics(),
                                          children: <Widget>[
                                            img.Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10,
                                                  bottom: 10),
                                              child: img.Text(
                                                widget.model.content,
                                                style: img.TextStyle(),
                                              ),
                                            )
                                          ]),
                                      //   DescriptionTextWidget(text:widget.model.content),
                                      SeasonUi(id: widget.model.id),
                                    ],
                                  )),
                            )),
                      ),
                    ],
                  ),
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
          ],
        ),
      ),
    );
  }
}
