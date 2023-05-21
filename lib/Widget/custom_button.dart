import 'package:flutter/material.dart';

import '../app_style/app_color.dart';

Widget CustomButton(title, onTap) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.white,
    borderRadius: BorderRadius.circular(50),
    child: Ink(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColor.button_color,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}