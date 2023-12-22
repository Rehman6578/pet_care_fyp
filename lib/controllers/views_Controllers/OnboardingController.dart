// onboarding_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Utils/Models/OnboardingModel.dart';
import '../../const/images.dart';

class OnboardingController extends GetxController {
  final RxList<OnboardingSlide> slides = <OnboardingSlide>[].obs;
  final RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    slides.value = [
      // Add your onboarding slides here
      OnboardingSlide(
        title: "Welcome to Pet Care",
        description: "All types of services for your pet in one \n place, instantly searchable",
        imageAssetPath: onboardingImage1,
      ),
      OnboardingSlide(
        title: "Proven experts",
        description: "We interview every specialist before \n they get to work",
        imageAssetPath: onboardingImage2,
      ),
      OnboardingSlide(
        title: "Reliable reviews",
        description: "A review can be left only by a user \n who used the service.",
        imageAssetPath: onboardingImage3,
      ),
    ];
  }

  void nextPage() {
    // if (currentPage.value < slides.length - 1) {
    //   currentPage.value++;
    // }

    if (currentPage.value < slides.length - 1) {
      currentPage.value++;
      // Update the PageView using PageController
      Get.find<PageController>().animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skipToLogin() {
    // Navigate to the login screen
    Get.offNamed('/LoginScreen');
  }
}
