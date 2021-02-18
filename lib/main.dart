import 'package:dw3_pizza_delivery_app/app/config/application_bindings.dart';
import 'package:dw3_pizza_delivery_app/app/config/ui_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MyApp());
}

// class MySplashScreen extends StatefulWidget {
//   @override
//   _MySplashScreenState createState() => new _MySplashScreenState();
// }

// class _MySplashScreenState extends State<MySplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return new SplashScreen(
//       seconds: 2,
//       navigateAfterSeconds: MyApp(),
//       title: new Text(
//         'Pizza Delivery',
//         style: new TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 20.0,
//         ),
//       ),
//       image: new Image.asset('assets/images/logo.png'),
//       backgroundColor: Colors.white,
//       photoSize: 100.0,
//       loaderColor: Colors.white,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: UiConfig.appTheme,
      getPages: UiConfig.routes,
      initialBinding: ApplicationnBindings(),
    );
  }
}
