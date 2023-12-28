import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/controllers/Image_Controller/ImageController.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';

class TrainingSerivce extends StatefulWidget {
  const TrainingSerivce({super.key});

  @override
  State<TrainingSerivce> createState() => _TrainingSerivceState();
}

class _TrainingSerivceState extends State<TrainingSerivce> {
  final TextEditingController _preferredLocationController = TextEditingController();
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  MultiSelectionController petController = MultiSelectionController();
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  String? selectedYear;
  String? selectedTrainingpets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // add text field for image
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  'Upload image of your lovely house/compound where pets will be trained.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Center(
                  child: Stack(
                    children: [
                      Card(
                        elevation: 8.0,
                        child: Container(
                          height: Get.height * 0.25,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                            image: imagePickerController.imagePath.value == ''
                                ? const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/trainingprofile.png'))
                                : DecorationImage(
                                    image: FileImage(File(imagePickerController
                                        .imagePath.value
                                        .toString())),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            imagePickerController.getImage();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                'Add lovely images of your pets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // add three container for image
              Container(
                height: Get.height * 0.1,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(()=>
                        Stack(
                          children: [
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                image: imagePickerController.imagePath.value == ''
                                    ?const DecorationImage(
                                    image:
                                    AssetImage('assets/images/petimage.png'))
                                    : DecorationImage(
                                  image: FileImage(File(imagePickerController
                                      .imagePath.value
                                      .toString())),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // add shor addimage icon to add image of 20 * 20
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  imagePickerController.getPetsImage();

                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                    ),
                    Obx(()=> Stack(
                      children: [
                        Container(
                          height: Get.height * 0.2,
                          width: Get.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            image: imagePickerController.imagePath.value == ''
                                ? const DecorationImage(
                                image:
                                AssetImage('assets/images/petimage.png'))
                                : DecorationImage(
                              image: FileImage(File(imagePickerController
                                  .imagePath.value
                                  .toString())),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              imagePickerController.getImage();
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                    Obx(()=>
                        Stack(
                          children: [
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                image: imagePickerController.imagePath.value == ''
                                    ?  const DecorationImage(
                                    image:
                                    AssetImage('assets/images/petimage.png'))
                                    : DecorationImage(
                                  image: FileImage(File(imagePickerController
                                      .imagePath.value
                                      .toString())),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  imagePickerController.getImage();
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              const Text(
                'Add service name or title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter service name',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Add service description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Give an overview of the service you offer.'
                          ' Tell us what a day look like and some fun things pets will get to do.',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'What results can the owner expect?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText:
                          'Detail what type of results can the pet owner expect, eg: '
                          'Sit, Stay, Come, Down, Heel, Leave it, etc.',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'What pets do you train?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // add multiselect dropdown
              const SizedBox(
                height: 10,
              ),
              DropDownMultiSelect(
                options: petController.allPetTypes,
                whenEmpty: 'eg: Dog, Cat, Reptile',
                onChanged: (value) {
                  petController.selectedPetTypes.value = value;
                  petController.selectedOption.value = "";

                  for (var value1 in petController.selectedPetTypes.value) {
                    petController.selectedOption.value =
                        "${petController.selectedOption.value}$value1";
                  }
                },
                selectedValues: petController.selectedPetTypes.value,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'How many year have you been a trainer?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // add dropdown to select year
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: DropdownButton<String>(
                    hint: const Text(
                      'Select year',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    isExpanded: true,
                    value: selectedYear,
                    borderRadius: BorderRadius.circular(10.0),
                    items: petController.years.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'What pet training course do you provide?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropDownMultiSelect(
                  whenEmpty:
                      'eg: Basic Obedience training, Behavioral Training',
                  options: petController.petTrainingCourse,
                  selectedValues: petController.selectedTrainingCourse,
                  onChanged: (Value) {
                    petController.selectedTrainingCourse.value = Value;
                    petController.selectedTrainingCourseOption.value = "";

                    for (var value1
                        in petController.selectedTrainingCourse.value) {
                      petController.selectedTrainingCourseOption.value =
                          "${petController.selectedTrainingCourseOption.value}$value1";
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'How many pets can you train at one time?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: DropdownButton<String>(
                    hint: const Text(
                      'eg: 1,5,9',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    isExpanded: true,
                    value: selectedTrainingpets,
                    borderRadius: BorderRadius.circular(10.0),
                    items: petController.years.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedTrainingpets = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                'What type fo classes do you offer?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropDownMultiSelect(
                  whenEmpty: 'eg: Private/Group dog training lessons',
                  options: petController.petTrainingClasses,
                  selectedValues: petController.selectedTrainingClasses,
                  onChanged: (Value) {
                    petController.selectedTrainingClasses.value = Value;
                    petController.selectedTrainingClassesOption.value = "";

                    for (var value2
                        in petController.selectedTrainingClasses.value) {
                      petController.selectedTrainingClassesOption.value =
                          "${petController.selectedTrainingClassesOption.value}$value2";
                    }
                  }),

              // add textfield for price
              const SizedBox(
                height: 10,
              ),
              const Text(
                'What is your price per session?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                decoration: const InputDecoration(
                  hintText: 'Enter price',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferred Search Location:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _preferredLocationController,
                        decoration: const InputDecoration(
                          hintText: 'Enter preferred search location',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      // Input for Price
                      const SizedBox(height: 16.0),
                      // Input for Street Name
                      const Text(
                        'Street Name/No:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _streetNameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter street name/number',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Input for City
                      const Text(
                        'City:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          hintText: 'Enter city',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Input for State
                      const Text(
                        'State:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _stateController,
                        decoration: const InputDecoration(
                          hintText: 'Enter state',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Input for Postal Code
                      const Text(
                        'Postal Code:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _postalCodeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter postal code',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Map View
                      const Text(
                        'Location on Map:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        height: Get.height * 0.4,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Center(
                child: RoundedButton(
                  text: 'Add Service',
                  press: () {},
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  width: Get.width * 0.9,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
