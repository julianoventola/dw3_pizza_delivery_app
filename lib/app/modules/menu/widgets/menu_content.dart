import 'package:dw3_pizza_delivery_app/app/modules/menu/menu_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/menu/widgets/menu_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuContent extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Obx(
        () => ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuGroup(
              controller.menu[index],
            );
          },
        ),
      ),
    );
  }
}
