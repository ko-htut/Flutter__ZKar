import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/ui/details_header.dart';
import 'package:flutter_ebox/ui/story_line.dart';

class MovieDetails extends StatelessWidget {
  final Datum movie;

  MovieDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new MovieDetailsHeader(
              genre: movie.genre,
              contentrating: movie.contentRating,
              cover: movie.poster,
              poster: movie.poster,
              imdbrating: movie.imdbRating,
              category: movie.genre,
              title: movie.title,
            ),
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Storyline(movie.content),
            ),
          ],
        ),
      ),
    );
  }
}
