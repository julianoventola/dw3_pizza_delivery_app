import 'package:dw3_pizza_delivery_app/app/modules/shoppingCart/shopping_cart_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/shoppingCart/widgets/shopping_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ShoppingCartItems extends GetView<ShoppingCartController> {
  final numberFormat = NumberFormat.currency(
    name: 'R\$',
    locale: 'pt_BR',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 10),
          child: Text(
            'Pedido',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        ...controller.flavorsSelected.map((item) {
          return ShoppingCartItem(item: item);
        }).toList(),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text('${numberFormat.format(controller.totalPrice)}'),
            ],
          ),
        ),
      ],
    );
  }
}
