import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ebox/page/mainbody.dart';
import 'package:flutter_ebox/page/splash.dart';
import 'package:flutter_ebox/providers/app_provider.dart';
import 'package:flutter_ebox/providers/movie_provider.dart';
import 'package:flutter_ebox/providers/post_provier.dart';
import 'package:flutter_ebox/providers/series_provider.dart';
import 'package:flutter_ebox/providers/user_provider.dart';
import 'package:flutter_ebox/ui/consts.dart';
import 'package:provider/provider.dart';

void main() {
 

  runApp(
    
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => SeriesProvider()),
        ChangeNotifierProvider(create: (_) => SongProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          home: Splash(),
          routes: <String, WidgetBuilder>{
            '/MainScreen': (context) => MainScreen(),
            
          },
        );
      },
    );
  }
}