import 'dart:io';
import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';
import 'package:fancy_bottom_bar/fancy_bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/about.dart';
import 'package:flutter_ebox/page/home.dart';
import 'package:flutter_ebox/page/movie.dart';
import 'package:flutter_ebox/page/series.dart';
import 'package:flutter_ebox/providers/user_provider.dart';
import 'package:flutter_ebox/ui/consts.dart';
import 'package:flutter_ebox/ui/custom_alart.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController;
  int mPoint = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  exitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15),
              Text(
                Constants.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Are you sure you want to quit?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 130,
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 130,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => exit(0),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder:
        (BuildContext context, UserProvider userProvider, Widget widget) {
      return Scaffold(
          body: userProvider.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : WillPopScope(
                  onWillPop: () => exitDialog(context),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Container(
                        height: 40,
                        child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                //hintText: 'Search',
                                prefixIcon: Icon(Icons.search),
                                labelStyle: TextStyle(fontSize: 15))),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image(image: AssetImage('images/logo.png')),
                      ),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Image(
                                    image: AssetImage('images/ic_point.png'),
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Marquee(
                                    child: Text(
                                      "${userProvider.userdatas.points}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                      toolbarOpacity: 1,
                      elevation: 0.5,
                    ),
                    body: SizedBox.expand(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() => _currentIndex = index);
                        },
                        children: <Widget>[
                          HomePage(),
                          MoviePage(),
                          SeriesPage(),
                          AboutPage(),
                        ],
                      ),
                    ),
                    bottomNavigationBar: FancyBottomBar(
                    //  selectedIndex: _currentIndex,
                    selectedPosition: _currentIndex,
                      //showElevation: true,
                      onItemSelected: (index) {
                        setState(() => _currentIndex = index);
                        _pageController.jumpToPage(index);
                      },
                      items: [
              FancyBottomItem(title: Text("Home"), icon: Icon(Icons.home)),
              FancyBottomItem(title: Text("Movies"), icon: Icon(Icons.movie)),
              FancyBottomItem(title: Text("Series"), icon: Icon(Icons.live_tv)),
              FancyBottomItem(title: Text("Settings"), icon: Icon(Icons.settings))
    ],
                    ),
                  )));
    });
  }
}