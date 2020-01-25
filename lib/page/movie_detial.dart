import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/ui/decription_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MovieDetial extends StatelessWidget {
  final Datum model;

  MovieDetial({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: model.poster,
                  placeholder: (context, url) => Container(
                    height: 200,
                    width: 130,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 130,
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: Text(
                          model.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: Text(
                          model.originalTitle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Movie Description",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Theme.of(context).textTheme.caption.color,
          ),
          SizedBox(
            height: 10,
          ),
          DescriptionTextWidget(
            text: model.content,
          ),
          SizedBox(
            height: 30,
          ),
          // Text(
          //   "More from Author",
          //   style: TextStyle(
          //     color: Theme.of(context).accentColor,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Divider(
            color: Theme.of(context).textTheme.caption.color,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
