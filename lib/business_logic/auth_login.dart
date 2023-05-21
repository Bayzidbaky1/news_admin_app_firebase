import 'package:amin_app/app_style/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../pages/route/route.dart';

class Auth {
  registration(
    userName,
    email,
    password,
  ) async {
    print(userName);
    print(email);
    print(password);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var authCredential = credential.user;
      if (authCredential!.uid.isNotEmpty) {
        Get.back();
        Get.showSnackbar(
            AppStyle().successSnackBar("Registration Successfully"));
        Get.toNamed(home);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar(
            AppStyle().faildSnackBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyle()
            .faildSnackBar('The account already exists for that email.'));
      }
    } catch (e, s) {
      print(e);
      print(s);
      Get.back();
      Get.showSnackbar(AppStyle().faildSnackBar('Something Went wrong'));
    }
  }

  login(email, password) async {
    print(email);
    print(password);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var authCredential = credential.user;
      if (authCredential!.uid.isNotEmpty) {
        Get.toNamed(home);
        Get.showSnackbar(AppStyle().successSnackBar("login Succesfull"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(
            AppStyle().faildSnackBar("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(
            AppStyle().faildSnackBar("Wrong password provided for that user."));
      }
    } catch (e, s) {
      Get.showSnackbar(AppStyle().faildSnackBar('Something Went wrong'));
      print(e);
      print(s);
    }
  }

  resetPass(email,context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
