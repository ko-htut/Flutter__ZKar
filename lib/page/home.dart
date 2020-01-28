import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/feeddetial.dart';
import 'package:flutter_ebox/providers/post_provier.dart';
import 'package:flutter_ebox/ui/mywidget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SongProvider>(builder:
        (BuildContext context, SongProvider songProvider, Widget widget) {
      return Scaffold(
          body: songProvider.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => songProvider.gethsong(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: MyCustonListTitle(
                                      icon: Icons.monetization_on,
                                      data: "Donate ပြုလုပ်မည်",
                                      ontap: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: MyCustonListTitle(
                                      icon: Icons.category,
                                      data: "Our Team",
                                      ontap: () {},
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: MyCustonListTitle(
                                      icon: Icons.report,
                                      data: "User Guide",
                                      ontap: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: MyCustonListTitle(
                                      icon: Icons.calendar_today,
                                      data: "coming soon",
                                      ontap: () {},
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: songProvider.songs == null
                              ? 0
                              : songProvider.songs.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height) /
                                          0.52,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2.0,
                                  mainAxisSpacing: 2.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 0.5,
                              child: Stack(children: <Widget>[
                                InkWell(
                                  onTap: (){
                                     Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.downToUp,
                                  child: PostDetials(model: songProvider.songs.data[index],)
                                )
                              );
                            
                                  },
                                  child: Container(
                                    //  color: Colors.blueGrey,
                                    height: 170.0,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              3.0, 0.0, 3.0, 0.0),
                                        ),
                                        Container(
                                          height: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      songProvider.songs
                                                          .data[index].image),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3.0, right: 3.0),
                                          child: Text(
                                            songProvider
                                                .songs.data[index].title,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.justify,
                                            maxLines: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        songProvider.songs.data[index].type,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ));
    });
  }
}
