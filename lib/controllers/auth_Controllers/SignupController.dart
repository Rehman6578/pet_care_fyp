import 'package:flutter/material.dart';
import 'package:get/get.dart';

// create a singupcontroller class extends getxcontroller
class SignupController extends GetxController {


  static SignupController get instance => Get.find();

  // create a variable for username
  final username = TextEditingController();
  // create a variable for email
  final email = TextEditingController();
  // create a variable for password
  final password = TextEditingController();
  // create a variable for confirm password
  var confirmPassword =TextEditingController();
  // create a variable for password visibility
  var isPasswordVisible = false.obs;
  // create a variable for confirm password visibility
  var isConfirmPasswordVisible = false.obs;
  // create a variable for password icon
  var passwordIcon = Icons.visibility_outlined.obs;
  // create a variable for confirm password icon
  var confirmPasswordIcon = Icons.visibility_outlined.obs;

  // create a function for password visibility
  void passwordVisibility() {
    // check if password is visible
    if (isPasswordVisible.value) {
      // if password is visible then change the icon to visibility_off
      passwordIcon.value = Icons.visibility_off_outlined;
    } else {
      // if password is not visible then change the icon to visibility
      passwordIcon.value = Icons.visibility_outlined;
    }
    // change the value of password visibility
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // create a function for confirm password visibility
  void confirmPasswordVisibility() {
    // check if confirm password is visible
    if (isConfirmPasswordVisible.value) {
      // if confirm password is visible then change the icon to visibility_off
      confirmPasswordIcon.value = Icons.visibility_off_outlined;
    } else {
      // if confirm password is not visible then change the icon to visibility
      confirmPasswordIcon.value = Icons.visibility_outlined;
    }
    // change the value of confirm password visibility
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void registerUser(String email, String password){


  }


}