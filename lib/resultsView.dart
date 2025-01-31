//----------------------------------------------------------------------//
//-------------------------------PACKAGES-------------------------------//
//----------------------------------------------------------------------//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//----------------------------------------------------------------------//
//--------------------------------SCREENS-------------------------------//
//----------------------------------------------------------------------//

//import 'widgets/w-sideMenu.dart';

//----------------------------------------------------------------------//
//------------------------------RESOURCES-------------------------------//
//----------------------------------------------------------------------//

import 'resources/sizes.dart';
import 'resources/data.dart' as db;
import 'widgets/w-header.dart';
import 'widgets/w-results.dart' as results;/* 
import 'resources/global.dart' as global;/*  */ */
//---------------------------------------------------------------------//

//Future<List> _results;
double stepsCountResult;
int stepsCountPages;

class InitResponseView extends StatefulWidget {
  final String search;
  const InitResponseView(this.search);
  @override
  State<InitResponseView> createState() => _InitResponseView();
}

class _InitResponseView extends State<InitResponseView> {
  //Future<List> _results;

  int interval = 0;
  
  @override
  void initState() {
    super.initState();
    setState(
      () {
        /* /*  */getCountResults(); */  
        //stepsCountPages = stepsCountResult ~/ 10;
        //global.pageCount = 1;
      },
    );

  }

  /* void getCountResults() async {
    Future<String> stringFuture = db.getCountResultsValue();
    String temp = await stringFuture;
    stepsCountResult = double.parse(temp);
  }
 */

  @override
  Widget build(BuildContext context) {
            return Scaffold(
              
              appBar: AppBar(
                title: Stack(
                  children: <Widget>[
                    Container(child: HeaderContainer()),
                  ],
                ),
                backgroundColor: Colors.blue,
              ),
              body: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      //search container
                      width: double.infinity,
                      height: displayHeight(context) * 0.09,
                      margin: new EdgeInsets.only(bottom: 0),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 3.4,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget> [
                          Container(
                            // search text container                            
                            width: displayWidth(context) * 0.85, height: double.infinity,
                            decoration:
                                BoxDecoration(
                                  color: Colors.transparent,
                                  /* border: Border.all(
                                    color: Colors.green,
                                    width: 2,
                                  ) */

                                ),
                            child: Center(
                              child: Text(
                              "Busqueda: "+ widget.search,
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            ),
                            
                          ),
                          Container(
                            // close button container
                            width: displayWidth(context) * 0.1, height: double.infinity,
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: ElevatedButton(
                      
                              child: Text('X',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white
                                    ),
                                ),
                              onPressed: () {
                                  
                                setState(() {
                                  Navigator.pop(context);
                                });
                                
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: BorderSide(color: Colors.red),
                                  )
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.red)
                              )
                            ),
                          ),
                        ],
                      ), 

                    ),


                    Container(
                      width: double.infinity,
                      height: displayHeight(context) * 0.83,                      
                      decoration: BoxDecoration(
                        /* border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ), */
                        color: Colors.white,
                        
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 52,
                            padding: const EdgeInsets.only(left: 0),         
                            margin: new EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                               border: Border(
                                left: BorderSide(
                                  color: Colors.blue,
                                  width: 5,
                                ),
                                                             
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
                                              color: Colors.white,
                                            )
                                          ),

                                    ),
                                    child: Center(
                                      child: Text(
                                        "Fuente",
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
                                              color: Colors.white,
                                            )
                                          ),

                                    ),
                                    child: Center(
                                      child: Text(
                                        "Nombre",
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
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
                                              color: Colors.white,
                                            )
                                          ),

                                    ),
                                    child: Center(
                                      child: Text(
                                        "Tipo",
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
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
                                              color: Colors.white,
                                            )
                                          ),

                                    ),
                                    child: Center(
                                      child: Text(
                                        "Descripción",
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
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
                                              color: Colors.white,
                                            )
                                          ), */

                                    ),
                                    child: Center(
                                      child: Text(
                                        "Genero",
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),





                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: (displayHeight(context) * 0.83) * 0.80,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                               border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                                             
                              ), 
                            ),
                            child: results.InitResultView(widget.search, interval),
                          ),
                          Container(
                            width: double.infinity,
                            height: (displayHeight(context) * 0.83) * 0.1,
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                              /* border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ) , */
                              color: Colors.transparent,
                            ),
                            child: Row(
                              children: [

                                Container(
                                  // prev button container
                                  width: displayWidth(context) * 0.3, height: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: ElevatedButton(
                            
                                    child: Text('Anterior',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white
                                          ),
                                      ),
                                    onPressed: () {
                                       
                                       WidgetsBinding.instance.addPostFrameCallback((_) => 
                                       setState(() {

                                          if(interval > 0){                                            
                                            interval = interval - 10;
                                            
                                            results.getResultsStep(interval);
                                          }
                                          
                                        }),
                                      );
                                      
                                    },
                                    style: 
                                    ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100),
                                          side: BorderSide(color: Colors.blue)
                                        )
                                      )
                                    )
                                  ),
                                ),
                                
                                Container(
                                  // next button container
                                  width: displayWidth(context) * 0.3, height: double.infinity,                                  
                                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: ElevatedButton(
                            
                                    child: Text('Siguiente',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white
                                          ),
                                      ),
                                    onPressed: () {
                                     

                                     WidgetsBinding.instance.addPostFrameCallback((_) => 
                                       setState(() {
                                          print(interval);
                                          //if(interval < (stepsCountPages * 10) ){
                                            
                                            interval = interval + 10;
                                            results.getResultsStep(interval);
                                          //}
                                          
                                        }),
                                      );
                                      
                                    },
                                    style: 
                                    ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100),
                                          side: BorderSide(color: Colors.blue)
                                        )
                                      )
                                    )
                                  ),
                                ),


                              ],)
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
 
         
  }
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
