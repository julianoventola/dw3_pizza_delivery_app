import 'package:dw3_pizza_delivery_app/app/helpers/loader_mixin.dart';
import 'package:dw3_pizza_delivery_app/app/helpers/messages_mixin.dart';
import 'package:dw3_pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:dw3_pizza_delivery_app/app/modules/splash/splash_page.dart';
import 'package:dw3_pizza_delivery_app/app/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final UserRepository _repository;
  final _obscureText = true.obs;
  final loading = false.obs;
  final message = Rx<MessageModel>();

  LoginController(this._repository);

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  get obscureText => _obscureText.value;

  void showHidePassword() => _obscureText.toggle();

  Future<void> login(String email, String password) async {
    try {
      loading(true);
      message(null);
      final user = await _repository.login(email, password);
      final sharedp = await SharedPreferences.getInstance();
      await sharedp.setString('user', user.toJson());
      loading(false);
      Get.offAllNamed(SplashPage.ROUTE_PAGE);
    } on RestClientException catch (e) {
      print(e);
      loading(false);
      message(MessageModel(
        'Erro',
        e.message,
        MessageType.error,
      ));
    } catch (e) {
      print(e);
      loading(false);
      message(MessageModel(
        'Erro',
        'Erro ao autenticar usuário',
        MessageType.error,
      ));
    }
  }
}
