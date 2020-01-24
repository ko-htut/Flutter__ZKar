import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/login.dart';
import 'package:flutter_ebox/page/mainbody.dart';
import 'package:flutter_ebox/providers/movie_provider.dart';
import 'package:flutter_ebox/providers/post_provier.dart';
import 'package:flutter_ebox/providers/series_provider.dart';
import 'package:flutter_ebox/providers/user_provider.dart';
import 'package:flutter_ebox/ui/consts.dart';
import 'package:flutter_ebox/util/share.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool gone = false;
  String key = "";

  getkey() async {
    String token = await mytoken();
    setState(() {
      key = token;
    });
  }

  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() async {
    if (key == null) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: LoginPage(),
        ),
      );
    } else {
      changeScreen();
    }
    print(key);
  }

  changeScreen() async {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: MainScreen(),
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
    getkey();
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
              height: 100,
              width: 100,
              image: AssetImage('images/logo.png'),
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
