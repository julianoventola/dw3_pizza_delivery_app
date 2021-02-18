import 'package:dw3_pizza_delivery_app/app/components/pizza_delivery_button.dart';
import 'package:dw3_pizza_delivery_app/app/components/pizza_delivery_input.dart';
import 'package:dw3_pizza_delivery_app/app/modules/login/login_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  static const String ROUTE_PAGE = '/login';

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'pizza',
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        PizzaDeliveryInput(
                          //keyboardType: TextInputType.emailAddress,
                          controler: emailEditingController,
                          label: 'E-mail',
                          validator: (String value) {
                            if (value == null ||
                                value.isBlank ||
                                !value.isEmail) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                        ),
                        Obx(
                          () => PizzaDeliveryInput(
                            controler: passwordEditingController,
                            label: 'Senha',
                            suffixIcon: Icon(FontAwesome.key),
                            suffixIconOnPressed: controller.showHidePassword,
                            obscureText: controller.obscureText,
                            validator: (String value) {
                              if (value == null || value.length < 6) {
                                return 'A senha deve ser preenchida com pelo menos 6 digitos';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PizzaDeliveryButton(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          text: 'Login',
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          fontSize: 20,
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              controller.login(
                                emailEditingController.text,
                                passwordEditingController.text,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(RegisterPage.ROUTE_PAGE),
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
