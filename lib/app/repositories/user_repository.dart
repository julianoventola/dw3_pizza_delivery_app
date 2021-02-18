import 'package:dw3_pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:dw3_pizza_delivery_app/app/models/user_model.dart';
import 'package:dw3_pizza_delivery_app/app/view_models/register_user_input_model.dart';

class UserRepository {
  final RestClient restClient;

  UserRepository(this.restClient);

  Future<UserModel> login(String email, String password) async {
    final response = await restClient.post(
      '/user/auth',
      {
        'email': email,
        'password': password,
      },
      decoder: (response) {
        if (response != "") {
          return UserModel.fromMap(response);
        }
      },
    );
    if (response.hasError) {
      String message = 'Erro ao authenticar usuário';
      if (response.statusCode == 403) {
        message = 'Usuário ou senha inválido(s)';
      }

      throw RestClientException(message: message);
    }

    return response.body;
  }

  Future<void> saveUser(RegisterUserInputModel model) async {
    final response = await restClient.post(
      '/user/',
      {
        'name': model.name,
        'email': model.email,
        'password': model.password,
      },
    );
    if (response.hasError) {
      throw RestClientException(message: 'Erro ao registrar usuário');
    }
  }
}
