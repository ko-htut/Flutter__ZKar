import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/movie_detial.dart';

import 'package:flutter_ebox/providers/movie_provider.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:flutter_ebox/ui/ebox_item.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder:
        (BuildContext context, MovieProvider movieProvider, Widget widget) {
      return Scaffold(
        body: movieProvider.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => movieProvider.gethmovie(),
                child: ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 40,
                      child: Center(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          scrollDirection: Axis.horizontal,
                          itemCount: movieProvider.genres.data.length,
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
                                    movieProvider.genres.data[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      //color: Colors.white
                                    ),
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
                    child: Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: movieProvider.movie.data == null
                            ? 0
                            : movieProvider.movie.meta.perPage,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height) /
                                    0.9,
                            crossAxisCount: 3,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0),
                        itemBuilder: (BuildContext context, int index) {
                          return EDataItem(
                            title: movieProvider.movie.data[index].title,
                            image: movieProvider.movie.data[index].poster,
                            rate: movieProvider.movie.data[index].imdbRating,
                            tap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: MovieDetails(model:movieProvider.movie.data[index]),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ])),
      );
    });
  }
}
