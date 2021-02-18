import 'package:dw3_pizza_delivery_app/app/modules/menu/menu_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/menu/menu_page.dart';
import 'package:dw3_pizza_delivery_app/app/repositories/menu_repository.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    final sharedp = await SharedPreferences.getInstance();
    sharedp.setInt('tab', 0);
  }

  Future<void> openMenu(String pizzaSize) async {
    Get.put(MenuRepository(Get.find()));
    Get.put(MenuController(Get.find()));
    await showBarModalBottomSheet(
        context: Get.context,
        builder: (context) {
          return MenuPage(pizzaSize);
        });
    Get.delete<MenuController>();
    Get.delete<MenuRepository>();
  }
}
