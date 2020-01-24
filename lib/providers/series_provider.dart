import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/genreresponse.dart';
import 'package:flutter_ebox/model/seriesresponse.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SeriesProvider extends ChangeNotifier {
  String message;
  Series series = Series();
  Genres genres = Genres();
  bool loading = true;

  gethseries() async {
    setLoading(true);
    getseries().then((seriesn) {
      setmseries(seriesn);
      getgenre().then((genresn) {
        setmgenries(genresn);
        setLoading(false);
      }).catchError((e) {});
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

  void setmseries(value) {
    series = value;
    notifyListeners();
  }

  Series getmseries() {
    return series;
  }

  void setmgenries(value) {
    genres = value;
    notifyListeners();
  }

  Genres getmgenries() {
    return genres;
  }
}
