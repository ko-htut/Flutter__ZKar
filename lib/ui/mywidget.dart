import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class MyCustonListTitle extends StatelessWidget {
  final data;
  final icon;
  final ontap;
  MyCustonListTitle(
      {Key key, @required this.icon, @required this.data, @required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: InkWell(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Marquee(
                      child: Text(
                    "$data",
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
          ),
        ),
        onTap: ontap,
      ),
    );
  }
}
