import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  final String posterUrl;
  final double height;

  Poster(
    this.posterUrl, {
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return new Material(
      borderRadius: new BorderRadius.circular(4.0),
      elevation: 0.0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(posterUrl))),
        
      ),
    );
  }
}
