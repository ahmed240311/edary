import 'dart:convert';

import 'package:flutter/material.dart';

import 'api.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData(); // Here you have the data that you need
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: new SingleChildScrollView(
            child: FutureBuilder<Map<String, dynamic>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(new JsonEncoder.withIndent('  ').convert(snapshot.data));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
