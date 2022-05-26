import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// class Product {
//   final String id;
//   final String cityName;
//   final String regionName;
//   final String ketahaName;
//   final String ownerName;
//   final int phone;
//   final String notes;
//   final String imageUrl;
//
//   Product({
//     required this.id,
//     required this.cityName,
//     required this.regionName,
//     required this.ketahaName,
//     required this.ownerName,
//     required this.phone,
//     required this.notes,
//     required this.imageUrl,
//   });
// }
import 'package:intl/intl.dart';
class products extends GetxController {
  // List<Product> productList = [];

  // late String note, imageUrl;
  // List<MultipartFile> multipartFile = List<MultipartFile>();
  void add({
    // required  id,
    required  cityName,
    required  regionName,
    required  ketahaName,
    required  ownerName,
    required  phone,
    File? image,
    required   note,
    required   btnYellow,
    required   btnGreen,
    required   btnBlack,
    required   date,

    // imageUrl,
  }) {
    http.post('https://eledary-76df1-default-rtdb.firebaseio.com/product.json',
        body: json.encode({
          // "id": id,
          "cityName": cityName,
          "regionName": regionName,
          "ketahaName": ketahaName,
          "ownerName": ownerName,
          "phone": phone,
          "image" :image.toString(),
          "note": note,
          "btnYellow":btnYellow,
          "btnGreen":btnGreen,
          "btnBlack":btnBlack,
          "date":date,

          // "imageUrl": imageUrl,
        }));
    // productList.add(products(
    //
    // ))
  }
  

}
