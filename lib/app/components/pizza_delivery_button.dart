import 'package:flutter/material.dart';

class PizzaDeliveryButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final String text;
  final Color color;
  final Color textColor;
  final Function onPressed;

  const PizzaDeliveryButton({
    Key key,
    @required this.width,
    @required this.height,
    @required this.text,
    @required this.onPressed,
    this.color,
    this.textColor = Colors.white,
    this.fontSize = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: color,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
