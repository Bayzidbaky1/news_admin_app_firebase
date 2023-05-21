import 'package:amin_app/business_logic/auth_login.dart';
import 'package:amin_app/pages/route/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/custom_button.dart';
import '../../Widget/custom_textFIeld.dart';
import '../../app_style/app_color.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Register Here.",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.button_color),
              ),
              SizedBox(
                height: 20,
              ),
              customTextFIeld(
                _nameController,
                "Name",
                "Name",
                Icons.person,
                TextInputType.text,
                (val) {
                  if (val!.isEmpty) {
                    return "field can't be empty";
                  } else if (val.length < 4) {
                    return "Name can't be less than 4 digit.";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              customTextFIeld(
                _emailController,
                "Email",
                "Email",
                Icons.email,
                TextInputType.emailAddress,
                (val) {
                  if (val!.isEmpty) {
                    return "field can't be empty";
                  } else if (val.length < 6) {
                    return "Please input a valid email";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              customTextFIeld(
                _passwordController,
                "Password",
                "Password",
                Icons.password_outlined,
                TextInputType.text,
                obscureText: true,
                (val) {
                  if (val!.isEmpty) {
                    return "field can't be empty";
                  } else if (val.length < 4) {
                    return "password can't be less than 4";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Forget your password? ',
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  children: [
                    TextSpan(
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(reset),
                        text: ' Reset Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.button_color,
                            fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton("Regiser", () {
                if (_formKey.currentState!.validate()) {
                  final userName = _nameController.text;
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  Auth().registration(userName, email, password);
                  _nameController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                } else {
                  print('faield');
                }
              }),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: 'Already have account? ',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(login),
                        text: ' Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.button_color,
                            fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
