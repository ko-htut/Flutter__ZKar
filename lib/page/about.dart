import 'package:flutter/material.dart';
import 'package:flutter_ebox/providers/app_provider.dart';
import 'package:flutter_ebox/ui/consts.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List items = [
    {"icon": Icons.dashboard, "title": "Dark Mode"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if (items[index]['title'] == "Dark Mode") {
            return SwitchListTile(
              secondary: Icon(
                items[index]['icon'],
              ),
              title: Text(
                items[index]['title'],
              ),
              value: Provider.of<AppProvider>(context).theme ==
                      Constants.lightTheme
                  ? false
                  : true,
              onChanged: (v) {
                if (v) {
                  Provider.of<AppProvider>(context, listen: false)
                      .setTheme(Constants.darkTheme, "dark");
                } else {
                  Provider.of<AppProvider>(context, listen: false)
                      .setTheme(Constants.lightTheme, "light");
                }
              },
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
