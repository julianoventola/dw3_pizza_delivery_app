import 'package:dw3_pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:get/get.dart';

class ApplicationnBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}
