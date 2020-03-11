import 'dart:ui';

import 'package:flutter/material.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/ui/about_text_widget.dart';
import 'package:flutter_ebox/ui/movie_detail_healder.dart';
import 'package:flutter_ebox/ui/story_line.dart';

class MovieDetails extends StatefulWidget {
  final Datum model;
  MovieDetails({Key key, @required this.model});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final colorlist = [
      Colors.amber,
      Colors.black,
      Colors.blue,
      Colors.brown,
      Colors.blueGrey,
      Colors.lightBlue,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.lightGreen,
      Colors.indigo,
      Colors.lime,
      Colors.orange,
      Colors.pink,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.white,
      Colors.yellow,
    ];
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: img.Stack(
          children: <Widget>[
            img.Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Color.fromARGB(40, 43, 35, 43),
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
                color: Color.fromARGB(41, 41, 41, 41),
                child: img.Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: img.Column(
                    children: <Widget>[
                      EboxDetailsHeader(
                        model: widget.model,
                      ),
                      img.Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8,
                          ),
                          child: img.Card(
                              elevation: 0,
                              child: img.Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: img.Column(
                                  children: <img.Widget>[
                                    img.Container(
                                        width: double.infinity,
                                        child: img.Text(
                                          "Genres",
                                          style: textTheme.subtitle.copyWith(),
                                        )),
                                    Container(
                                      height: 40,
                                      child: Center(
                                        child: ListView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: widget.model.genre.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            colorlist.shuffle();
                                            Color getcc = colorlist.first;
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: getcc.withAlpha(50),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    widget.model.genre[index]
                                                        .name,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: getcc,
                                                    ),
                                                  ),
                                                )),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    img.Divider(),
                                    ADwidget(
                                      txt: "Credit",
                                      datatxt: widget.model.credit.name,
                                    ),
                                    ADwidget(
                                      txt: "Download Count",
                                      datatxt:
                                          widget.model.downloadCount.toString(),
                                    ),
                                    ADwidget(
                                      txt: "View Count",
                                      datatxt:
                                          widget.model.viewCount.toString(),
                                    ),
                                    ADwidget(
                                      txt: "Language",
                                      datatxt: widget.model.language.title,
                                    ),
                                    img.Divider(),
                                    new Storyline(widget.model.content),
                                  ],
                                ),
                              ))),
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
