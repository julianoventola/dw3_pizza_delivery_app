import 'package:dw3_pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:dw3_pizza_delivery_app/app/models/menu_model.dart';

class MenuRepository {
  final RestClient restClient;

  MenuRepository(this.restClient);

  Future<List<MenuModel>> findAll() async {
    final response =
        await restClient.get<List<MenuModel>>('/menu/', decoder: (response) {
      if (response is List) {
        return response.map<MenuModel>((m) => MenuModel.fromMap(m)).toList();
      }
      return null;
    });
    if (response.hasError) {
      String message = 'Erro ao buscar o menu';
      throw RestClientException(message: message);
    }

    return response.body;
  }
}
