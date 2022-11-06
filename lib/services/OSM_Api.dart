import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:map_ui/models/API_Model.dart';
class OSM_Api{
  var baseUrl="https://gps.zig-app.com/api/getlastGpsdata/350424068840089";
 Future<API_Model> FetchData()async{
    var response=await http.get(Uri.parse(baseUrl));
    if(response.statusCode==200){
      // var ResponseDecode=jsonDecode(response.body);
      // print(ResponseDecode);
      return API_Model.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('api failed');
    }
  }
}