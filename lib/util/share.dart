import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ShareData(
    {@required String name,
    @required String email,
    @required String profile,
    @required int point,
    @required String token}) async {
  SharedPreferences share = await SharedPreferences.getInstance();
  await share.setString('name', name);
  await share.setString('email', email);
  await share.setString('profile', profile);
  await share.setInt('point', point);
  await share.setString('token', token);
}

 Future<int> mypoint() async {
  SharedPreferences share = await SharedPreferences.getInstance();
  int po = share.getInt('point');
  print(po);
  return po;
}

Future<String> mytoken() async {
  SharedPreferences share = await SharedPreferences.getInstance();
  String token = share.getString('token');
  print(token);
  return token;
}
