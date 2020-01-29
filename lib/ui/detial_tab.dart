import 'package:flutter/material.dart';

class EBox extends StatelessWidget {
  const EBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: <Widget>[
          Icon(Icons.ac_unit),
          Text("data"),
          Container(
            
          )
        ],
      ),
    );
  }
}