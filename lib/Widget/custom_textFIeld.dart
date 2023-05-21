import 'package:flutter/material.dart';

Widget customTextFIeld(
    controller, hintext, labeltext, prefixIcon, keyBoardType, validator,
    {obscureText = false}) {
  return TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintext,
          labelText: labeltext,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          )));
}
