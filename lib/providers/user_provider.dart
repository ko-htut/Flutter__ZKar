import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/userresponse.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProvider extends ChangeNotifier {
  String message;
  UserData userdatas = UserData();
  bool loading = true;

  gethusers() async {
    setLoading(true);
    getuserdata().then((usern) {
      setmuser(usern);
      print(usern);
      setLoading(false);
    }).catchError((e) {
      throw (e);
    });
  }

  void setMessage(value) {
    message = value;
    Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
    notifyListeners();
  }

  String getMessage() {
    return message;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setmuser(value) {
    userdatas = value;
    notifyListeners();
  }

  UserData getmuser() {
    return userdatas;
  }
}
