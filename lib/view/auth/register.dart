import 'package:el_edary/model/customTextForm.dart';
import 'package:el_edary/model/custombutton.dart';
import 'package:el_edary/model/customtext.dart';
import 'package:el_edary/view/auth/login_screen.dart';
import 'package:el_edary/viewmodel/getxcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<Auth> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Edary",
          alignment: Alignment.center,
          color: Colors.blue,
          fontSize: 30.0,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginScreen());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome",
                      fontSize: 30.0,
                    ),
                    CustomText(
                      text: "Sign Up",
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomText(
                  text: "Sign Up To Continue",
                  fontSize: 14.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomTextFormField(
                  text: "Name",
                  hint: "Name",
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('required');
                    }
                  }, type:  TextInputType.name,
                ),
                SizedBox(
                  height: 45.0,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: "Email",
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('required');
                    }
                  }, type:  TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 45.0,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "**********",
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('required');
                    }
                  }, type:  TextInputType.name,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7.9,
                ),
                CustomButton(
                  buttonText: 'Sign Up',
                  onPress: () {
                    _globalKey.currentState!.save();
                    if (_globalKey.currentState!.validate()) {
                      controller.createEmailAndPassword();
                    }
                  },
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20.0,
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
