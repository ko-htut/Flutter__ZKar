import 'package:flutter/material.dart';

class ADwidget extends StatelessWidget {
  String txt;
  String datatxt;
  ADwidget({Key key, @required this.txt, @required this.datatxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              txt,
              style: textTheme.subtitle.copyWith(),
            ),
            Text(
              "${datatxt}",
              style: textTheme.subtitle.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
