import 'package:dw3_pizza_delivery_app/app/modules/orders/order_controller.dart';
import 'package:dw3_pizza_delivery_app/app/repositories/order_repository.dart';
import 'package:get/get.dart';

class OrdersBinginds implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderRepository(Get.find()));
    Get.put(OrdersController(Get.find()));
  }
}
