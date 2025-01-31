//----------------------------------------------------------------------//
//-------------------------------PACKAGES-------------------------------//
//----------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:connectivity_widget/connectivity_widget.dart';

//----------------------------------------------------------------------//
//--------------------------------SCREENS-------------------------------//
//----------------------------------------------------------------------//

// ignore: unused_import
import 'searchView.dart';

//----------------------------------------------------------------------//
//------------------------------RESOURCES-------------------------------//
//----------------------------------------------------------------------//

import 'resources/connection.dart' as conn;

//---------------------------------------------------------------------//

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(new SearchEndPoint());
}

class SearchEndPoint extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return new MaterialApp(
      theme: ThemeData(fontFamily: 'euro'),
      home: new InitSearchView(),
      /* ConnectivityWidget(
        builder: (context, isOnline) => conn.launchApp(
            context, "${isOnline ? 'Online' : 'Offline'}", new InitSearchView()),
      ), */
    );
  }
}
