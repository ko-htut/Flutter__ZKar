import 'dart:io';

import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/model/resigerresponse.dart';
import 'package:flutter_ebox/model/seriesresponse.dart';
import 'package:flutter_ebox/model/songresponse.dart';
import 'package:flutter_ebox/model/genreresponse.dart';
import 'package:flutter_ebox/model/userresponse.dart';
import 'package:http/http.dart' as http;

final link = "https://eboxmm.com/api/v3/";
final reg = "register";
final log = "login";
final movi = "movie";
final movidlink = "movie_directlink";
final movidl = "movie_download";
final moviser = "movie/search";
final movirep = "movie/report";
final movicunt = "movie_directlink/count";
final moviby = "buy/movie";
final seri = "series";
final token =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjRkOTgxNjExZjRhMWUxNTM4Yzk2NTI4ZDY5YzljZjE2ZGQ5NDhhODFmMGY2NjdiNDdlYTg3Y2VmOTY1MGQ0NTg0YzQzZWJmMTE1ZGUwNzY2In0.eyJhdWQiOiIxIiwianRpIjoiNGQ5ODE2MTFmNGExZTE1MzhjOTY1MjhkNjljOWNmMTZkZDk0OGE4MWYwZjY2N2I0N2VhODdjZWY5NjUwZDQ1ODRjNDNlYmYxMTVkZTA3NjYiLCJpYXQiOjE1Nzk2ODY4MjksIm5iZiI6MTU3OTY4NjgyOSwiZXhwIjoxNjExMzA5MjI5LCJzdWIiOiI4MzA0Iiwic2NvcGVzIjpbXX0.ne54lgLKzpIFSJh2dBQjkcsk9Okq4Vjfo-S_jADJlD1-ftDdNCfk3H0Eo2hNarjFLSMvpgnhAul_iZTgsAlnbO-zNU1mzmBoicUbOuJevN312zSpPQLnGGIegIBPf6oKqkj81wQ-V3EcvmiHYY8bAs3fOz__YDGONakketHGl-m76zEAB_cmS8edbm6A1cMm1YJnvT_Rxq-9fDws0Ekqi5m5I_5IoWYFh5_J3xJaZTxc1FgDCnYgNjAwEbrpZOxKfDK9sVhZvT2XdmktgQADkdPf8vQ3e7hTxRVVi8tMwA2RK2ln_VslX6qP9l2pjN-tZsIu96brx1pEZPRkOOml2Ji0VWv2D4TUnHqdB92WKDUyvFpPWK5otDc_6dSY5ttxLEP0EMZlTD4H-bBoAvtLS5GHThp3O_30akSz3BWEz_xEwFt0GuBPOBLFtH_47_vqcQSPnmReCOroYibPx4NqVOdxQ5_tEvzLsQdxiN72bZMM0XkHOo7S_cDrk3dNOs2TWIP9wtjbvFxY8EYwkcPb-6YA-OnsCYUxxM67uITn_gIeuzdT-mgvmoZmGFsaSwM3smUi10FXox3MQ-PMV7yAJZsKTm_p5qoyLguydwtUK_8LpZQDYYp0IbtOQ0wC_ItXFuZB5k8zi_NCVTFuzrpIawXe2uiQFHuQZiVOwSDfGKY";
final post = "news";
final genre = "show/genre";
final user = "user";

Future<Registerresponse> register(
    String name, String email, String password) async {
  final response = await http.post("$link$reg", body: {
    'name': name,
    'email': email,
    'password': password,
  });
  print(response.body);
  return registerresponseFromJson(response.body);
}

Future<Registerresponse> loginn(String email, String password) async {
  final responselogin = await http.post("$link$log", body: {
    'email': email,
    'password': password,
  });
  return registerresponseFromJson(responselogin.body);
}

Future<Movie> getmovie() async {
  final responsemovie = await http.post("$link$movi", body: {
    'page': "1",
  }, headers: {
    HttpHeaders.authorizationHeader: "Bearer $token"
  });
  return movieFromJson(responsemovie.body);
}

Future<Series> getseries() async {
  final repnseseries = await http.post("$link$seri", body: {
    'page': "1",
  }, headers: {
    HttpHeaders.authorizationHeader: "Bearer $token"
  });
  print(repnseseries.body);
  return seriesFromJson(repnseseries.body);
}

Future<Song> getsong() async {
  final responsesong = await http.post("$link$post", headers: {
    HttpHeaders.authorizationHeader: "Bearer $token",
  });
  print(responsesong.body);
  return songFromJson(responsesong.body);
}

Future<Genres> getgenre() async {
  final responsesong = await http.get("$link$genre", headers: {
    HttpHeaders.authorizationHeader: "Bearer $token",
  });
  print(responsesong.body);
  return genreFromJson(responsesong.body);
}

Future<UserData> getuserdata() async {
  final responseuser = await http.get("$link$user", headers: {
    HttpHeaders.authorizationHeader: "Bearer $token",
  });
  print(responseuser.body);
  return userDataFromJson(responseuser.body);
}
