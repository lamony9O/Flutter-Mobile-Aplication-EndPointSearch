//----------------------------------------------------------------------//
//-------------------------------PACKAGES-------------------------------//
//----------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

//----------------------------------------------------------------------//
//-------------------------------RESOURCES------------------------------//
//----------------------------------------------------------------------//

import '../resources/global.dart' as global;
import '../resources/sizes.dart';
import '../resources/data.dart' as db;

//---------------------------------------------------------------------//

Future<List> _results;

void getResults(String search) {
  _results = db.getSearchResults(search);
}
void getResultsStep(int interval) {
  _results = db.getSearchResultsStep(interval);
}

class InitResultView extends StatefulWidget {
  final String search;
  final int interval;
  const InitResultView(this.search, this.interval);
  @override
  State<InitResultView> createState() => _InitResultView();
}

class _InitResultView extends State<InitResultView> {
  //int tappedIndex = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      //global.tappedIndex = widget.tapIndex;
      getResults(widget.search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _results,
      builder: (ctx, snapshot) {
        List results = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return _buildEventsView(results);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildEventsView(List results) {
    return ListView.builder(
      padding: const EdgeInsets.all(3),
      itemCount: results == null ? 0 : results.length,
      itemBuilder: (context, index) {
        return _buildEventRow(results[index], index);
      },
    );
  }

  Widget _buildEventRow(row, index) => Container(
        margin: const EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Container(
                height: 82,
                padding: const EdgeInsets.only(left: 0),         
                margin: new EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                      color: Colors.black,
                      width: 5,
                    ),
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.blue,
                    )                              
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width: displayWidth(context) * 0.11,                        
                        padding: new EdgeInsets.symmetric(horizontal: 5),  
                        margin: new EdgeInsets.symmetric(vertical: 10),
                        decoration:
                          BoxDecoration(
                            color: Colors.transparent,
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.blueGrey,
                                )
                              ),

                        ),
                        child: Center(
                          child: Text(
                            row['Source'],
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        width: displayWidth(context) * 0.22,                        
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        margin: new EdgeInsets.symmetric(vertical: 10),
                        decoration:
                          BoxDecoration(
                            color: Colors.transparent,
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.blueGrey,
                                )
                              ),

                        ),
                        child: Center(
                          child: Text(
                            row['Name'],
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        width: displayWidth(context) * 0.13,
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                        margin: new EdgeInsets.symmetric(vertical: 10),
                        decoration:
                          BoxDecoration(
                            color: Colors.transparent,
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.blueGrey,
                                )
                              ),

                        ),
                        child: Center(
                          child: Text(
                            row['Type'],
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        width: displayWidth(context) * 0.35,                        
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        margin: new EdgeInsets.symmetric(vertical: 10),
                        decoration:
                          BoxDecoration(
                            color: Colors.transparent,
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.blueGrey,
                                )
                              ),

                        ),
                        child: Center(
                          child: Text(
                            row['Description'],
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        width: displayWidth(context) * 0.16,                        
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        margin: new EdgeInsets.symmetric(vertical: 10),
                        decoration:
                          BoxDecoration(
                            color: Colors.transparent,
                              /* border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.blueGrey,
                                )
                              ), */

                        ),
                        child: Center(
                          child: Text(
                            row['Genre'],
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      ),





                    ],
                  ),
                ),
              ),
              onPressed: () => setState(() {
                //global.tappedIndex = index;
                //widget.updateId(index);
                //print(global.evtrowid);
              }),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                primary: Colors.transparent, // background
                onPrimary: Colors.lightBlueAccent, // foreground
                shadowColor: Colors.transparent,
              ),
            ),
          ],
        ),
      );
}
