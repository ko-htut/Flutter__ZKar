import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/seriesdetails.dart';
import 'package:flutter_ebox/providers/season_provider.dart';
import 'package:flutter_ebox/providers/series_provider.dart';
import 'package:flutter_ebox/ui/ebox_item.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SeriesPage extends StatelessWidget {

  ScrollController _scrollController = new ScrollController();
  int page = 1;
  @override
  Widget build(BuildContext context) {
    
    Provider.of<SeriesProvider>(context, listen: false)
        .gethseries(page.toString());
    return Consumer<SeriesProvider>(builder:
        (BuildContext context, SeriesProvider seriesProvider, Widget widget) {
      return Scaffold(
        body: seriesProvider.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => seriesProvider.gethseries(page.toString()),
                child: ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 40,
                      child: Center(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          scrollDirection: Axis.horizontal,
                          itemCount: seriesProvider.genres.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    seriesProvider.genres.data[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: seriesProvider.series.data == null
                          ? 0
                          : seriesProvider.series.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height) /
                              0.95,
                          crossAxisCount: 3,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0),
                      itemBuilder: (BuildContext context, int index) {
                       
                        
                          return EDataItem(
                            title: seriesProvider.series.data[index].title,
                            image: seriesProvider.series.data[index].poster,
                            rate: seriesProvider.series.data[index].imdbRating,
                            tap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: SeriesDetails(
                                      model: seriesProvider.series.data[index]),
                                ),
                              );
                            },
                          );
                        
                      },
                      controller: _scrollController,
                    ),
                  ),
                ])),
      );
    });
  }

}
