import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_edary/model/usermodel.dart';
import 'package:http/http.dart' as http;

class FireStoreUser {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _collectionReference.doc(userModel.id).set(userModel.toJson());
  }
}

class FireBaseHome {
  // DatabaseReference _reference=FirebaseDatabase.instance.reference().child("product");
  final response = http.post(
      'https://eledary-76df1-default-rtdb.firebaseio.com/product.json',
      body: json.encode({"id": 1}));
}
