import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

var radioItems = [
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "None",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "Callisto",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "Ganymede",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "Luna",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "Oberon",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "Phobos",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "Dione",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "James",
    color: Colors.black,
    fontSize: 16.0,
  ),
  RadioItem(
    padding: EdgeInsets.only(left: 6.0),
    text: "Lina",
    color: Colors.black,
    fontSize: 16.0,
  ),
];

YYDialog yyListViewDialogListRadio() {
  return YYDialog().build()
    ..width = 280
    ..borderRadius = 4.0
    ..text(
      padding: EdgeInsets.fromLTRB(18.0, 22.0, 18.0, 18.0),
      text: "Phone ringtone",
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    )
    ..divider()
    ..listViewOfRadioButton(
        items: radioItems,
        height: 370,
        activeColor: Colors.deepPurpleAccent,
        onClickItemListener: (index) {
          var radioItem = radioItems[index];
          print(radioItem.text + " is on click");
        })
    ..divider()
    ..doubleButton(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      gravity: Gravity.right,
      text1: "CANCEL",
      color1: Colors.deepPurpleAccent,
      fontSize1: 14.0,
      fontWeight1: FontWeight.bold,
      text2: "OK",
      color2: Colors.deepPurpleAccent,
      fontSize2: 14.0,
      fontWeight2: FontWeight.bold,
    )
    ..show();
}