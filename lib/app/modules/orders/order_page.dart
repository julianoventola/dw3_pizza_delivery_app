import 'package:dw3_pizza_delivery_app/app/components/pizza_delivery_bottom_navigation.dart';
import 'package:dw3_pizza_delivery_app/app/models/order_model.dart';
import 'package:dw3_pizza_delivery_app/app/modules/orders/order_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/orders/widgets/history_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrdersController> {
  static const String ROUTE_PAGE = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
        actions: [
          IconButton(
            icon: Icon(FontAwesome.refresh),
            onPressed: () => controller.findOrders(),
          ),
        ],
      ),
      bottomNavigationBar: PizzaDeliveryBottomNavigation(1),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            children: [
              Container(
                height: constraints.maxHeight,
                child: controller.obx(
                  (state) => _makeOrder(state),
                  onError: (_) => Center(
                    child: Text('Erro ao buscar pedidos'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Visibility _makeOrder(List<OrderModel> state) {
    return Visibility(
      visible: state.length > 0,
      replacement: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'Faça agora seu pedido 😉',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.length,
        itemBuilder: (BuildContext context, int index) {
          return HistoryPanel(order: state[index]);
        },
      ),
    );
  }
}
