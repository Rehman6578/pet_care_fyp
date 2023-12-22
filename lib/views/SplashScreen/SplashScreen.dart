import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override

    // this is the timer for the splash screen

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        Get.toNamed('/onboardingScreens');
      },
    );
    return MaterialApp(
      title: 'Splash Screen',
      home: Scaffold(
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
      ),
    );
  }
}
