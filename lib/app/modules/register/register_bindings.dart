import 'package:dw3_pizza_delivery_app/app/modules/register/register_controller.dart';
import 'package:dw3_pizza_delivery_app/app/repositories/user_repository.dart';
import 'package:get/get.dart';

class RegisterBinginds implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(RegisterController(Get.find()));
  }
}
