import 'package:dw3_pizza_delivery_app/app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPanel extends StatelessWidget {
  static final formatNumberPrice = NumberFormat.currency(
    name: 'R\$ ',
    locale: 'pt_BR ',
    decimalDigits: 2,
  );

  final OrderModel order;
  const HistoryPanel({
    this.order,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Pedido ${order.id}'),
      children: [
        Divider(),
        ...order.items.map((item) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.item.name),
                Text(formatNumberPrice.format(item.item.price)),
              ],
            ),
          );
        }).toList(),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                formatNumberPrice.format(_calculateTotalOrder()),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double _calculateTotalOrder() => order.items.fold(
        0,
        (total, order) => total += order.item.price,
      );
}
