import 'package:dw3_pizza_delivery_app/app/modules/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MenuBuyButton extends GetView<MenuController> {
  final formatter = NumberFormat('###.00', 'pt_br');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Row(
        children: [
          Container(
            width: Get.mediaQuery.size.width * 0.5,
            child: Obx(() => Text(
                  'Total R\$ ${formatter.format(controller.totalValue)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: controller.flavorsSelected.isEmpty
                        ? Colors.black12
                        : Colors.green,
                  ),
                )),
          ),
          Expanded(
            child: Obx(() => TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        controller.flavorsSelected.isEmpty
                            ? Colors.grey
                            : Colors.green),
                  ),
                  onPressed: () => controller.goToShoppingCart(),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Fechar Pedido',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
