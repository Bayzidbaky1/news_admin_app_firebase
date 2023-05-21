import 'package:amin_app/Widget/custom_button.dart';
import 'package:amin_app/Widget/custom_textFIeld.dart';
import 'package:amin_app/app_style/app_color.dart';
import 'package:amin_app/business_logic/auth_login.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatelessWidget {
  ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
            Text(
              "Forget Your Password?",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColor.button_color),
            ),
            // SizedBox(height: 20,),
            Text(
              "enter your email and reset password",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            SizedBox(height: 25,),
            customTextFIeld(
              _emailController, 
              "email", 
              "email", 
              Icons.email, 
              TextInputType.emailAddress, 
             (val) {
                if (val!.isEmpty) {
                  return "field can't be empty";
                } else if (val.length < 6) {
                  return "Please input a valid email";
                }
              },),
              SizedBox(height: 20,),
              CustomButton("Reset Password", 
              (){
              final email = _emailController.text;
              Auth().resetPass(email,context);
              _emailController.clear();
              })
                  ],
                ),
          )),
    );
  }
}
