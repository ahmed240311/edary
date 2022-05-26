import 'package:get/get.dart';

import 'getxcontroller.dart';

class PickImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Auth>(() => Auth());

  }
}