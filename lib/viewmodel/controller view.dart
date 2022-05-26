import 'package:el_edary/view/auth/login_screen.dart';
import 'package:el_edary/view/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getxcontroller.dart';
class cotrollerView extends GetWidget<Auth> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return(Get.find<Auth>().user!= null)
          ? HomeView()
          : LoginScreen();

    });
  }
}
