import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/season_page.dart';
import 'package:flutter_ebox/providers/season_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SeasonUi extends StatelessWidget {
  int id;
  final varimg;

  SeasonUi({Key key, @required this.id, @required this.varimg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SeasonProvider>(context, listen: false)
        .gethseason(id.toString());
    return Consumer<SeasonProvider>(builder:
        (BuildContext context, SeasonProvider seasonProvider, Widget widget) {
      return seasonProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => seasonProvider.gethseason(id.toString()),
              child: Container(
                  child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 0),
                scrollDirection: Axis.vertical,
                itemCount: seasonProvider.season.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SeasonScreen(
                            varimg: varimg,
                            series_name: seasonProvider.season.data[index].name,
                            id: seasonProvider.season.data[index].id,
                          ),
                        ),
                      );
                    },
                    child: Card(
                        elevation: 0,
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Image(image: AssetImage('images/logo.png')),
                          ),
                          title: Text(seasonProvider.season.data[index].name),
                          subtitle: Text(
                              seasonProvider.season.data[index].originalName),
                        )),
                  );
                },
              )
              )
              );
    });
  }
}
