import 'dart:math';

import 'package:dw3_pizza_delivery_app/app/helpers/loader_mixin.dart';
import 'package:dw3_pizza_delivery_app/app/helpers/messages_mixin.dart';
import 'package:dw3_pizza_delivery_app/app/models/menu_item_model.dart';
import 'package:dw3_pizza_delivery_app/app/models/user_model.dart';
import 'package:dw3_pizza_delivery_app/app/repositories/order_repository.dart';
import 'package:dw3_pizza_delivery_app/app/view_models/checkout_input_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartController extends GetxController
    with MessagesMixin, LoaderMixin {
  final OrderRepository _orderRepository;
  final RxList<MenuItemModel> flavorsSelected;
  final _user = Rx<UserModel>();
  final _address = ''.obs;
  final _paymentType = ''.obs;
  final addressTextEditingController = TextEditingController();
  final _message = Rx<MessageModel>();
  final _loading = false.obs;

  String get userName => _user.value?.name ?? '';
  String get address => _address.value;
  String get paymentType => _paymentType.value;

  double get totalPrice => flavorsSelected.fold(
        0,
        (total, item) => total += item.price,
      );

  ShoppingCartController(this.flavorsSelected, this._orderRepository);

  @override
  void onInit() async {
    super.onInit();
    messageListener(_message);
    loaderListener(_loading);
    final sharedp = await SharedPreferences.getInstance();
    _user(UserModel.fromJson(sharedp.getString('user')));
  }

  void changeAddress() async {
    await Get.defaultDialog(
      title: 'Endereço de entrega',
      content: TextField(
        controller: addressTextEditingController,
      ),
      cancel: RaisedButton(
        onPressed: () => Get.back(),
        color: Get.theme.primaryColor,
        child: Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      confirm: RaisedButton(
        onPressed: () {
          _address(addressTextEditingController.text);
          addressTextEditingController.clear();
          //Get.back();
        },
        color: Colors.green,
        child: Text(
          'Alterar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void changePaymentType() async {
    await Get.defaultDialog(
      title: 'Forma de Pagamento',
      content: Container(
        height: 150,
        child: RadioButtonGroup(
          labels: [
            'Cartão de Crédito',
            'Cartão de Débito',
            'Dinheiro',
          ],
          onSelected: (String value) => _paymentType(value),
        ),
      ),
      cancel: RaisedButton(
        onPressed: () => Get.back(),
        color: Get.theme.primaryColor,
        child: Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      confirm: RaisedButton(
        onPressed: () {
          Get.back();
        },
        color: Colors.green,
        child: Text(
          'Alterar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void checkout() async {
    if (address.isBlank) {
      _message(MessageModel(
        'Erro',
        'Endereço de entrega obrigatório!',
        MessageType.error,
      ));
    } else if (paymentType.isBlank) {
      _message(MessageModel(
        'Erro',
        'Forma de Pagamento obrigatória!',
        MessageType.error,
      ));
    } else {
      try {
        _loading(true);
        await _orderRepository.saveOrder(CheckoutInputModel(
          userId: _user.value.id,
          address: address,
          paymentType: paymentType,
          itemsId: flavorsSelected.map<int>((pizza) => pizza.id).toList(),
        ));
        _loading(false);
        _message(MessageModel(
          'Sucesso',
          'Pedido ${Random().nextInt(99999)} realizado com Sucesso',
          MessageType.info,
        ));
        await 2.seconds.delay();
        Get.close(2);
      } catch (e) {
        print(e);
        _loading(false);
        _message(MessageModel(
          'Erro',
          'Erro ao registrar pedido!',
          MessageType.error,
        ));
      }
    }
  }
}
