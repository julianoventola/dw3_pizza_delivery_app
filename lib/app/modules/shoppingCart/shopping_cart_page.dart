import 'package:dw3_pizza_delivery_app/app/components/pizza_delivery_button.dart';
import 'package:dw3_pizza_delivery_app/app/modules/shoppingCart/shopping_cart_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/shoppingCart/widgets/shopping_cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  const ShoppingCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Shopping Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: Container(),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 12,
                    color: Get.theme.primaryColor,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Nome'),
                      subtitle: Text(controller.userName),
                    ),
                    Divider(),
                    ShoppingCartItems(),
                    Divider(),
                    ListTile(
                      title: Text('Endereço de entrega'),
                      subtitle: Obx(() => Text(controller.address)),
                      trailing: TextButton(
                        onPressed: () => controller.changeAddress(),
                        child: Text(
                          'alterar',
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Forma de Pagamento'),
                      subtitle: Obx(() => Text(controller.paymentType)),
                      trailing: TextButton(
                        onPressed: () => controller.changePaymentType(),
                        child: Text('alterar',
                            style: TextStyle(
                              color: Get.theme.primaryColor,
                            )),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: PizzaDeliveryButton(
                        text: 'Finalizar Pedido',
                        fontSize: 16,
                        onPressed: () => controller.checkout(),
                        width: Get.mediaQuery.size.width * 0.9,
                        height: Get.mediaQuery.size.height * 0.06,
                        textColor: Colors.white,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
