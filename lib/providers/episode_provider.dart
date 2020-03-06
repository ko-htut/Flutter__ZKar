import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/episode_response.dart';
import 'package:flutter_ebox/model/userresponse.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:flutter_ebox/util/share.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EpisodeProvider extends ChangeNotifier {
  String message;
  EpisodeResponse episode = EpisodeResponse();
  UserData userdatas = UserData();
  String id;
  bool loading = true;
  setepisodeid(String id) {
    this.id = id;
    gethepisode();
    gethusers();
    notifyListeners();
  }

  getepisodeid() {
    return id;
  }

  gethusers() async {
    String token = await mytoken();
    getuserdata(token).then((usern) {
      setmuser(usern);
      print(usern);
    }).catchError((e) {
      throw (e);
    });
  }

  gethepisode() async {
    setLoading(true);
    String token = await mytoken();
    getepisode(token, id).then((episoden) {
      setmepisode(episoden);
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

  void setmepisode(value) {
    episode = value;
    notifyListeners();
  }

  EpisodeResponse getmepisode() {
    return episode;
  }

  void setmuser(value) {
    userdatas = value;
    notifyListeners();
  }

  UserData getmuser() {
    return userdatas;
  }
}
