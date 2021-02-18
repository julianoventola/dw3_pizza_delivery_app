import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rx<MessageModel> message) {
    ever<MessageModel>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
          titleText: Text(
            model.title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          messageText: Text(
            model.message,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          icon: model.type.icon(),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel(this.title, this.message, this.type);
}

enum MessageType { error, info }

extension MessageTypeColorExt on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800];
        break;
      case MessageType.info:
        return Colors.green[600];
        break;
      default:
        return Colors.black38;
    }
  }
}

extension MessageTypeIconExt on MessageType {
  Icon icon() {
    switch (this) {
      case MessageType.error:
        return Icon(
          Icons.error,
          size: 30,
          color: Colors.white,
        );
        break;
      case MessageType.info:
        return Icon(
          Icons.info,
          size: 30,
          color: Colors.white,
        );
        break;
      default:
        return Icon(
          Icons.check,
          size: 30,
          color: Colors.white,
        );
    }
  }
}
