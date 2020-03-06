import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Storyline extends StatelessWidget {
  final String storyline;

  Storyline(this.storyline);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Story line',
          style: textTheme.title.copyWith(fontSize: 18.0),
        ),
        Wrap(
          children: <Widget>[
            Text(
              storyline,
              style: textTheme.subtitle.copyWith(),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[],
        ),
      ],
    );
  }
}
