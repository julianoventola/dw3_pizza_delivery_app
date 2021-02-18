import 'package:dw3_pizza_delivery_app/app/modules/home/home_page.dart';
import 'package:dw3_pizza_delivery_app/app/modules/orders/order_page.dart';
import 'package:dw3_pizza_delivery_app/app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PizzaDeliveryBottomNavigation extends StatelessWidget {
  final int _currentIndex;
  const PizzaDeliveryBottomNavigation(
    this._currentIndex, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Pedidos',
          icon: Icon(Icons.menu),
        ),
        BottomNavigationBarItem(
          label: 'Sair',
          icon: Icon(FontAwesome.sign_out),
        ),
      ],
      onTap: (int index) async {
        var page = await getActualPage();
        switch (index) {
          case 0:
            if (page == 0) {
              break;
            }
            setActualPage(0);
            Get.offAllNamed(HomePage.ROUTE_PAGE);
            break;
          case 1:
            if (page == 1) {
              break;
            }
            setActualPage(1);
            Get.offAllNamed(OrderPage.ROUTE_PAGE);
            break;
          case 2:
            final sharedp = await SharedPreferences.getInstance();
            sharedp.clear();
            setActualPage(0);
            Get.offAllNamed(SplashPage.ROUTE_PAGE);
            break;
          default:
        }
      },
    );
  }

  Future<int> getActualPage() async {
    final sharedp = await SharedPreferences.getInstance();
    return sharedp.getInt('tab');
  }

  void setActualPage(int index) async {
    final sharedp = await SharedPreferences.getInstance();
    sharedp.setInt('tab', index);
  }
}
