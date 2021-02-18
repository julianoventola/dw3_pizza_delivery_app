import 'package:dw3_pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:dw3_pizza_delivery_app/app/models/order_model.dart';
import 'package:dw3_pizza_delivery_app/app/view_models/checkout_input_model.dart';

class OrderRepository {
  final RestClient _restClient;

  OrderRepository(this._restClient);

  Future<List<OrderModel>> findMyOrders(int userId) async {
    final result =
        await _restClient.get('/order/user/$userId', decoder: (response) {
      if (response is List) {
        return response.map<OrderModel>((order) {
          return OrderModel.fromMap(order);
        }).toList();
      }
      return null;
    });

    if (result.hasError) {
      print(result.statusText);
      throw RestClientException(message: 'Erro ao buscar pedidos');
    }
    return result.body;
  }

  Future<void> saveOrder(CheckoutInputModel model) async {
    switch (model.paymentType) {
      case 'Cartão de Crédito':
        model.paymentType = 'credito';
        break;
      case 'Cartão de Débito':
        model.paymentType = 'debito';
        break;
      case 'Dinheiro':
        model.paymentType = 'dinheiro';
        break;
    }

    final result = await _restClient.post('/order/', model.toMap());
    if (result.hasError) {
      print(result.statusText);
      throw RestClientException(message: 'Erro ao registrar pedido');
    }
  }
}
