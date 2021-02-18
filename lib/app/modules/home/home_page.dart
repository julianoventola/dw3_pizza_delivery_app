import 'package:dw3_pizza_delivery_app/app/components/pizza_delivery_bottom_navigation.dart';
import 'package:dw3_pizza_delivery_app/app/modules/home/home_controller.dart';
import 'package:dw3_pizza_delivery_app/app/modules/home/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const String ROUTE_PAGE = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PizzaDeliveryBottomNavigation(0),
      body: Column(
        children: [
          HomeHeader(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    'Pizzas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PizzaChoice(
                      title: 'Pequena',
                      imageUrl: 'assets/images/slice.png',
                      onPressed: () => controller.openMenu('Pequena'),
                    ),
                    PizzaChoice(
                      title: 'Grande',
                      imageUrl: 'assets/images/fullpizza.png',
                      onPressed: () => controller.openMenu('Grande'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PizzaChoice extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function onPressed;

  const PizzaChoice({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 54,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
