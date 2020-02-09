import 'package:flutter/material.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/seriesresponse.dart';
import 'package:flutter_ebox/ui/details_header.dart';
import 'package:flutter_ebox/ui/ebox_details_header.dart';
import 'package:flutter_ebox/ui/story_line.dart';

class SeriesDetails extends StatelessWidget {
  final Datum model;
  SeriesDetails({Key key, @required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: img.Stack(
          children: <Widget>[
            img.Container(
                height: 280,
                child: img.Image(
                  image: NetworkImage(model.cover),
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
                        model: model,
                      ),
                      img.Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                        ),
                        child: img.Container(
                            color: Colors.black54,
                            child: img.Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: new Storyline(model.content),
                            )),
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
