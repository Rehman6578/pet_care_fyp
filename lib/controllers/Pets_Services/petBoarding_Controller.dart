import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Utils/Models/PetBoarding.dart';

class PetBoardingController extends GetxController {
  var selectedItem = "BoardingPets".obs;

  RxList<PetBoarding> petBoarding = <PetBoarding>[].obs;

  static PetBoardingController get instance => Get.find();

  // create a variable for username
  final Petname = TextEditingController();
  final petType = TextEditingController();
  final petBreed = TextEditingController();
  final ownerName = TextEditingController();
  final contactNumber = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // TODO: Initialize dummy pet list for pet boarding screen
    petBoarding.addAll([
      PetBoarding(
          petName: 'Dog',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Eclair',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Cat',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Macaron',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Rabbit',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Anadama',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Bird',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Begal',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Fish',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Bear Claw',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Turtle',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Bostock',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Hamster',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Bostock',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Guinea Pig',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Bostock',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
      PetBoarding(
          petName: 'Horse',
          petType: 'afghani',
          imageUrl:
              'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
          petBreed: 'Bostock',
          ownerName: 'jhon',
          contactNumber: '1234567890'),
    ]);
  }

  void addPet(PetBoarding pet) {
    petBoarding.add(pet);
  }
}
