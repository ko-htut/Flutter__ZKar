import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  TopBar() : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Card(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.ac_unit,
                      size: 30,
                    )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 40,
                      child: TextField(
                        //obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search',
                        ),
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet,
                          ),
                          Text("0",style: TextStyle(fontSize: 25))
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
