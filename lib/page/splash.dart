import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/login.dart';
import 'package:flutter_ebox/providers/movie_provider.dart';
import 'package:flutter_ebox/providers/post_provier.dart';
import 'package:flutter_ebox/providers/series_provider.dart';
import 'package:flutter_ebox/providers/user_provider.dart';
import 'package:flutter_ebox/ui/consts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var timeout = const Duration(seconds: 2);
  var ms = const Duration(milliseconds: 1);

  bool gone = false;

  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: LoginPage(),
      ),
    );
    Provider.of<MovieProvider>(context, listen: false).gethmovie();
    Provider.of<SeriesProvider>(context, listen: false).gethseries();
    Provider.of<SongProvider>(context, listen: false).gethsong();
    Provider.of<UserProvider>(context, listen: false).gethusers();
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/ic_point.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${Constants.appName}",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
