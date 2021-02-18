import 'package:dw3_pizza_delivery_app/app/modules/menu/menu_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/menu/widgets/menu_buy_button.dart';
import 'package:dw3_pizza_delivery_app/app/modules/menu/widgets/menu_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends GetView<MenuController> {
  final String pizzaSize;

  MenuPage(this.pizzaSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pizzaSize,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.grey[200],
              child: Obx(
                () => Text(
                  'Total de pizzas selecionadas: ${controller.flavorsSelected.length}',
                  style: Get.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: MenuContent(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: MenuBuyButton(),
            ),
          ],
        ),
      ),
    );
  }
}
