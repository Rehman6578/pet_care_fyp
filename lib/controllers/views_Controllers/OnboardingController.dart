// // onboarding_stateful.dart
//
// import 'package:flutter/material.dart';
// import '../../Utils/Models/OnboardingModel.dart';
// import '../../const/images.dart';
// import '../../views/OnboardingPages/onBoardingScreenWidget.dart';
//
// class OnboardingStateful extends StatefulWidget {
//   @override
//   _OnboardingState createState() => _OnboardingState();
// }
//
// class _OnboardingState extends State<OnboardingStateful> {
//   int currentPage = 0;
//   List<OnboardingSlide> slides = [
//     // Define your slides here
//     OnboardingSlide(
//       title: "Welcome to Pet Care",
//       description:
//           "All types of services for your pet in one \n place, instantly searchable",
//       imageAssetPath: onboardingImage1,
//     ),
//     OnboardingSlide(
//       "title": "Proven experts",
//       "description": "We interview every specialist before \n they get to work",
//       "image": onboardingImage2,
//     ),
//     OnboardingSlide(
//       "title": "Reliable reviews",
//       "description":
//           "A review can be left only by a user \n who used the service.",
//       "image": onboardingImage3,
//     ),
//   ];
//
//   void nextPage() {
//     setState(() {
//       currentPage = (currentPage + 1) % slides.length;
//     });
//   }
//
//   void skipToLogin() {
//     setState(() {
//       currentPage = slides.length - 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return OnboardingScreen(
//       currentPage: currentPage,
//       slides: slides,
//       nextPage: nextPage,
//       skipToLogin: skipToLogin,
//     );
//   }
// }
