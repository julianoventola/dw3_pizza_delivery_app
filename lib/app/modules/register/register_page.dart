import 'package:dw3_pizza_delivery_app/app/components/pizza_delivery_button.dart';
import 'package:dw3_pizza_delivery_app/app/components/pizza_delivery_input.dart';
import 'package:dw3_pizza_delivery_app/app/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  static const String ROUTE_PAGE = '/register';

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

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
                          controler: nameEditingController,
                          label: 'Nome e Sobrenome',
                          validator: (String value) {
                            if (value == null ||
                                value.isBlank ||
                                value.split(" ").length < 2) {
                              return 'Nome e Sobrenome inválido';
                            }
                            return null;
                          },
                        ),
                        PizzaDeliveryInput(
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
                        Obx(
                          () => PizzaDeliveryInput(
                            controler: confirmPasswordEditingController,
                            label: 'Confirmar Senha',
                            suffixIcon: Icon(FontAwesome.key),
                            suffixIconOnPressed: controller.showHidePassword,
                            obscureText: controller.obscureText,
                            validator: (String value) {
                              if (value != passwordEditingController.text) {
                                return '"Senha" e "Confirmar Senha" devem ser iguais';
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
                          text: 'Salvar',
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          fontSize: 20,
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              final name = nameEditingController.text;
                              final email = emailEditingController.text;
                              final password = passwordEditingController.text;
                              controller.registerUser(name, email, password);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PizzaDeliveryButton(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          text: 'Voltar',
                          textColor: Colors.black,
                          fontSize: 20,
                          onPressed: () {
                            Get.back();
                          },
                        ),
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
