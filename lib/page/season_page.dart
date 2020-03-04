import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ebox/providers/episode_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SeasonScreen extends StatelessWidget {
  final varimg;
  String series_name;
  int id;

  SeasonScreen(
      {Key key,
      @required this.varimg,
      @required this.series_name,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<EpisodeProvider>(context, listen: false)
        .gethepisode(id.toString());
    return Consumer<EpisodeProvider>(builder:
        (BuildContext context, EpisodeProvider episodeProvider, Widget widget) {
      return episodeProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => episodeProvider.gethepisode(id.toString()),
              child: Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: 200.0,
                        floating: false,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(series_name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                          background: Container(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  color: Color.fromARGB(40, 43, 35, 43),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(varimg),
                              ))),
                        ),
                      ),
                    ];
                  },
                  body: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    scrollDirection: Axis.vertical,
                    itemCount: episodeProvider.episode.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Card(
                            elevation: 0,
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child:
                                    Image(image: AssetImage('images/logo.png')),
                              ),
                              title: Text(
                                  episodeProvider.episode.data[index].name),
                              subtitle: Text(episodeProvider
                                  .episode.data[index].originalName),
                            )),
                      );
                    },
                  ),
                ),
              ));
    });
  }
}
