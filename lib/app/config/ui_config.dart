import 'package:dw3_pizza_delivery_app/app/modules/home/home_bindings.dart';
import 'package:dw3_pizza_delivery_app/app/modules/home/home_page.dart';
import 'package:dw3_pizza_delivery_app/app/modules/login/login_bindings.dart';
import 'package:dw3_pizza_delivery_app/app/modules/login/login_page.dart';
import 'package:dw3_pizza_delivery_app/app/modules/orders/order_bindings.dart';
import 'package:dw3_pizza_delivery_app/app/modules/orders/order_page.dart';
import 'package:dw3_pizza_delivery_app/app/modules/register/register_bindings.dart';
import 'package:dw3_pizza_delivery_app/app/modules/register/register_page.dart';
import 'package:dw3_pizza_delivery_app/app/modules/splash/splash_bindings.dart';
import 'package:dw3_pizza_delivery_app/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiConfig {
  UiConfig._();

  static final appTheme = ThemeData(
    primaryColor: Color(0xFF9D0000),
    primarySwatch: Colors.red,
  );

  static final routes = <GetPage>[
    GetPage(
      name: SplashPage.ROUTE_PAGE,
      page: () => SplashPage(),
      binding: SplashBinginds(),
    ),
    GetPage(
      name: HomePage.ROUTE_PAGE,
      page: () => HomePage(),
      binding: HomeBinginds(),
    ),
    GetPage(
      name: LoginPage.ROUTE_PAGE,
      page: () => LoginPage(),
      binding: LoginBinginds(),
    ),
    GetPage(
      name: RegisterPage.ROUTE_PAGE,
      page: () => RegisterPage(),
      binding: RegisterBinginds(),
    ),
    GetPage(
      name: OrderPage.ROUTE_PAGE,
      page: () => OrderPage(),
      binding: OrdersBinginds(),
    )
  ];
}
