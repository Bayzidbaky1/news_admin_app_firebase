
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyle{
   GetSnackBar faildSnackBar(message) => GetSnackBar(
        message: message,
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.warning_amber_rounded),
      );

  //success snackbar msg
  GetSnackBar successSnackBar(message) => GetSnackBar(
        message: message,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.done),
      );

      // bottom nav item

BottomNavigationBarItem navItem(icon, title) =>
    BottomNavigationBarItem(icon: Icon(icon), label: title);
}