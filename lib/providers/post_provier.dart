import 'package:flutter/material.dart';

import 'package:flutter_ebox/model/songresponse.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:flutter_ebox/util/share.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SongProvider extends ChangeNotifier {
  String message;
  Song songs = Song();
  bool loading = true;
  String key;
  gethsong() async {
    setLoading(true);
     String token = await mytoken();
    getsong(token).then((songn) {
      setmsong(songn);
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

  void setmsong(value) {
    songs = value;
    notifyListeners();
  }

  Song getmsong() {
    return songs;
  }
  
}

  