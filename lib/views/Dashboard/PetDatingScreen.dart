import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/Models/PetsModel.dart';
import '../../WidgetCommon/Button.dart';
import '../../controllers/Pets_Services/petDating_Controller.dart';

class PetDating extends StatelessWidget {

  // start work from pet dating screen tomorrow

  final petDatingController petDating = Get.put(petDatingController());
  


  PetDating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Dating"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Available Pets for Dating',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Obx(
            () => Column(
              children: petDating.pets.map((pet) {
                return buildPetCard(pet);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPetCard(Pets pet) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(pet.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.petName,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  pet.petBreed,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  '${pet.petAge} years old',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          RoundedButton(
              text: '',
              press: () {},
              color: Colors.blueAccent,
              textColor: Colors.white,
              width: 150),
        ],
      ),
    );
  }
}
