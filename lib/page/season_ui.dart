import 'package:flutter/material.dart';
import 'package:flutter_ebox/providers/season_provider.dart';
import 'package:provider/provider.dart';

class SeasonUi extends StatelessWidget {
  int id;
  SeasonUi({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Provider.of<SeasonProvider>(context, listen: false).gethseason(id.toString());
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
                  return Card(
                      child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image(image: AssetImage('images/logo.png')),
                      ),
                    title: Text(seasonProvider.season.data[index].name),
                    subtitle: Text(seasonProvider.season.data[index].originalName),
                  ));
                },
              )));
    });
  }
}
