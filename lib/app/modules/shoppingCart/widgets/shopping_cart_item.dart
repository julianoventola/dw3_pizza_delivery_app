import 'package:dw3_pizza_delivery_app/app/models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingCartItem extends StatelessWidget {
  final numberFormat = NumberFormat.currency(
    name: 'R\$',
    locale: 'pt_BR',
    decimalDigits: 2,
  );
  final MenuItemModel item;

  ShoppingCartItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name),
          Text('${numberFormat.format(item.price)}'),
        ],
      ),
    );
  }
}
