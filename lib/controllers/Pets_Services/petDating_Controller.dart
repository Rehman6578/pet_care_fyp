// pet_controller.dart

import 'package:get/get.dart';
import '../../Utils/Models/PetsModel.dart';
import '../../const/images.dart';

class petDatingController extends GetxController {
  RxList<Pets> pets = <Pets>[].obs;


  @override
  void onInit() {
    super.onInit();
    // Initialize pets data (replace this with your data source)
    pets.addAll([
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),
      Pets(petName: 'Buddy ',imageUrl: onboardingImage1, petBreed: 'Golden Retirver', petAge: 2),


    ]);
  }







  void addPet(Pets pet) {
    pets.add(pet);
  }

  void removePet(Pets pet) {
    pets.remove(pet);
  }

  void updatePet(Pets pet) {
    // Find the index of the pet to be updated
    int index = pets.indexWhere((element) => element.id == pet.id);
    // Update the pet
    pets[index] = pet;
  }

  void clearAll() {
    pets.clear();
  }

}
