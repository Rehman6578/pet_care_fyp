import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/UpdateProfile.dart';
import 'package:pet_care_fyp/views/GoogleMap/AddLocationScreen.dart';
import 'package:pet_care_fyp/firebase_options.dart';
import 'package:pet_care_fyp/views/Dashboard/GroomingScreen.dart';
import 'package:pet_care_fyp/views/Dashboard/MainDashboard.dart';
import 'package:pet_care_fyp/views/Dashboard/Navbar_Screen/add_pet_detail.dart';
import 'package:pet_care_fyp/views/Dashboard/PetDatingScreen.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/AddPetServices.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/PetServices/BoardingSerivce.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/PetServices/TrainingSerivce.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/PetServices/VeterinaryService.dart';
import 'package:pet_care_fyp/views/OnboardingPages/onBoardingScreenWidget.dart';
import 'package:pet_care_fyp/views/SearchScreens/nearme_veterinary_screen.dart';
import 'package:pet_care_fyp/views/SearchScreens/veterinarydoctor_card_screen.dart';
import 'package:pet_care_fyp/views/SplashScreen/SplashScreen.dart';
import 'package:pet_care_fyp/views/auth_screens/LoginScreen.dart';
import 'package:pet_care_fyp/views/auth_screens/RegisterScreen.dart';

import 'controllers/views_Controllers/OnboardingController.dart';
import 'dummy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pet Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      getPages: [
        GetPage(name: '/SplashScreen', page: () => const SplashScreen()),
        GetPage(name: '/onboardingScreen', page: () =>  OnboardingScreen()),
        GetPage(name: '/Dashboard', page: () => const Dashboard()),
        GetPage(name: '/LoginScreen', page: () => const LoginScreen()),
        GetPage(name: '/RegisterScreen', page: () => const RegisterScreen()),
        GetPage(name: '/EditProfile', page: () => const UpdateProfile()),
        GetPage(name: '/AddPetDetails', page: () => const AddPetDetail()),
        GetPage(name: '/NearVeterinaryScreen', page: () => const NearVeterinaryScreen()),
        GetPage(name: '/VeterinaryDocScreen', page: () =>  VeterinaryDocScreen()),
        GetPage(name: '/GroomingScreen', page: () => const GroomingScreen()),
        GetPage(name: '/PetDatingScreen', page: () => PetDating()),
        GetPage(name: '/AddPetServices', page: () => const AddPetServices()),
        GetPage(name: '/AddVeterinaryService', page: () => const AddVeterinaryService()),
        GetPage(name: '/TrainingService', page: () => const TrainingSerivce()),
        GetPage(name: '/BoardingService', page: () => const BoardingService()),
        GetPage(name: '/AddLocation', page: () => const AddLocation()),
        GetPage(name: '/Feedpage', page: ()=> const FeedScreen()),
      ],
    );
  }
}
