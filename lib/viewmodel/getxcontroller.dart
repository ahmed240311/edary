import 'dart:io';

import 'package:el_edary/model/usermodel.dart';
import 'package:el_edary/service/firestoreuser.dart';
import 'package:el_edary/view/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';

// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class Auth extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  DateTime selectedDateTime = DateTime.now();

  // FacebookLogin _facebookLogin = FacebookLogin();
  late String email, password, name;
  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  // final dropdownValueCity = "العاشر من رمضان".obs;
  // final dropdownValueRegion = "A 1".obs;
  final dropdownValueQ = "1".obs;
  // final List<String> kindCities = ["العاشر من رمضان", "العبور", "بدر", "الشروق", "التجمع الخامس", "6 أكتوبر"];
  // final List<String> kindRegion = ["A 1", "A 2", "A 3"];
  // final List<String> kindQ = ["1", "2", "3"];
  File? image;
  final picker = ImagePicker();
  Rx<User> _user = Rx<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    // subscribeToAdmin();
    // getDeviceToken();
    //  cofigureCallBack();
  }

  @override
  void onClose() {}

  @override
  void onReady() {}

  void setSelectedQ(String value) {
    dropdownValueQ.value = value;
  }

  void setSelectedDate(DateTime value){
    selectedDateTime = value;
  }
  // void setSelectedRegion(String value){
  //   dropdownValueRegion.value = value;
  // }

  // void setSelectedCity(String value) {
  //   dropdownValueCity.value = value;
  // }

  Future upload() async {
    //pick image   use ImageSource.camera for accessing camera.
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 200.0,
        maxWidth: 200.0);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      Get.offAll(HomeView());
    });
  }

  // void faceBookLoginMethod() async {
  //   FacebookLoginResult result =
  //       await _facebookLogin.logIn(customPermissions: ['email']);
  //   final facebookAccessToken = result.accessToken.token;
  //   if (result.accessToken == FacebookLoginStatus.success) {
  //     final faceCrediental =
  //         FacebookAuthProvider.credential(facebookAccessToken);
  //     await _auth.signInWithCredential(faceCrediental)   .then((user) async {
  //       saveUser(user);
  //       Get.offAll(HomeView());
  //
  //     });
  //   }
  // }

  void signInEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
          '                '
              '             '
              ' Success',
          "  ",
          margin: EdgeInsets.all(7.0),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM);
      await Future.delayed(Duration(seconds: 2));
      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar(
          '                '
              '          '
              'error in login',
          "  ",
          margin: EdgeInsets.all(7.0),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.snackbar(
          '                '
              '             '
              ' Success',
          "  ",
          margin: EdgeInsets.all(7.0),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM);
      await Future.delayed(Duration(seconds: 2));

      Get.offAll(HomeView());
    } catch (e) {
      print(e);

      Get.snackbar(
          '                '
              '          '
              'error in login',
          "  ",
          margin: EdgeInsets.all(7.0),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        id: user.user.uid,
        name: name == null ? user.user.displayName : name,
        email: user.user.email,
        pass:password,
        ));
  }
/*
  void getDeviceToken() async{
String deviceToken=await firebaseMessaging.getToken();
print('deviceToken: $deviceToken');

  }
  void cofigureCallBack() {
    firebaseMessaging.configure(
      onLaunch: (message) async {
        print('onLaunch: $message');

        // Get.to(showResult);
      },
      onMessage: (message) async {
        print('onMessage: $message');
        // Get.to(showResult);
      },
      onResume: (message) async {
        print('onResume: $message');
        // Get.to(showResult);
      },

      // onResume: (Map<String, dynamic> message) async {
      //   // Get.to(showResult);
      // },

    );
  }

  void subscribeToAdmin() {

    firebaseMessaging.subscribeToTopic('Admin');
  }*/

}
