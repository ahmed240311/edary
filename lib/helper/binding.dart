import 'package:el_edary/viewmodel/getxcontroller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Auth());
  }
}
