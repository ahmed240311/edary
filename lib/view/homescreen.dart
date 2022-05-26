import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:el_edary/model/customTextForm.dart';
import 'package:el_edary/model/custombutton.dart';
import 'package:el_edary/model/customtext.dart';
import 'package:el_edary/service/product.dart';
import 'package:el_edary/viewmodel/getxcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeView extends GetWidget<Auth> {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeView> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _globlKey = GlobalKey<FormState>();

  // Auth auth = Auth();
  late String cityName, regionName, ketahaName, ownerName;
  late int phone;
  late String note;
  var btnGreen, btnYellow, btnBlack;
  products product = products();
  late String formattedDate;

  @override
  Widget build(BuildContext context) {
    //   body: Center(
    //     child:   FlatButton(
    //       child: Text("Log Out"),
    //       onPressed: () {
    //         _auth.signOut();
    //         Get.offAll(LoginScreen());
    //       },
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Edary",
          alignment: Alignment.center,
          color: Colors.white,
          fontSize: 30.0,
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _globlKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 24.0, left: 24.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 7.9,
                //     ),
                //     Obx(() => DropdownButton<String>(
                //       value: auth.dropdownValueCity.value,
                //       icon: const Icon(
                //         Icons.arrow_drop_down,
                //       ),
                //       elevation: 8,
                //       style: const TextStyle(color: Colors.black54),
                //       underline: Container(
                //         height: 1.5,
                //         color: Colors.blue,
                //       ),
                //       onChanged: (valueCity) {
                //         auth.dropdownValueCity(valueCity!);
                //         print(valueCity);
                //         // controller.dropdownValueCity = newValue!;
                //       },
                //       items: auth.kindCities
                //           .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(
                //             value,
                //             style: styleForValue(),
                //           ),
                //         );
                //       }).toList(),
                //     )),
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 4.2,
                //     ),
                //     CustomText(
                //       text: "المدينة ",
                //       fontSize: 24.0
                //      ,
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      height: MediaQuery.of(context).size.height / 14.2,
                      child: CustomTextFormField(
                        text: " ",
                        hint: "   اسم المدينة  ",
                        onSave: (value) {
                          cityName = value;
                          print(cityName);
                        },
                        validator: (cityValue) {
                          if (cityValue!.isEmpty)
                            // notSuccsss();
                            // else
                            //   Succsss();
                            print("cityValue$cityValue");
                        },
                        type: TextInputType.text,
                      ),
                    ),

                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width / 2.8,
                    // ),
                    CustomText(
                      text: "المدينة ",
                      fontSize: 24.0,
                    ),
                  ],
                ),

                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      height: MediaQuery.of(context).size.height / 14.2,
                      child: CustomTextFormField(
                        text: " ",
                        hint: "   اسم المنطقة  ",
                        onSave: (value) {
                          regionName = value;
                        },
                        validator: (regionValue) {
                          if (regionValue!.isEmpty)
                            // notSuccsss();
                            // else
                            //   Succsss();
                            print("regionValue$regionValue");
                        },
                        type: TextInputType.text,
                      ),
                    ),

                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width / 2.8,
                    // ),
                    CustomText(
                      text: "المنطقة ",
                      fontSize: 24.0,
                    ),
                  ],
                ),

                SizedBox(
                  height: 18.0,
                ),

                // القطعة
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Obx(() => DropdownButton<String>(
                    //       value: auth.dropdownValueQ.value,
                    //       icon: const Icon(
                    //         Icons.arrow_drop_down,
                    //       ),
                    //       elevation: 8,
                    //       style: const TextStyle(color: Colors.black54),
                    //       underline: Container(
                    //         height: 1.5,
                    //         color: Colors.blue,
                    //       ),
                    //       onChanged: (valueQ) {
                    //         auth.setSelectedQ(valueQ!);
                    //         // controller.dropdownValueQ = newValue!;
                    //       },
                    //       items: auth.kindQ
                    //           .map<DropdownMenuItem<String>>((String value) {
                    //         return DropdownMenuItem<String>(
                    //           value: value,
                    //           child: Text(
                    //             value,
                    //             style: styleForValue(),
                    //           ),
                    //         );
                    //       }).toList(),
                    //     )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      height: MediaQuery.of(context).size.height / 14.2,
                      child: CustomTextFormField(
                        text: " ",
                        hint: "   رقم القطعة  ",
                        onSave: (value) {
                          ketahaName = value;
                        },
                        validator: (ketahaName) {
                          if (ketahaName!.isEmpty)
                            // notSuccsss();
                            // else
                            // Succsss();
                            print("ketahaName$ketahaName");
                        },
                        type: TextInputType.number,
                      ),
                    ),

                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width / 2.8,
                    // ),
                    CustomText(
                      text: "القطعة ",
                      fontSize: 24.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Obx(() => DropdownButton<String>(
                      //       value: auth.dropdownValueQ.value,
                      //       icon: const Icon(
                      //         Icons.arrow_drop_down,
                      //       ),
                      //       elevation: 8,
                      //       style: const TextStyle(color: Colors.black54),
                      //       underline: Container(
                      //         height: 1.5,
                      //         color: Colors.blue,
                      //       ),
                      //       onChanged: (valueQ) {
                      //         auth.setSelectedQ(valueQ!);
                      //         // controller.dropdownValueQ = newValue!;
                      //       },
                      //       items: auth.kindQ
                      //           .map<DropdownMenuItem<String>>((String value) {
                      //         return DropdownMenuItem<String>(
                      //           value: value,
                      //           child: Text(
                      //             value,
                      //             style: styleForValue(),
                      //           ),
                      //         );
                      //       }).toList(),
                      //     )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.9,
                        height: MediaQuery.of(context).size.height / 14.2,
                        child: CustomTextFormField(
                          text: " ",
                          hint: "   مالك العقار  ",
                          onSave: (owner) {
                            ownerName = owner;
                          },
                          validator: (ownerName) {
                            if (ownerName!.isEmpty)
                              // notSuccsss();
                              // else
                              //   Succsss();
                              print("ownerName$ownerName");
                          },
                          type: TextInputType.name,
                        ),
                      ),

                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 2.8,
                      // ),
                      CustomText(
                        text: "مالك العقار",
                        fontSize: 22.7,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.9,
                        height: MediaQuery.of(context).size.height / 14.2,
                        child: CustomTextFormField(
                          text: " ",
                          hint: "01",
                          onSave: (value) {
                            phone = int.parse(value, onError: (source) => -1);
                          },
                          validator: (phone) {
                            if (phone!.isEmpty) print("phone");
                            // notSuccsss();
                            // else
                            //   Succsss();
                          },
                          type: TextInputType.number,
                        ),
                      ),

                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 2.8,
                      // ),
                      CustomText(
                        text: "رقم الهاتف",
                        fontSize: 22.7,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 8.5,
                  // width: MediaQuery.of(context).size.width / ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: GetBuilder<Auth>(
                          builder: (_) {
                            return controller.image == null
                                ? Center(child: Text('لا يوجد صور.'))
                                : Image.file(controller.image!);
                          },
                        ),
                      ),
                      InkWell(
                          onTap: () => controller.upload(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 6.0,
                            child: Image.asset(
                              'images/upload.png',
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width / 6,
                              // width: MediaQuery.of(context).size.width / 18,
                            ),
                          )),
                      /*  SizedBox(
                          height: 50.0,
                        ),*/
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 9.0,
                    child: CupertinoDateTextBox(
                        initialValue: controller.selectedDateTime,
                        onDateChange: (DateTime newValue) {
                          controller.setSelectedDate(newValue);
                          print("time :${controller.selectedDateTime}");
                          // controller.update();
                        },
                        hintText: DateFormat.yMd()
                            .format(controller.selectedDateTime)),
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                CustomText(
                  text: "ملاحظات",
                  fontSize: 17.0,
                  color: Colors.black54,
                  alignment: Alignment.center,
                ),
                CustomTextFormField(
                  text: " ملاحظات   ",
                  hint: "",
                  onSave: (value) {
                    note = value;
                  },
                  validator: (note) {
                    if (note!.isEmpty) print("notes");
                    // notSuccsss();
                    // else
                    //   Succsss();
                  },
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 58.7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "وسط",
                        fontSize: 17.0,
                        color: Colors.black54,
                      ),
                      CustomText(
                        text: "أرجح",
                        fontSize: 17.0,
                        color: Colors.black54,
                      ),
                      CustomText(
                        text: "لا أرجح",
                        fontSize: 17.0,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18.7,
                      child: CustomButton(
                        buttonText: " ",
                        color: Colors.yellow,
                        onPress: () {
                          btnYellow = "وسط";
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18.7,
                      child: CustomButton(
                        buttonText: '',
                        color: Colors.green,
                        onPress: () {
                          btnGreen = "أرجح النزول ";
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18.7,
                      child: CustomButton(
                        buttonText: '',
                        color: Colors.black,
                        onPress: () {
                          btnBlack = "لا أرجح النزول ";
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  color: Colors.blue,
                  buttonText: 'Send',
                  onPress: () {
                    _globlKey.currentState!.save();
                    if (_globlKey.currentState!.validate()) {
                      if (cityName.isNotEmpty &&
                          cityName != null &&
                          regionName.isNotEmpty &&
                          ketahaName.isNotEmpty &&
                          phone != null &&
                          ownerName.isNotEmpty &&
                          note.isNotEmpty &&
                          note != null &&
                          (btnBlack != null ||
                              btnGreen != null ||
                              btnYellow != null)) {
                        formattedDate = DateFormat.yMd().format(controller.selectedDateTime);
                        product.add(
                          // id: 2,
                          cityName: cityName,
                          regionName: regionName,
                          ketahaName: ketahaName,
                          ownerName: ownerName,
                          phone: phone,
                          image: controller.image,
                          note: note,
                          btnYellow: btnYellow == null ? "" : btnYellow,
                          btnGreen: btnGreen == null ? "" : btnGreen,
                          btnBlack: btnBlack == null ? "" : btnBlack,
                          date: formattedDate,
                        );
                        print("done");
                        Succsss();
                      } else
                        notSuccsss();
                      print("not");
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.8,
                  indent: 47.0,
                  endIndent: 47.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void notSuccsss() {
  Get.snackbar(
      '                       '
          ' يجب ملئ جميع الحقول',
      "  ",
      margin: EdgeInsets.all(7.0),
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM);
}

void Succsss() {
  Get.snackbar(
      '                    '
          '         '
          '  تم الارسال  ',
      "  ",
      margin: EdgeInsets.all(7.0),
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM);
}
