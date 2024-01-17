import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/Models/OnboardingModel.dart';
import '../../WidgetCommon/Button.dart';
import '../../controllers/views_Controllers/OnboardingController.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: controller.slides.length,
              onPageChanged: (index) => controller.currentPage.value = index,
              itemBuilder: (context, index) => OnboardingSlideContent(
                slide: controller.slides[index],
              ),
            ),
            Positioned(
              top: 20,
              right: 20.0,
              child: Obx(() => TextButton(
                onPressed: controller.skipToLogin,
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16.0,
                  ),
                ),
              )),
            ),
            Positioned(
              bottom: 80.0,
              left: 20.0,
              right: 20.0,
              child: Center(
                child: Obx(() => RoundedButton(
                  text: 'Next',
                  press: () {
                    controller.nextPage();
                  },
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  width: 280,
                  height: 70,
                )),
              ),
            ),

            // add the indicator dots
            Positioned(
              bottom: 300.0,
              left: 20.0,
              right: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.slides.length,
                      (index) => Obx(
                        () => Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      height: 5.0,
                      width: 15.0,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? Colors.orangeAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingSlideContent extends StatelessWidget {
  final OnboardingSlide slide;

  const OnboardingSlideContent({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              slide.imageAssetPath,
              fit: BoxFit.cover,
              height: 400.0,
              width: 400.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              slide.title,
              style: const TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Encode Sans'),
            ),
            const SizedBox(height: 10.0),
            Text(
              slide.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
