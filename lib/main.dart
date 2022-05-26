// @dart=2.9
import 'package:el_edary/helper/binding.dart';
import 'package:el_edary/view/auth/login_screen.dart';
import 'package:el_edary/view/homescreen.dart';
import 'package:el_edary/viewmodel/controller%20view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/test.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true,badge: true,sound: true);

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: cotrollerView(),
        // body: HomeView(),
      ),
    );
  }
}

