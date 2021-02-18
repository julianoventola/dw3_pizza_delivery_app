import 'package:dw3_pizza_delivery_app/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinginds implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
