import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class RatingInformation extends StatelessWidget {
  final rating;
  final age;

  RatingInformation({
    Key key,
    @required this.rating,
    @required this.age,
  });

  _buildRatingBar(ThemeData themeData) {
    var a=num.parse("$rating");

    var stars = <Widget>[];
    for (var i = 1; i <= 5; i++) {

      var color = i <= a~/2 ? themeData.accentColor : Colors.black12;
      var star = new Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return new Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    var numericRating = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(
          age,
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w300,
            color: theme.accentColor,
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: new Text(
            'Age',
            style: textTheme.title.copyWith(
              fontWeight: FontWeight.w300,
              color: theme.accentColor,
            ),
          ),
        ),
      ],
    );

    var starRating = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRatingBar(theme),
        new Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            left: 4.0,
          ),
          child: Marquee(
            direction: Axis.horizontal,
            child: Text(
              
              "Ratings",
              style: textTheme.title.copyWith(
                fontWeight: FontWeight.w400,
                color: theme.accentColor,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );

    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        numericRating,
        new Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: starRating,
        ),
      ],
    );
  }
}
