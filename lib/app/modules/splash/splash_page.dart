import 'package:dw3_pizza_delivery_app/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends GetView<SplashController> {
  static const String ROUTE_PAGE = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => SplashScreen(
          seconds: 2,
          navigateAfterSeconds: controller.logged.toString(),
          title: new Text(
            'Pizza Delivery',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          image: new Image.asset('assets/images/logo.png'),
          backgroundColor: Colors.white,
          photoSize: 100.0,
          loaderColor: Colors.white,
        ),
      ),
    );
  }
}

// Scaffold(
//   appBar: AppBar(
//     title: Text('SplashPage'),
//     centerTitle: true,
//   ),
//   body: Container(
//     child: Obx(
//       () => Text(
//         controller.logged.toString(),
//       ),
//     ),
//   ),
// );
