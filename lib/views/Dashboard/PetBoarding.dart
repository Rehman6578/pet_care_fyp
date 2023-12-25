import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/Pets_Services/AddPets_toList.dart';
import '../../controllers/Pets_Services/BoardingPetsList.dart';
import '../../controllers/Pets_Services/petBoarding_Controller.dart';

class PetBoardingScreen extends StatelessWidget {
  PetBoardingScreen({super.key});

  final PetBoardingController controller = Get.put(PetBoardingController());
  final PetBoardingController containerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 248, 1),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 210,
            margin: EdgeInsets.only(left: 5, right: 5),
            // ADD SHADOW TO THE CONTAINER
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Row(
                    children: [
                      // add back button
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'Pet Boarding',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                // add conatiner
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTab('BoardingPets'),
                        buildTab('AddPet'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 700,
            child: Obx(() {
              if (containerController.selectedItem.value == 'BoardingPets') {
                return BoardingPetsList();
              } else {
                return AddPets_toList();
              }
            }),
          )
        ],
      ),
    );
  }

  buildTab(String text) {
    return Obx(
      () {
        bool isSelected = controller.selectedItem.value == text;

        return GestureDetector(
          onTap: () {
            controller.selectedItem.value = text;
          },
          child: Container(
            width: 155,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : null,
              borderRadius: BorderRadius.circular(isSelected ? 25 : 0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
