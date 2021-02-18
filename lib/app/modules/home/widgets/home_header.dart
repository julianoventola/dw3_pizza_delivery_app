import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Stack(
        children: [
          Container(
            height: 300,
            width: Get.mediaQuery.size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.none,
                image: AssetImage(
                  'assets/images/topoCardapio.png',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: Get.mediaQuery.size.width,
            child: Container(
              height: 200,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
