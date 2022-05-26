// import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
// import 'package:flutter/material.dart';
//
// import 'package:intl/intl.dart';
// class ShowDate extends StatefulWidget {
//   @override
//   _showDateState createState() => _showDateState();
// }
//
// class _showDateState extends State<ShowDate> {
//   DateTime _selectedDateTime = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
//
//     return Container(
//       height: MediaQuery.of(context).size.height/9.0,
//       child:  CupertinoDateTextBox(
//           initialValue: _selectedDateTime,
//           onDateChange: onBirthdayChange,
//           hintText: DateFormat.yMd().format(_selectedDateTime)),
//     );
//   }
//   void onBirthdayChange(DateTime birthday) {
//     setState(() {
//       _selectedDateTime = birthday;
//     });
//   }
// }
