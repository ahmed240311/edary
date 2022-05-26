import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  final where = Uri.encodeQueryComponent(jsonEncode({
    "country": {
      "\$exists": true
    },
    "cityId": {
      "\$exists": true
    }
  }));
  final response = await http.get(
      'https://parseapi.back4app.com/classes/Egyptcities_City?count=1&limit=7&order=name&keys=name,country,location,cityId&where=$where',
      headers: {
        "X-Parse-Application-Id": "wkJRSWBux5DF5A2PhYuVUx9255PSQWwZ9djwTt5X", // This is your app's application id
        "X-Parse-REST-API-Key": "LJv3wzNZKQNuzR3oIU4SRPa16TEC7FLkdnEB9g3Y" // This is your app's REST API key
      }
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
}