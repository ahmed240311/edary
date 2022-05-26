import 'package:el_edary/model/customTextForm.dart';
import 'package:el_edary/model/custombutton.dart';
import 'package:el_edary/model/custombuttonSocial.dart';
import 'package:el_edary/model/customtext.dart';
import 'package:el_edary/view/auth/register.dart';
import 'package:el_edary/viewmodel/getxcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<Auth> {
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
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomText(
                  text: "Sign In To Continue",
                  fontSize: 14.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30.0,
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
                  },
                  type:  TextInputType.emailAddress,
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
                  height: 17.0,
                ),
                CustomText(
                  text: "Forget Password",
                  fontSize: 13,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  buttonText: 'SIGN IN',
                  onPress: () {
                    _globalKey.currentState!.save();
                    if (_globalKey.currentState!.validate()) {
                      controller.signInEmailAndPassword();
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
                SizedBox(
                  height: 17.0,
                ),
                CustomText(
                  text: 'OR',
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 27.0,
                ),
                CustomBtnSocial(
                  onPress: () {
                    // controller.faceBookLoginMethod();
                  },
                  text: 'Sign In With FaceBook',
                  imageName: 'images/facebook.png',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomBtnSocial(
                  onPress: () {
                    controller.googleSignInMethod();
                  },
                  text: 'Sign In With Google',
                  imageName: 'images/google.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
