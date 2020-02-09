import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/season_response.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:flutter_ebox/util/share.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SeasonProvider extends ChangeNotifier {
  String message;
  Season season = Season();
  bool loading = true;


  gethseason(String id) async {
    setLoading(true);
    String token = await mytoken();
    getseason(token,id).then((season) {
      setmseason(season);
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

  void setmseason(value) {
    season = value;
    notifyListeners();
  }

  Season getmseason() {
    return season;
  }

}
