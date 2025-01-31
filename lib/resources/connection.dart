//----------------------------------------------------------------------//
//-------------------------------PACKAGES-------------------------------//
//----------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//----------------------------------------------------------------------//
//-------------------------------PACKAGES-------------------------------//
//----------------------------------------------------------------------//

import 'sizes.dart';

//--------------------------------------------------------------------//
//--------------------------------------------------------------------//
//--------------------------------------------------------------------//

//--------------------------------------------------------------------//
//----------------------------CONNECTIVITY----------------------------//
//--------------------------------------------------------------------//

Widget launchApp(BuildContext context, String vConnection, Widget online) {
  print(vConnection);
  if (vConnection == 'Online') {
    return online;
  } else {
    return Container(
      width: displayWidth(context),
      height: displayHeight(context),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: displayWidth(context),
            height: displayHeight(context) * 0.50,
            margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Image.asset('img/no-internet.png'),
          ),
          Container(
            width: displayWidth(context),
            height: displayHeight(context) * 0.4,
            padding: new EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Text('No hay conexión a internet',
                  style: TextStyle(fontSize: 28, color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
