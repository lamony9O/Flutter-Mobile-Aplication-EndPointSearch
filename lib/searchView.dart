//----------------------------------------------------------------------//
//-------------------------------PACKAGES-------------------------------//
//----------------------------------------------------------------------//

import 'package:flutter/material.dart';

//----------------------------------------------------------------------//
//--------------------------------SCREENS-------------------------------//
//----------------------------------------------------------------------//

//import 'widgets/w-sideMenu.dart';
import 'resultsView.dart';

//----------------------------------------------------------------------//
//------------------------------RESOURCES-------------------------------//
//----------------------------------------------------------------------//


import 'resources/sizes.dart';
import 'resources/global.dart' as global;
import 'widgets/w-header.dart';
//import 'widgets/w-events.dart' as events;
//---------------------------------------------------------------------//

final TextEditingController inputController = TextEditingController();

class InitSearchView extends StatefulWidget {
  
  InitSearchView({Key key}) : super(key: key);
  @override
  _InitEventsView createState() => _InitEventsView();
}

class _InitEventsView extends State<InitSearchView> {

  @override
  
  void initState() {
    super.initState();
    setState(
      () {

       },
    );

  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //drawerEnableOpenDragGesture: true,
      //endDrawer: NavDrawer(),
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            Container(child: HeaderContainer()),
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        
        width: double.infinity,
        height: double.infinity,
        
        child: Column(
          children: <Widget>[

            Container(
              //padding container
              width: double.infinity,
              height: displayHeight(context) * 0.28,
            ),

            Container(
              //search container
              width: double.infinity,
              height: displayHeight(context) * 0.3,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),              
              child: Column(
                children: <Widget>[

                  Container(
                    // search box container
                    width: double.infinity, height: 100,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration:
                        BoxDecoration(color: Colors.transparent,
                       /*  border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ) */
                        ),
                    child: TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Introduzca un término de búsqueda',
                      ),
                    ),
                  ),
                  Container(
                    // button search container
                    width: double.infinity, height: 50,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    color: Colors.transparent,                       
                    child: ElevatedButton(
                      
                      child: Text('Buscar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white
                              )
                            ),
                      onPressed: () {                          
                        Navigator.push(context,MaterialPageRoute(builder: (context) => InitResponseView(inputController.text),));                        
                      },
                      style: 
                      ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.blueGrey)
                          )
                        )
                      )
                    ), 
                  ),
                ],
              ), //map container
            ),




          ]
        ),
      ),
    );

  }
}

