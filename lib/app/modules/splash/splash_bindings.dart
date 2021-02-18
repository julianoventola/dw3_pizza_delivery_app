import 'package:dw3_pizza_delivery_app/app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinginds implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
