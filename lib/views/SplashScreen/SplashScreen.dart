// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pet_care_fyp/views/SplashScreen/splash_services.dart';
//
// class Splashscreen extends StatelessWidget {
//    Splashscreen({super.key});
//
//   SplashServices splashServices = SplashServices();
//
//   @override
//   void initState() {
//     super.initState();
//     splashServices.islogin();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Splash Screen',
//       home: Scaffold(
//         body: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/splashScreen.png'),
//               fit: BoxFit.cover,
//               // set margin bottom to 50 to see the red container underneath
//
//             ),
//           ),
//         ),
//         // now when user clicks on the screen, navigate to the next screen
//       ),
//     );
//   }
// }

// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care_fyp/views/SplashScreen/splash_services.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.islogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashScreen.png'),
            fit: BoxFit.cover,
            // set margin bottom to 50 to see the red container underneath

          ),
        ),
      ),
      // now when user clicks on the screen, navigate to the next screen
    );
  }
}

