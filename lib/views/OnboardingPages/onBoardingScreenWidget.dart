import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';

import '../../const/images.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentPage = 0;

  List<Map<String, dynamic>> slides = [
    {
      "title": "Welcome to Pet Care",
      "description":
          "All types of services for your pet in one \n place, instantly searchable",
      "image": onboardingImage1,
    },
    {
      "title": "Proven experts",
      "description": "We interview every specialist before \n they get to work",
      "image": onboardingImage2,
    },
    {
      "title": "Reliable reviews",
      "description":
          "A review can be left only by a user \n who used the service.",
      "image": onboardingImage3,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: slides.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) => OnboardingSlideContent(
                slide: slides[index],
              ),
            ),
            Positioned(
              top: 20,
              right: 20.0,
              child: TextButton(
                onPressed: () {
                  Get.offNamed('/LoginScreen');
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80.0,
              left: 20.0,
              right: 20.0,
              child: RoundedButton(
                text: "Next",
                press: () {
                  if (currentPage < slides.length - 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                color: Colors.blueAccent,
                textColor: Colors.white,
                width: Get.width * 0.9,
              ),
            ),
            Positioned(
              bottom: 300.0,
              left: 20.0,
              right: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    height: 5.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? Colors.orangeAccent
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0),
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
  final Map<String, dynamic> slide;

  const OnboardingSlideContent({
    required this.slide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            slide['image'],
            fit: BoxFit.cover,
            height: 400.0,
            width: 400.0,
          ),
          const SizedBox(height: 20.0),
          Text(
            slide['title'],
            style: const TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Encode Sans',
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            slide['description'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
