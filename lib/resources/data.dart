//----------------------------------------------------------------------------//
//----------------------------------PACKAGES----------------------------------//
//----------------------------------------------------------------------------//

import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import "global.dart" as global;

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
//------------------------------------DATA------------------------------------//
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

Future<List> getSearchResults(String search) async {
  return Future.value(convert.jsonDecode(await getResponseEndPoint(search)));
}

Future<String> getResponseEndPoint(String search) async {
  var url = Uri.parse('http://192.168.0.100:5292/search/get?search=' + search);   
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return null;
  }
}

Future<List> getSearchResultsStep(int interval) async {
  return Future.value(convert.jsonDecode(await getResponseEndPointStep(interval)));
}

Future<String> getResponseEndPointStep(int interval) async {
  var url = Uri.parse('http://192.168.0.100:5292/search/step?interval=' + interval.toString());   
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  } else {
    return null;
  }
}

Future<String> getCountResultsValue() async {
  return Future.value(getCountResults());
}

Future<String> getCountResults() async {
  var url = Uri.parse('http://192.168.0.100:5292/search/count');   
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    return response.body;
  } else {
    return null;
  }
}

