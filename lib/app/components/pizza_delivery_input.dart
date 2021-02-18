import 'package:flutter/material.dart';

class PizzaDeliveryInput extends StatelessWidget {
  final String label;
  final Icon suffixIcon;
  final Function suffixIconOnPressed;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final TextEditingController controler;
  final TextInputType keyboardType;

  const PizzaDeliveryInput({
    Key key,
    this.label,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.obscureText = false,
    this.validator,
    this.controler,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: keyboardType,
      controller: controler,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon,
                onPressed: suffixIconOnPressed,
              )
            : null,
      ),
    );
  }
}
