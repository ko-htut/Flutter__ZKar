import 'dart:io';

import 'package:flutter_ebox/model/episode_response.dart';
import 'package:flutter_ebox/model/movierespnse.dart';
import 'package:flutter_ebox/model/resigerresponse.dart';
import 'package:flutter_ebox/model/season_response.dart';
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
final movidrcunt = "movie_directlink/count";
final movidcount = "movie_download/count";
final moviby = "buy/movie";
final seri = "series";
final sesn = "season";
final episn = "episode";
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

Future<Movie> getmovie(String key) async {
  final responsemovie = await http.post("$link$movi", body: {
    'page': "1",
  }, headers: {
    HttpHeaders.authorizationHeader: "Bearer $key"
  } );
  return movieFromJson(responsemovie.body);
}

Future<Series> getseries(String key,String page) async {
  final repnseseries = await 
  http.post("$link$seri", body: {
    'page': page,
  }, headers: {
    HttpHeaders.authorizationHeader: "Bearer $key"
  });
  print(repnseseries.body);
  return seriesFromJson(repnseseries.body);
}

Future<Season> getseason(String key,String id) async {
  final repnseseries = await http.post("$link$sesn", body: {
    'id': id,
  }, headers: {
    HttpHeaders.authorizationHeader: "Bearer $key"
  });
  print(repnseseries.body);
  return seasonFromJson(repnseseries.body);
}
Future<EpisodeResponse> getepisode(String key,String id) async {
  final responsemyepisode = await http.post("$link$episn", body: {
    'id': id,
  }, headers: {
    HttpHeaders.authorizationHeader: "Bearer $key"
  });
  print(responsemyepisode.body);
  return episodeResponseFromJson(responsemyepisode.body);
}

Future<Song> getsong(String key) async {
  final responsesong = await http.post("$link$post", headers: {
    HttpHeaders.authorizationHeader: "Bearer $key",
  });
  print(responsesong.body);
  return songFromJson(responsesong.body);
}

Future<Genres> getgenre(String key) async {
  final responsesong = await http.get("$link$genre", headers: {
    HttpHeaders.authorizationHeader: "Bearer $key",
  });
  print(responsesong.body);
  return genreFromJson(responsesong.body);
}

Future<UserData> getuserdata(String key) async {
  final responseuser = await http.get("$link$user", headers: {
    HttpHeaders.authorizationHeader: "Bearer $key",
  });
  print(responseuser.body);
  return userDataFromJson(responseuser.body);
}
