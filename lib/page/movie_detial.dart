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
                height: 280,
                child: img.Image(
                  image: NetworkImage(widget.model.cover),
                  fit: BoxFit.fill,
                )),
            SingleChildScrollView(
              child: img.Container(
                color: Colors.white30,
                child: img.Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        child: img.Container(
                            //height:  MediaQuery.of(context).size.height,
                            color: Colors.black54,
                            child: img.Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: new Storyline(widget.model.content),
                                )
                                //  child: new Storyline(model.content),
                                )
                                ),
                      
               
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}