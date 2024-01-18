
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashServices {

  static void islogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await auth.currentUser; // Await the asynchronous result

    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Get.toNamed('/Dashboard');
        Get.clearRouteTree();
      });
    } else {
     Get.toNamed('/onboardingScreen');
    }
  }
}