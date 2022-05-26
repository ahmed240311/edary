// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
//
// upload() async {
//   //pick image   use ImageSource.camera for accessing camera.
//   File image = await ImagePicker.pickImage(source: ImageSource.gallery,
//       imageQuality: 50,
//       maxHeight: 200.0,
//       maxWidth: 200.0);
//
//   //basename() function will give you the filename
//   // String fileName = basename(image.path);
//   if (image != null) {
//      Future<File> file = File(image.path) as Future<File>;
//   } else {
//     print('No image selected.');
//   }
//   // //passing your path with the filename to Firebase Storage Reference
//   // StorageReference reference =
//   // FirebaseHelper.firebaseStorage().child("your_path/$fileName");
//   //
//   // //upload the file to Firebase Storage
//   // StorageUploadTask uploadTask = reference.putFile(image);
//   //
//   // //Snapshot of the uploading task
//   // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
// }
