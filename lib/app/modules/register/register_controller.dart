import 'package:dw3_pizza_delivery_app/app/helpers/loader_mixin.dart';
import 'package:dw3_pizza_delivery_app/app/helpers/messages_mixin.dart';
import 'package:dw3_pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:dw3_pizza_delivery_app/app/repositories/user_repository.dart';
import 'package:dw3_pizza_delivery_app/app/view_models/register_user_input_model.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final UserRepository _repository;
  final _obscureText = true.obs;
  final _loading = false.obs;
  final _message = Rx<MessageModel>();

  RegisterController(this._repository);

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  get obscureText => _obscureText.value;

  void showHidePassword() => _obscureText.toggle();

  void registerUser(String name, String email, String password) async {
    try {
      _loading(true);
      _message(null);
      final inputModel = RegisterUserInputModel(
        name: name,
        email: email,
        password: password,
      );
      await _repository.saveUser(inputModel);
      _loading(false);
      _message(MessageModel(
        'Sucesso',
        'Usuário cadastrado com sucesso',
        MessageType.info,
      ));
      await 2.seconds.delay();
      Get.close(4);
    } on RestClientException catch (e) {
      print(e);
      _loading(false);
      _message(MessageModel(
        'Erro',
        e.message,
        MessageType.error,
      ));
    } catch (e) {
      print(e);
      _loading(false);
      _message(MessageModel(
        'Erro',
        'Erro ao cadastrar usuário',
        MessageType.error,
      ));
    }
  }
}
