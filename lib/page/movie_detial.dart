import 'dart:ui';

import 'package:flutter/material.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/movierespnse.dart';
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
                color: Colors.white30,
                child: img.Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: img.Column(
                    children: <Widget>[
                      EboxDetailsHeader(
                        model: widget.model,
                      ),
                      img.Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10,
                          ),
                          child: img.Card(
                           // color: Colors.brown[300],
                              child: img.Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Storyline(widget.model.content),
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
