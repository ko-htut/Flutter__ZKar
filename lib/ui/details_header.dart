import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/page/poster.dart';
import 'package:flutter_ebox/ui/arc_banner_image.dart';
import 'package:flutter_ebox/ui/rating_information.dart';
import 'package:marquee_widget/marquee_widget.dart';

class MovieDetailsHeader extends StatelessWidget {
  final title;
  final category;
  final contentrating;
  final imdbrating;
  final List<Genre> genre;
  final poster;
  final cover;

  MovieDetailsHeader({
    Key key,
    @required this.category,
    @required this.title,
    @required this.contentrating,
    @required this.imdbrating,
    @required this.genre,
    @required this.poster,
    @required this.cover,
  });
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Marquee(
          child: new Text(
            title,
            style: textTheme.title,
            maxLines: 1,
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: new RatingInformation(
            rating: imdbrating,
            age: contentrating,
          ),
        ),
        Container(
          height: 40,
            child: ListView.builder(
              itemCount: genre.length,
               scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Chip(
                  
                  label: Text(genre[index].name),
                  backgroundColor: Colors.greenAccent,
                ),
              );
             },
            ),
          ),
        
      ],
    );

    return new Stack(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: new ArcBannerImage(cover),
        ),
        new Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Poster(
                poster,
                height: 180.0,
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: movieInformation,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
