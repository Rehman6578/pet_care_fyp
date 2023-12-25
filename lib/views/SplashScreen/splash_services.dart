

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashServices {


  void islogin(){

    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Get.toNamed('/Dashboard');
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.toNamed('/LoginScreen');
      });
    }

  }
}