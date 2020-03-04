import 'package:flutter/material.dart';

class MyEpdataBT extends StatefulWidget {
  String name;
  IconData icon;
  Color background;
  Color datacolor;
  final tap;
  MyEpdataBT(
      {Key key, @required this.name, @required this.icon,@required this.background,@required this.datacolor, @required this.tap})
      : super(key: key);

  @override
  _MyEpdataBTState createState() => _MyEpdataBTState();
}

class _MyEpdataBTState extends State<MyEpdataBT> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return InkWell(
      onTap: widget.tap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: widget.background),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Icon(widget.icon, color: widget.datacolor),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    widget.name,
                    style: textTheme.subtitle.copyWith(color: widget.datacolor),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
