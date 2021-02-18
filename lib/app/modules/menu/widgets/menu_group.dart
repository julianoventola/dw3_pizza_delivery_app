import 'package:dw3_pizza_delivery_app/app/models/menu_model.dart';
import 'package:dw3_pizza_delivery_app/app/modules/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MenuGroup extends GetView<MenuController> {
  final formatter = NumberFormat('###.00', 'pt_br');
  final MenuModel _menu;

  MenuGroup(this._menu);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            _menu.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _menu.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = _menu.items[index];

            return ListTile(
              title: Text(
                item.name,
                style: TextStyle(
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              subtitle: Text(
                'R\$ ${formatter.format(item.price)}',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              trailing: Obx(() {
                final itemSelected = controller.flavorsSelected.contains(item);
                return IconButton(
                  icon: Icon(
                    itemSelected
                        ? FontAwesome.minus_circle
                        : FontAwesome.plus_square,
                    color: Get.theme.primaryColor,
                  ),
                  onPressed: () => controller.addItem(item),
                );
              }),
            );
          },
        )
      ],
    );
  }
}
