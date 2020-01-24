import 'package:flutter/material.dart';
import 'package:flutter_ebox/model/genreresponse.dart';
import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieProvider extends ChangeNotifier {
  String message;
  Movie movie = Movie();
  Genres genres = Genres();
  bool loading = true;

  gethmovie() async {
    setLoading(true);
    getmovie().then((movien) {
      setmmovie(movien);
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

  void setmmovie(value) {
    movie = value;
    notifyListeners();
  }

  Movie getmmovie() {
    return movie;
  }
  void setmgenries(value) {
    genres = value;
    notifyListeners();
  }

  Genres getmgenries() {
    return genres;
  }
}

  