import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:flutter_ebox/model/seriesresponse.dart';
import 'package:flutter_ebox/page/poster.dart';
import 'package:flutter_ebox/ui/ebox_logo.dart';

class EboxDetailsHeader extends StatelessWidget {
  final Datum model;
  EboxDetailsHeader({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 120),
      child: Container(
        
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Card(
              child: Container(
                height: 165,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.vertical(
                  top: new Radius.circular(15.0),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Poster(model.poster, height: 200),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            model.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            model.originalTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 13.5, top: 14),
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      margin: EdgeInsets.all(0),
                  elevation: 0,
                        child: Center(
                            child: Text(
                      model.credit.id.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))),
                  ))),
        ]),
      ),
    );
  }
}
